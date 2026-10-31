import mq3.platform.win_headers as win

function main(args)
  print "glwstate_t.size="+str(win.GLWSTATE_X86_SIZE)
  names=win.glwStateFieldNames();offsets=win.glwStateX86Offsets();i=0
  while i<len(names) print "glwstate_t."+names[i]+"="+str(offsets[i]);i=i+1 end while
  print "WinVars_t.size="+str(win.WINVARS_X86_SIZE)
  names=win.winVarsFieldNames();offsets=win.winVarsX86Offsets();i=0
  while i<len(names) print "WinVars_t."+names[i]+"="+str(offsets[i]);i=i+1 end while
  print "versions="+str(win.DIRECTSOUND_VERSION)+","+str(win.DIRECTINPUT_VERSION)
  print "resources="+str(win.IDS_STRING1)+","+str(win.IDI_ICON1)+","+str(win.IDB_BITMAP1)+","+str(win.IDB_BITMAP2)+","+str(win.IDC_CURSOR1)+","+str(win.IDC_CURSOR2)+","+str(win.IDC_CURSOR3)+","+str(win._APS_NO_MFC)+","+str(win._APS_NEXT_RESOURCE_VALUE)+","+str(win._APS_NEXT_COMMAND_VALUE)+","+str(win._APS_NEXT_CONTROL_VALUE)+","+str(win._APS_NEXT_SYMED_VALUE)
  return 0
end function
