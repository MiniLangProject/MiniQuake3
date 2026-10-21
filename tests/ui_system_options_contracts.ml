import mq3.client.ui_display_options as display
import mq3.client.ui_sound_options as sound
function req(ok,label) if not ok then return error(7810,"UI system options contract: "+label) end if;return 1 end function
function main(args)
  count=0
  d=display.open(1.2,100.0,true)
  count=count+req(d.wrapAround and d.fullscreen and d.cursor==display.ID_DISPLAY and len(d.items)==10,"display menu topology")
  count=count+req(d.assets==["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"],"display cache")
  count=count+req(d.items[7].value==12.0 and d.items[8].value==10.0,"display cvar initialization")
  d=display.event(d,display.ID_BRIGHTNESS,display.QM_ACTIVATED,15.0);d=display.event(d,display.ID_SCREENSIZE,display.QM_ACTIVATED,8.0)
  count=count+req(d.cvarWrites==[["r_gamma",1.5],["cg_viewsize",80.0]],"display slider events")
  d=display.event(d,display.ID_SOUND,display.QM_ACTIVATED,0.0);count=count+req(d.actions==["pop","sound"],"display navigation")
  oldWrites=len(d.cvarWrites);d=display.event(d,display.ID_BRIGHTNESS,0,20.0);count=count+req(len(d.cvarWrites)==oldWrites,"display ignores non activation")
  dg=display.open(1.0,90.0,false);count=count+req(not dg.items[7].active,"gamma hardware gating")
  s=sound.open(0.8,0.25,1.0)
  count=count+req(s.wrapAround and s.fullscreen and s.cursor==sound.ID_SOUND and len(s.items)==11,"sound menu topology")
  count=count+req(s.items[7].value==8.0 and s.items[8].value==2.5 and s.items[9].value==0.0,"sound cvar initialization")
  s=sound.event(s,sound.ID_EFFECTSVOLUME,sound.QM_ACTIVATED,6.0);s=sound.event(s,sound.ID_MUSICVOLUME,sound.QM_ACTIVATED,3.0)
  count=count+req(s.cvarWrites==[["s_volume",0.6],["s_musicvolume",0.3]],"volume events")
  s=sound.event(s,sound.ID_QUALITY,sound.QM_ACTIVATED,1.0)
  count=count+req(len(s.cvarWrites)==4 and s.cvarWrites[2]==["s_khz",22.0] and s.cvarWrites[3]==["s_compression",0.0] and s.actions==["forceOff"] and s.commands==["snd_restart\n"],"high quality restart")
  low=sound.event(sound.open(1.0,1.0,0.0),sound.ID_QUALITY,sound.QM_ACTIVATED,0.0)
  count=count+req(low.cvarWrites==[["s_khz",11.0],["s_compression",1.0]],"low quality restart")
  nav=sound.event(sound.open(1.0,1.0,0.0),sound.ID_DISPLAY,sound.QM_ACTIVATED,0.0)
  count=count+req(nav.actions==["pop","display"],"sound navigation")
  print("PASS: "+str(count)+" UI display/sound contracts")
  return 0
end function
