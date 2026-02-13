local M = {}

function M.format_lsp()
    vim.lsp.buf.format({
        filter = function(client)
            -- Keep PHP formatting deterministic: use Intelephense for LSP formatting.
            if vim.bo.filetype == "php" then
                return client.name == "intelephense"
            end
            return true
        end,
    })
end

local function find_phpcbf(startpath)
    local dir = vim.fs.dirname(startpath)
    if not dir or dir == "" then
        return nil
    end

    -- Prefer project-local phpcbf if present (composer install).
    local local_bins = vim.fs.find({ "vendor/bin/phpcbf" }, { path = dir, upward = true })
    if local_bins and local_bins[1] then
        return local_bins[1]
    end

    if vim.fn.executable("phpcbf") == 1 then
        return "phpcbf"
    end

    -- Check global composer path (handle the alias location)
    local global_phpcbf = vim.fn.expand("~/.config/composer/vendor/bin/phpcbf")
    if vim.fn.executable(global_phpcbf) == 1 then
        return global_phpcbf
    end

    return nil
end

local function find_phpcs_ruleset(startpath)
    local dir = vim.fs.dirname(startpath)
    if not dir or dir == "" then
        return nil
    end

    -- Common PHP_CodeSniffer ruleset filenames (searched upward).
    local rulesets = vim.fs.find(
        { "phpcs.xml", "phpcs.xml.dist", ".phpcs.xml", ".phpcs.xml.dist" },
        { path = dir, upward = true }
    )

    if rulesets and rulesets[1] then
        return rulesets[1]
    end

    return nil
end

function M.format_php_with_phpcbf()
    local buf = vim.api.nvim_get_current_buf()
    local file = vim.api.nvim_buf_get_name(buf)
    if not file or file == "" then
        return false
    end

    local phpcbf = find_phpcbf(file)
    if not phpcbf then
        vim.notify("phpcbf not found, falling back to LSP formatting", vim.log.levels.INFO)
        return false
    end

    -- Save first; phpcbf edits the file in-place.
    vim.cmd("update")

    local ruleset = find_phpcs_ruleset(file)
    local standard_arg = ruleset and ("--standard=" .. ruleset) or "--standard=PSR12"
    local cwd = ruleset and vim.fs.dirname(ruleset) or vim.fs.dirname(file)

    vim.notify("Formatting with phpcbf (" .. (ruleset and "ruleset" or "PSR12") .. ")...", vim.log.levels.INFO)

    vim.system({ phpcbf, standard_arg, file }, { text = true, cwd = cwd }, function(res)
        vim.schedule(function()
            -- Reload file if changed on disk.
            if vim.api.nvim_buf_is_valid(buf) and not vim.bo[buf].modified then
                vim.cmd("checktime")
            end

            -- phpcbf exit codes: 0 = no changes, 1 = changes fixed, >1 = actual failure
            if res.code > 1 then
                vim.notify(
                    ("phpcbf failed (exit %d) for %s\n%s"):format(res.code, vim.fn.fnamemodify(file, ":t"), res.stderr or ""),
                    vim.log.levels.WARN
                )
            elseif res.code == 1 then
                vim.notify("phpcbf: Fixed PSR-12 violations", vim.log.levels.INFO)
            end
        end)
    end)

    return true
end

function M.format_and_update()
    if vim.bo.filetype == "php" and M.format_php_with_phpcbf() then
        return
    end

    M.format_lsp()
    vim.cmd("update")
end

return M

