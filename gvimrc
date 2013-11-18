" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
" Colors && GUI section ----------------------------------------------------------------------{{{
  set background=dark
  colorscheme hybrid
"}}}

" GUI customisation --------------------------------------------------------------------------{{{
  if has('gui_running')
    set guifont=Monaco\ for\ Powerline:h12
    set guioptions-=T " Removes top toolbar
    set guioptions-=r " Removes right hand scroll bar
    set go-=L         " Removes left hand scroll bar

    " colors ------------------------------------------------------------------------------------
    hi Pmenu        ctermbg=238           gui=bold
    hi ColorColumn  ctermbg=green         guibg=#373b41
    hi NonText      guifg=#4a4a59
    hi SpecialKey   guifg=#4a4a59

    hi MatchTag     guibg=black guifg=#ffcc66 gui=underline
    hi Search       guibg=darkred guifg=white gui=underline
    hi SpellBad     guibg=black guifg=#ffcc66 gui=underline
    hi CursorLine   guibg=#3a3a3a

    highlight Folded guibg=#1D1F21
    highlight FoldColumn guibg=#1D1F21
  endif
"}}}

if has("gui_macvim")
  let macvim_skip_colorscheme=1
  set macmeta

  " unbind default gui mappings
  macmenu File.Print key=<nop>
  macmenu Edit.Find.Find\.\.\. key=<nop>
  macmenu Edit.Find.Find\ Next key=<nop>
  macmenu Edit.Find.Find\ Previous key=<nop>
  macmenu File.Open\.\.\. key=<nop>
  macmenu File.New\ Tab key=<nop>
  macmenu Tools.List\ Errors key=<nop>
  macmenu Window.Minimize key=<nop>
  macmenu File.Save\ As\.\.\. key=<nop>

  " Select text whit shift
  let macvim_hig_shift_movement = 1
endif

