if has('gui_macvim')
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L         " Removes left hand scroll bar

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
