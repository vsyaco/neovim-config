local builtin = require("neo-tree")

-- REQUIRED
builtin.setup({
    sources = { "filesystem", "git_status" },
    enable_git_status = true,
    close_if_last_window = true,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
            hide_by_name = {
                ".git"
            },
            always_show_by_pattern = {
                ".env*",
            }
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
    },
    window = {
        position = "left",
    }
})
-- REQUIRED
