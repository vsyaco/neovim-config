return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        auto_install = true, 
        ensure_installed = { 
            "c", 
            "lua", 
            "vim", 
            "vimdoc", 
            "query", 
            "markdown", 
            "markdown_inline", 
        },
    }
}
