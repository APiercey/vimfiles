set nocompatible
set termguicolors
set encoding=UTF-8
set signcolumn=yes
set number 
set relativenumber
set expandtab
set ignorecase
set smartcase
set cursorline
set guioptions=
set mouse=a
set shiftwidth=2 
set tabstop=2
set hidden
set encoding=UTF-8
set noshowmode
set synmaxcol=9999
set clipboard=unnamedplus
set so=3
set lazyredraw
set tags=tags

syntax on

highlight Comment cterm=italic
highlight Comment gui=italic

au TermOpen * setlocal nonumber norelativenumber

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

filetype plugin on

so ~/vimfiles/plugins.vim
so ~/vimfiles/fzf.vim 
so ~/vimfiles/coc.vim 
so ~/vimfiles/ale.vim 
so ~/vimfiles/text_mode.vim

" 
" Vimwiki

let wiki = {}
let wiki.nested_syntaxes = {'elixir': 'elixir', 'c++': 'cpp'}


" MISC
map <ESC> :noh<CR>
nnoremap j gj
nnoremap k gk

" Return to last edit when opening
augroup last_edit
    autocmd!
      autocmd BufReadPost *
             \ if line("'\"") > 0 && line("'\"") <= line("$") |
             \   exe "normal! g`\"" |
             \ endif
      augroup END

" FUNCTION BAR
nnoremap <F8> :Colors<CR>
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <silent> <F9> :call FZFOpen(':Commands')<CR>

"
" RAINBOW

let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['lightblue', 'darkorange3', 'seagreen3', 'magenta'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']
	\}
"
"
" Github Open
let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
" THEMES

let g:palenight_terminal_italics=1
set background=dark
colorscheme palenight
hi Normal guibg=NONE ctermbg=NONE

let g:lightline = { 
        \ 'colorscheme': 'palenight',
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ }
\ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
"
"
" MOVEMENT

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

call yankstack#setup()
nmap Y y$
nmap [p <Plug>yankstack_substitute_older_paste
nmap ]p <Plug>yankstack_substitute_newer_paste
nmap <C-d> :qa! <CR>
" I gotta find a new mapping for this
nnoremap <NL> i<CR><ESC> 
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nmap s <Plug>(easymotion-overwin-f2)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"
" FUGITIVE
map <Leader>gs :Gstatus<CR>

"
" Ranger

let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_map_keys = 0
nmap - :Ranger<CR>
" GitGutter

let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified ='▎'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▎'
let g:gitgutter_sign_modified_removed   = '▎—'
let g:gitgutter_max_signs = 500

