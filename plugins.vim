call plug#begin('~/.vim/plugged')
  Plug 'vimwiki/vimwiki'
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
  Plug 'mattreduce/vim-mix', { 'for': 'elixir' }
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ruanyl/vim-gh-line'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  Plug 'nanotech/jellybeans.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  " Plug 'gabrielelana/vim-markdown'
  Plug 'tpope/vim-endwise'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  " Plug 'dracula/vim', { 'as': 'dracula' }
  
  Plug 'terryma/vim-expand-region'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
  Plug 'tpope/vim-commentary'
  Plug 'chrisbra/Colorizer', { 'on':  'Colors' }
  " Plug 'AndrewRadev/switch.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-fugitive'

  " Plug 'reedes/vim-colors-pencil'
  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'yegappan/greplace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
call plug#end() 

