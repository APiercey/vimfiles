call plug#begin('~/.vim/plugged')
  Plug 'vimwiki/vimwiki'
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'mattreduce/vim-mix', { 'for': 'elixir' }
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ruanyl/vim-gh-line'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'francoiscabrol/ranger.vim'

  Plug 'nanotech/jellybeans.vim' " Consider switching to this themes everywhere
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'tpope/vim-endwise'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-bundler'
  
  Plug 'terryma/vim-expand-region'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
  Plug 'tpope/vim-commentary'
  Plug 'chrisbra/Colorizer', { 'on':  'Colors' }
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-fugitive'

  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'yegappan/greplace'
  Plug 'christoomey/vim-tmux-navigator'
  " Plug 'Shougo/deoplete.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end() 

