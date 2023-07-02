
let mapleader = ","

set nocompatible
set number                " Show numbers on the left
set hlsearch              " Highlight search results
set ignorecase            " Search ingnoring case
set smartcase             " Do not ignore case if the search patter has uppercase
set noerrorbells          " I hate bells
set belloff=esc

set tabstop=4             " Tab size of 4 spaces
set softtabstop=4         " On insert use 4 spaces for tab
set shiftwidth=4
set expandtab             " Use apropiate number of spaces

set nowrap                " Wrapping sucks (except on markdown)
set noswapfile            " Do not leve any backup files
set mouse=a               " Enable mouse on all modes
set clipboard=unnamed,unnamedplus     " Use the OS clipboard
set showmatch
set termguicolors
set splitright splitbelow
set list lcs=tab:\¦\      "(here is a space)

" Updated Settings
" set cmdheight=2
syntax on               " Syntax highlighting

" so many colors
set t_Co=256

let &t_SI = "\e[6 q"      " Make cursor a line in insert
let &t_EI = "\e[2 q"      " Make cursor a line in insert

" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
"
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move lines with C-j and C-k
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Autocomand to remember las editing position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap " DO wrap on markdown files


source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc.vim

" Setting theme
set background=dark
colorscheme palenight

" Use Ctrl-k Ctrl-k to open a sidebar with the list of files
map <C-1> :NERDTreeToggle<cr>
" Use Ctrl-P to open the fuzzy file opener
nnoremap <C-p> :Files<cr>
" Use Ctrl-h to open the fuzzy History
nnoremap <C-h> :History<cr> 

" Rg
nnoremap <C-d> :Rg<cr>

" Load CoC Settings

" Installing additional CoC extenstions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
	\ 'coc-diagnostic'
    \]

let g:airline_powerline_fonts = 1

" Some fzf excludes
let $FZF_DEFAULT_COMMAND='find . \( -name vendor -o -name node_modules -o -name .git \) -prune -o -print'

" Enable true colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


" Some options of diplaying the preview of fzf search from https://github.com/junegunn/fzf.vim/issues/1051. 
" Choose only one of them. And remove slash from \"rg part of line

" 1
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   \"rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
"  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up', 'ctrl-/', <bang>0))

" 2
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up', 'ctrl-/'), 1)

" 3
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   \"rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
"  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:hidden', 'ctrl-/'), <bang>0)

