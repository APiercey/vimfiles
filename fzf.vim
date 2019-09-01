let $FZF_PREVIEW_COMMAND="bat --color=always --theme=OneHalfDark --style=header,changes --line-range :300 {}"
let g:fzf_layout = { 'down': '~80%' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('up:80%'), <bang>0)

command! -bang Colors
  \ call fzf#vim#colors({}, <bang>0)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <expr> <space>o () ? ':Files' : ':GFiles')."\<cr>"

function! FZFFileOpen()
  if(len(system('git rev-parse')))
    nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
  else
    nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR>
  endif
endfunction

nnoremap <silent> <C-f> :call FZFOpen(':Rg!')<CR>
nnoremap <silent> <C-s> :call FZFOpen(':Snippets')<CR>
nnoremap <silent> <C-p> :call FZFFileOpen()<CR>
nnoremap zb :call FZFOpen(':Buffers')<CR>
nnoremap zl :call FZFOpen(':BLines')<CR>

