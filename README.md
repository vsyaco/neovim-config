# Neovim Configuration

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

## Key Mappings

### General

- `<Space>` - Leader key
- `<leader>v` - Vertical split
- `<leader>s` - Horizontal split
- `<C-.>` / `<C-,>` - Navigate between splits
- `<C-b>` - Toggle Neo-tree file explorer
- `<C-g>` - Toggle Neo-tree Git status (changed files) right sidebar
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
- `grn` - Rename symbol (global default)
- `gra` - Code action (global default)
- `grr` - Show references (global default)
- `gri` - Go to implementation (global default)
- `gO` - Document symbol (global default)
- `CTRL-S` - Signature help (insert mode, global default)

### Telescope

- `<C-f>` - Find files
- `<C-p>` - Git files
- `<leader>ht` - Help tags
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

- `Tab` - Select completion / navigate (super-tab preset)
- `Shift+Tab` - Previous completion item
- `Enter` - Select and accept completion
- `C-Space` - Open menu / Open docs
- `C-e` - Hide menu

### Visual Mode

- `<` / `>` - Indent/outdent and keep selection
- `J` / `K` - Move visual block up/down
- `<C-h>` / `<C-j>` - Move code block up/down

### Normal Mode

- `<C-]>` / `<C-[>` - Navigate between quickfix items
- `<leader>q` / `<leader>a` - Navigate between location list items
- `<C-h>` / `<C-j>` - Move line up/down
- `gf` - Open file under cursor in vertical split
- `zx` - Close quickfix list
