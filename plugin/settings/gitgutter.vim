let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 0
map <F3> :GitGutterToggle<CR>
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

autocmd FileType gitcommit,git,qf       setlocal nolist
