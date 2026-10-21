import mq3.client.ui_preferences as pref
function req(ok,label) if not ok then return error(7862,"UI preferences contract: "+label) end if;return 1 end function
function main(args)
  count=0;value=pref.setMenuItems(13,1,2500,1,1,1,0,0,1,9,1)
  count=count+req(value.crosshair==3 and value.simpleItems and value.brass and value.wallMarks and value.highQualitySky,"cvar snapshot")
  count=count+req(value.teamOverlay==3 and value.allowDownload,"clamp/download")
  value=pref.open(value);count=count+req(len(value.items)==12 and value.items[0].y==144 and value.items[11].y==416 and value.actions==["push"],"menu layout")
  count=count+req(len(value.assets)==14 and value.assets[4]=="gfx/2d/crosshair0" and value.assets[13]=="gfx/2d/crosshair9","cache")
  value=pref.event(value,pref.ID_CROSSHAIR,pref.QM_ACTIVATED);count=count+req(value.crosshair==4 and value.cvarWrites[0]=="cg_drawCrosshair=4","crosshair")
  value=pref.event(value,pref.ID_HIGHQUALITYSKY,pref.QM_ACTIVATED);count=count+req(value.cvarWrites[1]=="r_fastsky=false","sky inversion")
  value=pref.event(value,pref.ID_EJECTINGBRASS,pref.QM_ACTIVATED);count=count+req(value.cvarWrites[2]=="reset:cg_brassTime","brass reset")
  value=pref.event(value,pref.ID_ALLOWDOWNLOAD,pref.QM_ACTIVATED);count=count+req(value.cvarWrites[len(value.cvarWrites)-2]=="cl_allowDownload=true" and value.cvarWrites[len(value.cvarWrites)-1]=="sv_allowDownload=true","download pair")
  before=len(value.cvarWrites);value=pref.event(value,pref.ID_BACK,pref.QM_ACTIVATED);count=count+req(len(value.cvarWrites)==before and value.actions[len(value.actions)-1]=="pop","back")
  value=pref.event(value,pref.ID_SIMPLEITEMS,0);count=count+req(len(value.cvarWrites)==before,"ignore notification")
  drawing=pref.drawCrosshair(value,true,false,false);count=count+req(drawing[0]=="highlight" and drawing[1]=="small+pulse" and len(drawing[2])==4,"focused draw")
  drawing=pref.drawCrosshair(pref.setMenuItems(0,0,0,0,0,0,1,0,0,0,0),false,true,false);count=count+req(drawing[0]=="disabled" and len(drawing[2])==1,"disabled zero draw")
  print("PASS: "+str(count)+" native UI preferences contracts (6 symbols)");return 0
end function
