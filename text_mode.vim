" 
" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_paragraph_span = 3
let g:limelight_default_coefficient = 0.7

" 
" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_width=120

"
" VimWiki
autocmd! User VimwikiIndex Goyo
