return {
    -- Appearance
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },

    -- Navigation and UI
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = true,
        cmd = { "Neotree" },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            require("neo-tree").setup({
                sources = { "filesystem", "git_status" },
                enable_git_status = true,
                close_if_last_window = true,
                filesystem = {
                    hijack_netrw_behavior = "open_default",
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = false,
                        hide_by_name = { ".git" },
                        always_show_by_pattern = { ".env*" },
                    },
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                },
                window = {
                    position = "left",
                },
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    -- LSP and Completion
    {
        "williamboman/mason.nvim"
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            keymap = {
                preset = 'super-tab',
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<S-CR>"] = {}
            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        'nvim-treesitter/nvim-treesitter',
    },
    -- Git
    { 'tpope/vim-fugitive' },
    { "airblade/vim-gitgutter" },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'vsyaco/git-workflow.nvim',
        dir = '~/Documents/projects/git-workflow.nvim',  -- Local development
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'sindrets/diffview.nvim',
            'tpope/vim-fugitive',
        },
        config = function()
            require('git-workflow').setup()
        end,
    },

    -- Editing
    {
        'mg979/vim-visual-multi',
        branch = 'master',
    },

    -- Help
    {
        'vsyaco/keymaps-help.nvim',
        opts = {
            show_on_startup = false,
        },
    },
}
