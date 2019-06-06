" Automatically fold `phoenix_swagger` blocks in Elixir files
"
" phoenix_swagger: https://github.com/xerions/phoenix_swagger

" Configure vim to use `elixir#folding#elixir_folds/1` to fold lines
setlocal foldmethod=expr
setlocal foldexpr=elixir#folding#elixir_folds(v:lnum)

" Count how many swagger blocks are open as `elixir#folding#elixir_folds/1`
" traverses the file. This is used to avoid needless scanning for matching
" block openings when none are open.
let s:open_blocks = 0

" Get fold level of line `lnum`
"
" @param {integer} lnum - line number
" @returns {string} - fold level of line `lnum`
function! elixir#folding#elixir_folds(lnum)
  let current_line = getline(a:lnum)

  if s:is_swagger_block_open(current_line)
    " Increase fold level on swagger block opening
    let s:open_blocks += 1
    return "a1"
  elseif s:open_blocks > 0 && s:is_swagger_block_close(current_line)
    " Decrease fold level on block close
    let indent = s:indent_level(a:lnum)
    let open_lnum = s:block_open_lnum(a:lnum, indent)
    let open_indent_level = s:indent_level(open_lnum)

    if indent == open_indent_level
      let s:open_blocks -= 1
      return "s1"
    else
      return "="
    end
  endif

  " Otherwise maintain current fold level
  return "="
endfunction

" Get indent level of line `lnum`
"
" @param {integer} lnum
" @returns {integer} - number of tabs indenting line `lnum`
function! s:indent_level(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

" Is a `line` the start of a swagger block?
"
" @param {string} line - line to test
" @returns {boolean}
function! s:is_swagger_block_open(line)
  return match(a:line, '^\s*\(def\s\)\{\}OpenApiSpex.*\sdo$') >= 0
endfunction

" Is `line` the end of a swagger block?
"
" @param {string} line - line to test
" @returns {boolean}
function! s:is_swagger_block_close(line)
  return match(a:line, '^\s*end\(,\)\{\}$') >= 0
endfunction

" Find the line number on which current block is opened.
" Depends on indentation being correct
"
" @param {integer} lnum - find line that opens block ending on line `lnum`
" @param {integer} indent - block end has this indentation level
" @returns {integer} - line number on which block is opened
function! s:block_open_lnum(lnum, indent)
  let current_lnum = a:lnum - 1

  " work upwards until a line matches
  while current_lnum > 0
    let current_indent = s:indent_level(current_lnum)
    let current_line = getline(current_lnum)

    if s:is_swagger_block_open(current_line) && a:indent == current_indent
      return current_lnum
    end

    let current_lnum -=1
  endwhile

  " Otherwise go to line 1
  return 1
endfunction

