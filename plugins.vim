" Install vim-plug for vim and neovim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
    " Plug 'ludovicchabant/vim-gutentags'                     " Automatic ctags
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes' 
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'                               " Git
    Plug 'mhinz/vim-signify'                                " Git integration inline
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File navigator
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Install fuzzy finder binary
    Plug 'junegunn/fzf.vim'                             " Enable fuzzy finder in Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Intelisense
    " Plug 'marlonfan/coc-phpls'                        " PHP language server
    Plug 'sheerun/vim-polyglot'                         " Better syntax highlighting
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
    Plug 'StanAngeloff/php.vim'                         " Better PHP syntax highlighting 
    Plug 'ncm2/ncm2'                                    " Autocompletion engine
    Plug 'ncm2/ncm2-bufword'                            " Basic word completion? testing
    Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'} " PHP introspection and refactor tools
call plug#end()
