highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign guifg=#C30500 
highlight ALEWarningSign guifg=#ED6237 

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = "‼"
let g:ale_sign_warning = "⚠︎"
let g:ale_sign_style_error = "1"
let g:ale_sign_style_warning = "2"
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {}

let g:ale_linters.clojure = []
let g:ale_fixers.clojure = []

let g:ale_linters.c = ['ccls']
let g:ale_fixers.c = ['clang-format']

let g:ale_linters.cpp = ['ccls']
let g:ale_fixers.cpp = ['clang-format']

let g:ale_elixir_elixir_ls_release = $ELIXIR_LS 
let g:ale_elixir_credo_strict = 1
let g:ale_linters.elixir = ['credo', 'elixir-ls']
let g:ale_fixers.elixir = ['mix_format']

let g:ale_fixers.rust = ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']

let g:ale_fixers.typescript = ['tslint', 'eslint']

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_sorbet_executable = 'bundle'
let g:ale_linters.ruby  = ['rubocop', 'sorbet', 'solargraph']
let g:ale_fixers.ruby = ['rubocop', 'trim_whitespace', 'remove_trailing_lines']

nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> gy :ALEGoToTypeDefinition<CR>
nmap <silent> gr :ALEFindReferences<CR>

nmap <silent> [g :ale_previous_wrap<CR>
nmap <silent> ]g :ale_next_wrap<CR>
