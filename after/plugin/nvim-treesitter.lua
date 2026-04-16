-- nvim-treesitter new API (Neovim 0.12+)
-- The plugin now only manages parser installation.
-- Highlighting is handled by Neovim's built-in vim.treesitter.

require('nvim-treesitter').install({
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'markdown',
    'markdown_inline',
    'yaml',
    'json',
    'php',
    'html',
    'css',
})

-- Enable treesitter highlighting for common filetypes
-- For large files (>10MB) highlighting is skipped
local filetypes = {
    'c', 'lua', 'vim', 'markdown', 'yaml', 'json', 'php', 'html', 'css',
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    callback = function(args)
        local max_filesize = 100 * 1024 * 1024 -- 100MB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if ok and stats and stats.size > max_filesize then
            return
        end
        vim.treesitter.start()
    end,
})
