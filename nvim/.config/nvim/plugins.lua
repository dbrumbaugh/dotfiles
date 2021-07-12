return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Better Syntax Support
    use 'sheerun/vim-polyglot'
    -- Auto pairs for '(' '[' '{'
    use 'jiangmiao/auto-pairs'

    -- Tim Pope plugins
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    -- gruvbox theme
    use 'morhetz/gruvbox'

    -- Stable version of coc
    use {
        'neoclide/coc.nvim', branch='release'
    }

    -- Airline (status line)
    use 'vim-airline/vim-airline'

    -- whitespace highlighting/removal
    use 'ntpeters/vim-better-whitespace'

    -- fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- ensure that vim's wd is the project root
    use 'airblade/vim-rooter'

end)
