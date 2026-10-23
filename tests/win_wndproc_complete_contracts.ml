import mq3.platform.win_wndproc_runtime as win
function req(ok,name) if not ok then print("FAIL: "+name);return 1 end if;return 0 end function
function packed(low,high) return (low&65535)|((high&65535)<<16) end function
function main(args)
  failures=0;count=0;s=win.create(true)
  win.MainWndProc(s,win.WM_CREATE,0,0,1,1,false,false,999);count=count+1;failures=failures+req(s.windowCreated and s.altTabDisabled,"fullscreen create disables alt-tab")
  win.MainWndProc(s,win.WM_ACTIVATE,packed(1,0),0,2,1,false,false,999);count=count+1;failures=failures+req(s.activeApp and s.inputActive and s.soundActivations==1 and s.clearStateCount==1,"activation")
  win.MainWndProc(s,win.WM_ACTIVATE,packed(1,1),0,3,1,false,false,999);count=count+1;failures=failures+req(not s.activeApp and s.isMinimized and not s.inputActive,"minimized cannot activate")
  win.MainWndProc(s,win.WM_SYSKEYDOWN,13,0,4,1,false,false,999);count=count+1;failures=failures+req(not s.fullscreen and s.videoRestart,"alt-enter requests restart")
  win.MainWndProc(s,win.WM_MOVE,0,packed(-12,31),5,1,false,false,999);count=count+1;failures=failures+req(s.vidX==-12 and s.vidY==31,"window position")
  win.MainWndProc(s,win.WM_MOUSEMOVE,win.MK_LBUTTON|win.MK_MBUTTON,0,6,1,false,false,999);count=count+1;failures=failures+req(s.mouseButtons==5,"aggregate mouse buttons")
  handled=win.MainWndProc(s,win.WM_SYSCOMMAND,win.SC_SCREENSAVE|2,0,7,1,false,false,999);count=count+1;failures=failures+req(handled==1,"screen saver suppressed")
  win.MainWndProc(s,win.WM_KEYDOWN,0,0x00110000,8,1,false,false,999);win.MainWndProc(s,win.WM_KEYUP,0,0x00110000,9,1,false,false,999);count=count+1;failures=failures+req(len(s.events)==2 and s.events[0].value==119 and s.events[0].value2 and not s.events[1].value2,"key transitions")
  win.MainWndProc(s,win.WM_CHAR,120,0,10,1,false,false,999);count=count+1;failures=failures+req(s.events[2].type==win.SE_CHAR and s.events[2].value==120,"character event")
  start=len(s.events);win.MainWndProc(s,win.WM_MOUSEWHEEL,packed(0,240),0,11,0,false,false,999);count=count+1;failures=failures+req(len(s.events)==start+4 and s.events[start].value==win.K_MWHEELUP,"multi-notch wheel")
  start=len(s.events);win.MainWndProc(s,999,1,0,12,0,false,false,999);count=count+1;failures=failures+req(len(s.events)==start+2 and s.events[start].value==win.K_MWHEELUP,"legacy wheel")
  s.fullscreen=false;win.MainWndProc(s,win.WM_DESTROY,0,0,13,1,false,false,999);count=count+1;failures=failures+req(not s.windowCreated,"destroy lifecycle")
  win.MainWndProc(s,win.WM_CLOSE,0,0,14,1,false,false,999);count=count+1;failures=failures+req(s.quitRequested,"close queues quit")
  count=count+1;failures=failures+req(win.MapKey(0x01480000)==win.K_UPARROW and win.MapKey(0x00480000)==win.K_KP_UPARROW and win.MapKey(0x00800000)==0,"mapkey extended and invalid")
  if failures==0 then print("PASS: "+str(count)+" complete win_wndproc contracts") end if
end function
