local M = {
    provider = 'codex',
    layout = 'right',
}

local providers = {
    { name = 'codex', label = 'Codex' },
    { name = 'opencode', label = 'OpenCode' },
}

local function cli()
    return require('sidekick.cli')
end

local function active_terminal()
    local states = require('sidekick.cli.state').get({
        attached = true,
        name = M.provider,
    })

    return states[1] and states[1].terminal or nil
end

function M.toggle()
    local terminal = active_terminal()

    if terminal and terminal:is_focused() then
        cli().hide({ name = M.provider })
        return
    end

    cli().show({ name = M.provider, focus = true })
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

function M.switch_layout()
    M.layout = M.layout == 'right' and 'float' or 'right'
    require('sidekick.config').cli.win.layout = M.layout

    local terminal = active_terminal()
    if terminal then
        local was_open = terminal:is_open()
        terminal:hide()
        terminal.opts.layout = M.layout

        if was_open then
            terminal:show():focus()
        end
    end

    vim.notify('AI layout: ' .. M.layout)
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
                layout = M.layout,
            },
            mux = {
                backend = 'zellij',
                enabled = true,
                create = 'terminal',
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
    vim.keymap.set('n', '<leader>as', M.switch_layout, { desc = 'Switch AI panel layout' })
end

return M
