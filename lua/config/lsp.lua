local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Copilot Setup

require('copilot').setup({
    suggestion = {enabled = false},
    panel = {enabled = false},
  })

require('copilot_cmp').setup()

require("cmp").setup{

}


-- Cmp setup

-- local cmp = require('cmp')

-- cmp.setup({
--     sources = {
--         {name = 'copilot'},
--         {name = 'nvim_lsp'},
--     },
--   mapping = {
--     ['<CR>'] = cmp.mapping.confirm({
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false
--     }),
--   }
-- })