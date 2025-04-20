# Neovim Configuration

A modern, Lua-based Neovim configuration focused on productivity and a clean development experience. This configuration uses lazy.nvim for plugin management and includes carefully selected plugins for file navigation, code completion, LSP integration, and more.

## Features

- 🚀 Fast startup with lazy loading plugins
- 🔍 Fuzzy finding with Telescope
- 🌲 File explorer with Neo-tree
- ✨ Modern code completion with blink.cmp
- 📝 LSP integration for code intelligence
- 🎨 Syntax highlighting with Treesitter
- ⚡ Quick file navigation with Harpoon
- 🖥️ Floating terminal for command execution
- 📊 Multi-cursor editing with vim-visual-multi

## Requirements

- Neovim >= 0.8.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended for icons)
- Node.js (for some LSP servers)

## Installation

1. Back up your existing Neovim configuration (if any):

```bash
mv ~/.config/nvim/ ~/.config/nvim_backup/
```

2. Clone this repository:

```bash
git clone https://github.com/vsyaco/neovim-config.git ~/.config/nvim/
```

3. Start Neovim:

```bash
nvim
```

The configuration will automatically install the lazy.nvim plugin manager and all configured plugins on the first run.

4. Install language servers using Mason:

```
:Mason
```

Navigate through the UI to install the language servers you need (e.g., lua_ls, intelephense, pyright, tsserver).

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json           # Plugin version lock file
├── after/                   # Post-load configurations
│   └── plugin/              # Plugin-specific configurations
├── lsp/                     # LSP server specific configurations
└── lua/
    ├── config/              # Core configuration
    │   ├── keymappings.lua  # Key bindings
    │   ├── lazy.lua         # Plugin manager setup
    │   ├── lsp.lua          # LSP configuration
    │   └── settings.lua     # Neovim settings
    └── plugins/             # Plugin specifications
```

## Key Mappings

### General

- `<Space>` - Leader key
- `<leader>v` - Vertical split
- `<leader>s` - Horizontal split
- `<C-.>` / `<C-,>` - Navigate between splits
- `<leader>]` / `<leader>[>` - Navigate between buffers
- `<leader>w` - Close current buffer
- `<leader>ow` - Close all buffers except current one
- `<leader>nh` - Clear search highlighting
- `<C-`>` - Open floating terminal

### LSP

- `<leader>lf` - Format via LSP
- `<leader>e` - Format via LSP and update buffer
- `<leader>lr` - Rename symbol
- `<leader>lc` - Code action
- `<leader>]d` - Go to next diagnostic
- `<leader>di` - Open diagnostic float
- `K` - Show documentation for current word
- `gd` - Go to definition
- `grn` - Rename symbol (global)
- `gra` - Code action (global)
- `grr` - Show references (global)
- `gri` - Go to implementation (global)
- `gO` - Document symbol (global)
- `CTRL-S` - Signature help (insert mode)

### Telescope

- `<leader>p` - Find files
- `<C-p>` - Git files
- `vh` - Help tags
- `<leader>ls` - LSP document symbols
- `<leader>lp` - LSP workspace symbols
- `<leader>gr` - LSP references
- `<C-c>` - List buffers
- `<leader>f` - Live grep (search)
- `<leader>gs` - Git status
- `<leader>ld` - List diagnostics

### Harpoon (Quick File Navigation)

- `<C-a>` - Add file to harpoon
- `<C-e>` - Toggle quick menu
- `<C-1>` to `<C-4>` - Jump to file 1-4
- `<C-k>` - Previous harpoon file
- `<C-l>` - Next harpoon file

### Completion (blink.cmp)

- `Tab` - Select completion / navigate
- `Shift+Tab` - Previous completion item
- `C-Space` - Open menu / Open docs
- `C-e` - Hide menu

### Visual Mode

- `<` / `>` - Indent/outdent and keep selection
- `J` / `K` - Move visual block up/down
- `<C-h>` / `<C-j>` - Move code block up/down

### Normal Mode

- `<C-]>` / `<C-[>` - Navigate between quickfix items
- `<leader>q` / `<leader>a` - Navigate between location list items
- `gf` - Open file under cursor in vertical split
- `zx` - Close quickfix list

## Editor Settings

This configuration includes sensible defaults for a modern development environment:

- Relative line numbers with current line number shown
- 4-space indentation (tabs expanded to spaces)
- No line wrapping
- Mouse support
- System clipboard integration
- Dark background
- No swap files or backups
- Fast update time (50ms)
- Case-insensitive search (smart case)
- Split windows open to the right and below
- Visible whitespace characters
- Terminal colors support

## Plugins

The configuration uses lazy.nvim for plugin management. Key plugins include:

- **Telescope**: Fuzzy finder for files, buffers, and more
- **Neo-tree**: File explorer with git integration
- **Treesitter**: Advanced syntax highlighting
- **blink.cmp**: Modern completion plugin
- **friendly-snippets**: Snippet collection for blink.cmp
- **Harpoon**: Quick file navigation
- **Mason**: LSP server installer
- **vim-visual-multi**: Multi-cursor editing

## LSP Setup

The configuration includes built-in LSP support with:

- Automatic server configuration via Mason
- Semantic token support
- Auto-completion provided by `blink.cmp`
- Diagnostics
- Code actions
- Formatting

Pre-configured language servers:
- lua_ls (Lua)
- intelephense (PHP)

## Customization

### Adding New Plugins

To add a new plugin, create a new file in the `lua/plugins/` directory:

```lua
-- lua/plugins/your-plugin.lua
return {
    'username/plugin-name',
    config = function()
        -- Your configuration here
    end
}
```

### Modifying Key Mappings

Edit `lua/config/keymappings.lua` to change or add key mappings.

### Changing Editor Settings

Edit `lua/config/settings.lua` to modify editor behavior.

### Adding LSP Servers

1. Open Neovim
2. Run `:Mason`
3. Install the desired language server
4. Add it to `lua/config/lsp.lua`:
   ```lua
   vim.lsp.enable('your-language-server')
   ```

## Troubleshooting

If you encounter issues:

1. Check Neovim version: `nvim --version` (should be 0.8.0+)
2. Update plugins: `:Lazy update`
3. Check for errors: `:checkhealth`
4. Ensure language servers are installed: `:Mason`
