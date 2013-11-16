let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0

nmap f       <Plug>SneakForward
xmap f       <Plug>VSneakForward
nmap F       <Plug>SneakBackward
xmap F       <Plug>VSneakBackward

nmap <enter> <Plug>SneakNext
xmap <enter> <Plug>VSneakNext
nmap <bs>    <Plug>SneakPrevious
xmap <bs>    <Plug>VSneakPrevious
