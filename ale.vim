highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_fix_on_save = 1
let g:ale_sign_error = "‼"
let g:ale_sign_warning = "⚠︎"
let g:ale_sign_style_error = "1"
let g:ale_sign_style_warning = "2"

let g:ale_elixir_elixir_ls_release = $ELIXIR_LS 

highlight ALEErrorSign guifg=#C30500 
highlight ALEWarningSign guifg=#ED6237 

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {}
let g:ale_linters.elixir = ['elixir-ls', 'credo', 'dialyzer']
let g:ale_linters.ruby   = ['rubocop']
let g:ale_linters.rust   = ['rls']

let g:ale_fixers = {}
let g:ale_fixers.typescript = ['tslint', 'eslint']
let g:ale_fixers.elixir = ['mix_format']
" let g:ale_fixers.rust = ['rustfmt']
" let g:ale_fixers.ruby = ['standardrb', 'rubocop', 'trim_whitespace', 'remove_trailing_lines']
let g:ale_fixers.ruby = ['trim_whitespace', 'remove_trailing_lines']

