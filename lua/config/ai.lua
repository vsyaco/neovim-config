local M = {
    provider = 'codex',
}

local providers = {
    { name = 'codex', label = 'Codex' },
    { name = 'opencode', label = 'OpenCode' },
}

local function cli()
    return require('sidekick.cli')
end

function M.toggle()
    cli().toggle({ name = M.provider, focus = true })
end

function M.send_selection()
    cli().send({
        name = M.provider,
        msg = '{file}\nLines: {selection_range}\n{selection}',
        focus = true,
    })
end

function M.select_provider()
    vim.ui.select(providers, {
        prompt = 'AI provider',
        format_item = function(provider)
            local active = provider.name == M.provider and ' (active)' or ''
            return provider.label .. active
        end,
    }, function(provider)
        if not provider then
            return
        end

        cli().hide({ name = M.provider })
        M.provider = provider.name
        cli().show({ name = M.provider, focus = true })
    end)
end

function M.setup()
    require('sidekick').setup({
        nes = { enabled = false },
        copilot = {
            status = {
                enabled = false,
                level = vim.log.levels.OFF,
            },
        },
        cli = {
            watch = true,
            picker = 'telescope',
            win = {
                layout = 'right',
            },
            mux = {
                enabled = false,
            },
            tools = {
                codex = {
                    cmd = { 'zsh', '-ic', 'codex' },
                },
                opencode = {
                    cmd = { 'opencode' },
                },
            },
            context = {
                selection_range = function(context)
                    if not context.range then
                        return nil
                    end

                    return ('%d-%d'):format(context.range.from[1], context.range.to[1])
                end,
            },
        },
    })

    local sidekick_config = require('sidekick.config')
    sidekick_config.cli.tools = {
        codex = sidekick_config.cli.tools.codex,
        opencode = sidekick_config.cli.tools.opencode,
    }

    for _, key in ipairs({ '<M-a>', '<M-ф>' }) do
        vim.keymap.set({ 'n', 't' }, key, M.toggle, { desc = 'Toggle active AI agent' })
        vim.keymap.set('x', key, M.send_selection, { desc = 'Send selection to active AI agent' })
    end

    vim.keymap.set('n', '<leader>aa', M.select_provider, { desc = 'Select AI provider' })
end

return M
