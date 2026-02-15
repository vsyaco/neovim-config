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

## Key Plugins

This configuration includes the following main plugins:

### Core
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[rose-pine](https://github.com/rose-pine/neovim)** - Color scheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline

### Navigation & UI
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer with git integration
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[harpoon](https://github.com/ThePrimeagen/harpoon)** - Quick file navigation (v2)

### LSP & Completion
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/linter installer
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Completion engine
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** - File operations via LSP

### Git
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** - Git commands
- **[vim-gitgutter](https://github.com/airblade/vim-gitgutter)** - Git diff in sign column
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)** - Git diff viewer

### Editing
- **[vim-visual-multi](https://github.com/mg979/vim-visual-multi)** - Multiple cursors

### Utilities
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Interactive keymaps navigation (shows available commands as you type)
- **[keymaps-help.nvim](https://github.com/vsyaco/keymaps-help.nvim)** - Full keymaps list viewer (custom plugin)

## Keymaps

### General

| Key | Action | Mode |
|-----|--------|------|
| `<Space>` | Leader key | n |
| `<leader>v` | Vertical split | n |
| `<leader>s` | Horizontal split | n |
| `<C-.>` / `<C-,>` | Navigate between splits | n |
| `Prefix+h/j/k/l` | Navigate tmux panes (in tmux) | n |
| `<C-b>` | Toggle Neo-tree file explorer | n |
| `<C-g>` | Toggle Neo-tree Git status sidebar | n |
| `<leader>]` / `<leader>[` | Navigate between buffers | n |
| `<leader>w` | Close current buffer | n |
| `<leader>ow` | Close all buffers except current | n |
| `<leader>nh` | Clear search highlighting | n |
| `` <C-`> `` | Open floating terminal | n |
| `?` / `<C-/>` | Show all keymaps (full list) | n |
| `<Leader>` (wait) | Show which-key menu (interactive) | n |

### LSP

| Key | Action | Mode |
|-----|--------|------|
| `<leader>lf` | Format via LSP | n |
| `<leader>e` | Format via LSP and update buffer | n |
| `<leader>]d` | Go to next diagnostic | n |
| `<leader>di` | Open diagnostic float | n |
| `K` | Show documentation for current word | n |
| `gd` | Go to definition | n |
| `grn` | Rename symbol | n |
| `gra` | Code action | n |
| `grr` | Show references | n |
| `gri` | Go to implementation | n |
| `gO` | Document symbol | n |
| `CTRL-S` | Signature help | i |

### Telescope

| Key | Action | Mode |
|-----|--------|------|
| `<C-f>` | Find files | n |
| `<C-p>` | Git files | n |
| `<leader>ht` | Help tags | n |
| `<leader>ls` | LSP document symbols | n |
| `<leader>lp` | LSP workspace symbols | n |
| `<leader>gr` | LSP references | n |
| `<C-c>` | List buffers | n |
| `<leader>f` | Live grep (search) | n |
| `<leader>gs` | Git status | n |
| `<leader>ld` | List diagnostics | n |

### Harpoon

| Key | Action | Mode |
|-----|--------|------|
| `<C-a>` | Add file to harpoon | n |
| `<C-e>` | Toggle quick menu | n |
| `<C-1>` to `<C-4>` | Jump to file 1-4 | n |
| `<M-[>` | Previous harpoon file | n |
| `<M-]>` | Next harpoon file | n |

### Completion (blink.cmp)

| Key | Action | Mode |
|-----|--------|------|
| `Tab` | Select completion / navigate | i |
| `Shift+Tab` | Previous completion item | i |
| `Enter` | Select and accept completion | i |
| `C-Space` | Open menu / Open docs | i |
| `C-e` | Hide menu | i |

### Visual Mode

| Key | Action | Mode |
|-----|--------|------|
| `<` / `>` | Indent/outdent and keep selection | v |
| `J` / `K` | Move visual block up/down | v |
| `<M-k>` / `<M-j>` | Move code block up/down | v |

### Normal Mode

| Key | Action | Mode |
|-----|--------|------|
| `<C-]>` / `<C-[>` | Navigate between quickfix items | n |
| `<leader>q` / `<leader>a` | Navigate between location list items | n |
| `<M-k>` / `<M-j>` | Move line up/down | n |
| `gf` | Open file under cursor in vertical split | n |
| `zx` | Close quickfix list | n |

### Git Workflow

Using standard plugins: Telescope, Diffview, and Fugitive.

| Key | Action | Mode |
|-----|--------|------|
| `<leader>gl` | Git log (all commits) | n |
| `<leader>gL` | Git log (current file) | n |
| `<leader>gb` | Git branches | n |
| `<leader>gB` | Create new branch | n |
| `<leader>gs` | Git status | n |
| `<leader>gd` | Diffview: unstaged changes | n |
| `<leader>gD` | Diffview: staged changes | n |
| `<leader>gh` | Diffview: file history | n |
| `<leader>gH` | Diffview: repo history | n |
| `<leader>gx` | Close diffview | n |
| `<leader>gp` | Git push | n |
| `<leader>gP` | Git pull | n |

#### Inside Diffview file panel

| Key | Action | Mode |
|-----|--------|------|
| `j` / `k` | Navigate files | n |
| `<CR>` | Show diff for file | n |
| `o` | Open file in editor | n |
| `<C-o>` | Open file in new tab | n |
| `s` | Stage/unstage file | n |

### Git Hunks (vim-gitgutter)

| Key | Action | Mode |
|-----|--------|------|
| `]c` | Next git hunk | n |
| `[c` | Previous git hunk | n |
