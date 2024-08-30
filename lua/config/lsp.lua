local lsp = require('lsp-zero')

-- (Optional) Configure intelephense for neovim with a license key
local get_intelephense_license = function()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))

    local content = f:read("*a")

    f:close()

    return string.gsub(content, "%s+", "")
end

lsp.configure("intelephense", {

    on_attach = lsp.on_attach,

    init_options = {

        licenceKey = get_intelephense_license()

    }

})

-- End of intelephense configuration

lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    servers = {
        ['rust_analyzer'] = { 'rust' },
    }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup()

vim.diagnostic.config({
    --virtual_text = false
})
