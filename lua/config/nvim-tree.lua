local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
    vim.keymap.set('n', '<C-2>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- Keys to switch between nvim-tree and buffer
    vim.keymap.set('n', '<C-0>', ':NvimTreeFocus<CR>', opts('Focus'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    ---
    update_focused_file = {
        enable = true,
    }
}
