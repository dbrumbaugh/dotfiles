" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Tim Pope plugins
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " gruvbox theme
    Plug 'morhetz/gruvbox'

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Airline (status line)
    Plug 'vim-airline/vim-airline'

    " whitespace highlighting/removal
    Plug 'ntpeters/vim-better-whitespace'
    call plug#end()
