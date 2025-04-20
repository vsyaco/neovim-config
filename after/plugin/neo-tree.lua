local builtin = require("neo-tree")

-- REQUIRED
builtin.setup({
    close_if_last_window = true,
    filesystem = {
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
