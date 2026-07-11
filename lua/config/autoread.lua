local M = {}

local timer = assert((vim.uv or vim.loop).new_timer())

local function checktime(buffer)
    if not vim.api.nvim_buf_is_valid(buffer)
        or not vim.api.nvim_buf_is_loaded(buffer)
        or vim.bo[buffer].modified
        or vim.bo[buffer].buftype ~= ''
        or vim.api.nvim_buf_get_name(buffer) == '' then
        return
    end

    vim.api.nvim_buf_call(buffer, function()
        vim.cmd.checktime()
    end)
end

function M.setup()
    vim.opt.autoread = true

    local group = vim.api.nvim_create_augroup('agent_file_reload', { clear = true })
    vim.api.nvim_create_autocmd({
        'FocusGained',
        'WinEnter',
        'BufEnter',
        'TermLeave',
        'TermClose',
        'CursorHold',
    }, {
        group = group,
        callback = function()
            timer:stop()
            timer:start(100, 0, vim.schedule_wrap(function()
                for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
                    checktime(buffer)
                end
            end))
        end,
    })
end

return M
