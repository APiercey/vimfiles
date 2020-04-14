let $FZF_PREVIEW_COMMAND="bat --color=always --theme=OneHalfDark --style=changes --line-range :300 {}"
let g:fzf_layout = { 'down': '~80%' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('up:80%'), <bang>0)

command! -bang Colors
  \ call fzf#vim#colors(fzf#vim#with_preview('up:60%:hidden'), <bang>0)

function! Bufs()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
  \ 'source': Bufs(),
  \ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! FZFOpen(command_str)
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

function! FZFFileOpen()
  if(len(system('git rev-parse')))
    :call FZFOpen(':Files')
  else
    :call FZFOpen(':GFiles')
  endif
endfunction

nnoremap <silent> <C-f> :call FZFOpen(':Rg!')<CR>
nnoremap <silent> gs :call FZFOpen(':Rg! ' . expand('<cword>'))<CR>
nnoremap <silent> <C-s> :call FZFOpen(':Snippets')<CR>
nnoremap <silent> <C-p> :call FZFFileOpen()<CR>
nnoremap zp :call FZFFileOpen()<CR>
nnoremap zb :call FZFOpen(':Buffers')<CR>
nnoremap zl :call FZFOpen(':BLines')<CR>
