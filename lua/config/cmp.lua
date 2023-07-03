local cmp = require("cmp")         -- The complete engine
local luasnip = require("luasnip") -- The snippet engine
local lspkind = require("lspkind") -- Pretty icons on the automplete list

-- This is almost verbatin from the Github Page
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        -- Navigate the dropdown list snippet
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Use arrows too
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        -- Scroll the documentation
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        -- Enter select the item
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        -- Use <Tab> as the automplete trigger
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    -- Where to look for auto-complete items.
    sources = {
        {name = "copilot", max_item_count = 3, group_index = 2,},
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
    },
    -- Improve the dropdown list display: Show incons and show where
    -- the automcomplete sugestion comes from
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "[Buf]",
                nvim_lsp = "[Lsp]",
                luasnip = "[Snip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Lat]",
            },
        }),
    },
    -- Show borders like the LSP autocomplte
    windows = {
        documentation = {
            border = { "‚ï≠", "‚îÄ", "‚ïÆ", "‚îÇ", "‚ïØ", "‚îÄ", "‚ï∞", "‚îÇ" },
        },
    },
    -- Can be anoying so experiment with it
    experimental = {
        ghost_text = true,
    },
})