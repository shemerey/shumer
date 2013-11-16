" Searching ------------------------------------------------------------------------------------{{{
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter

" This rewires n and N to do the highlighing...  and auto center it {{{
function! HLNext (blinktime)
  execute 'normal! zMzv'
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
  set invcursorline
  redraw
endfunction
"}}}

nnoremap <silent> n   nzz:call HLNext(0.3)<cr>
nnoremap <silent> N   Nzz:call HLNext(0.3)<cr>
nnoremap <silent> *   *zz:call HLNext(0.3)<cr>
nnoremap <silent> #   #zz:call HLNext(0.3)<cr>
nnoremap <silent> g*  g*zz:call HLNext(0.3)<cr>
nnoremap <silent> g#  g#zz:call HLNext(0.3)<cr>
nnoremap <silent> <C-o> <C-o>zz:call HLNext(0.3)<cr>
nnoremap <silent> <C-i> <C-i>zz:call HLNext(0.3)<cr>

" Visual * - Search for selected text * = next # = prev
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

" Remove search highlight
nnoremap <leader><space> :noh<cr>
"}}}
