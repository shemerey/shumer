
map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

function! s:Num2S(num, len)
  let filler = "                                                            "
  let text = '' . a:num
  return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
  let linenum = v:foldstart
  while linenum <= v:foldend
    let line = getline(linenum)
    if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
      break
    else
      let linenum = linenum + 1
    endif
  endwhile
  if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
    " all lines matched the prefix regexp
    let line = getline(v:foldstart)
  endif
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let diff = v:foldend - v:foldstart + 1
  return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

function! XX()

  let current_line = 1
  let eof = line('$')
  let folds = []
  let fold_index = 1

  let include_def = '\v(^\s*(def|class|module|it|describe)\s*)'

  while current_line <= eof

    if (match(getline(current_line), include_def) != -1)

      let start_line = current_line
      execute 'normal j' + start_line
      execute 'normal %'
      let end_line = line('.')

      if end_line > start_line
        let folds = add(folds, [start_line, end_line])
        let fold_index += 1
        execute 'normal %'
      endif

    endif

    let current_line += 1
  endwhile

  for x in reverse(folds)
    execute ":".join(x,','). "fold"
  endfor
endfunction

