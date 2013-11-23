let g:ackprg = 'ag --nogroup --nocolor --column --smart-case --follow'
let g:ack_qhandler="silent copen | only"

set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepformat=%f:%l:%c:%m

autocmd FileType qf exec "nnoremap <silent> <buffer> <CR> <CR>:silent only<CR>"
autocmd FileType qf nnoremap <buffer> <D-l> :e#<CR>
autocmd FileType qf setlocal cursorline


function! ToggleQuickfixList()
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      edit #
      return
    endif
  endfor
  let winnr = winnr()
  if exists("g:toggle_list_copen_command")
    exec(g:toggle_list_copen_command)
  else
    cw | only
  endif
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! OpenQuickFix()
  copen | only
endfunction

nmap <script> <silent> <D-l> :call OpenQuickFix()<CR>
nmap <D-f> :Ack<Space>
nmap <D-F> :AckFromSearch<Space>

