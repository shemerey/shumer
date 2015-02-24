if has('gui_macvim')
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L         " Removes left hand scroll bar

  " Try to hide some information -------------------------------------------------------------{{{
  highlight ShadeBuffer gui=NONE guibg=NONE guifg=#777777
  highlight CtrlPBufName guifg=#1d1f21 guibg=#1d1f21
  highlight CtrlPTabExtra guifg=#1d1f21 guibg=#1d1f21
  highlight ex_pj_fold guifg=#1d1f21 guibg=#1d1f21
  highlight Search guibg=darkcyan guifg=white
  highlight Cursor guibg=lightgreen
  "}}}

  " Menu keys----------------------------------------------------------------------------------{{{
  macmenu File.Print key=<nop>
  macmenu File.Close key=<nop>
  macmenu File.Close\ Window key=<nop>
  macmenu File.Open\.\.\. key=<nop>
  macmenu File.Open\ Tab\.\.\. key=<nop>
  macmenu File.New\ Tab key=<nop>
  macmenu File.New\ Window key=<nop>
  macmenu File.Save\ As\.\.\. key=<nop>

  macmenu Tools.Spelling.To\ Next\ error key=<nop>
  macmenu Tools.List\ Errors key=<nop>
  macmenu Tools.Make key= <nop>

  macmenu Window.Minimize key=<nop>

  macmenu Edit.Undo key=<nop>
  macmenu Edit.Redo key=<nop>
  macmenu Edit.Find.Find\.\.\. key=<nop>
  macmenu Edit.Find.Find\ Next key=<nop>
  macmenu Edit.Find.Find\ Previous key=<nop>

  macmenu Edit.Font.Bigger key=<nop>
  macmenu Edit.Font.Smaller key=<nop>
  "}}}
endif
