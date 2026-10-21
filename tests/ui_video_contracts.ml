import mq3.client.ui_video as u
import std.string as strings

function req(value,message)
  if not value then return error(7891,message) end if
  return 1
end function

function main(args)
  count=0
  long="GL_EXT_this_extension_name_is_longer_than_thirty_two"
  config=u.GlConfig("NVIDIA","4.6","GeForce","GL_EXT_one  GL_ARB_two "+long,24,24,8,u.GLDRV_ICD,0)
  driver=u.uiDriverInfoMenu(config,true)
  count=count+req(len(driver.extensionStrings)==3,"extension tokenization")
  count=count+req(strings.endsWith(driver.extensionStrings[2],">"),"long extension marker")
  count=count+req(len(driver.assets)==4 and not driver.actions[0].dispatched,"driver cache suppression")
  before=len(driver.actions);u.driverInfoMenuDraw(driver,true)
  count=count+req(len(driver.actions)>before+7,"driver visible rows")
  count=count+req(driver.drawLines[0].text=="VENDOR" and driver.drawLines[0].x==320 and driver.drawLines[0].y==80,"driver layout")
  count=count+req(u.driverInfoEvent(driver,u.QM_ACTIVATED,true),"driver back")

  cvars=u.VideoCvars(3,1,1,1,0,0,"GL_LINEAR_MIPMAP_LINEAR",1,12,0,"opengl32")
  graphics=u.uiGraphicsOptionsMenu(cvars,config,true)
  count=count+req(len(graphics.assets)==6 and len(graphics.items)==21,"graphics menu assets/items")
  count=count+req(graphics.items[7].y==132 and graphics.items[18].y==362 and graphics.items[20].hidden,"graphics layout")
  count=count+req(len(graphics.choices)==10 and len(graphics.choices[3].values)==12 and graphics.choices[3].values[11]=="856x480 wide screen","visible choices")
  count=count+req(graphics.initial.mode==3 and graphics.initial.tq==2,"initial snapshot")
  count=count+req(not graphics.actions[0].dispatched,"graphics suppression")

  graphics.preset=2
  u.graphicsOptionsEvent(graphics,u.ID_LIST,u.QM_ACTIVATED,config,true)
  count=count+req(graphics.mode==2 and graphics.colorDepth==1 and graphics.geometry==0,"quality template")
  graphics.driver=1;graphics.mode=0
  u.graphicsOptionsEvent(graphics,u.ID_MODE,u.QM_ACTIVATED,config,true)
  count=count+req(graphics.mode==2,"voodoo low mode clamp")
  graphics.mode=9;u.graphicsOptionsEvent(graphics,u.ID_MODE,u.QM_ACTIVATED,config,true)
  count=count+req(graphics.mode==6,"voodoo high mode clamp")

  previous=len(graphics.actions)
  u.graphicsOptionsEvent(graphics,u.ID_DISPLAY,u.QM_ACTIVATED,config,true)
  count=count+req(len(graphics.actions)==previous+2 and graphics.actions[len(graphics.actions)-1].name=="display","display transition")
  previous=len(graphics.actions)
  u.graphicsOptionsEvent(graphics,u.ID_DRIVERINFO,u.QM_ACTIVATED,config,true)
  count=count+req(len(graphics.actions)==previous+1 and graphics.actions[previous].text=="NVIDIA","driver info transition")

  graphics.driver=0;graphics.fullscreen=false;graphics.colorDepth=2;graphics.extensions=false;graphics.textureBits=0
  u.graphicsOptionsUpdateMenuItems(graphics)
  count=count+req(graphics.colorDepth==0 and graphics.colorDepthGrayed and graphics.textureBits==1,"dependent controls")
  count=count+req(graphics.applyVisible,"dirty apply")

  legacy=u.GlConfig("3dfx","1.0","Voodoo3","",16,16,0,u.GLDRV_ICD,u.GLHW_3DFX_2D3D)
  hidden=u.graphicsOptionsMenuInit(cvars,legacy,true)
  count=count+req(hidden.driverHidden,"legacy driver hidden")

  actionsBefore=len(graphics.actions)
  u.graphicsOptionsApplyChanges(graphics,u.QM_ACTIVATED,true)
  count=count+req(len(graphics.actions)>actionsBefore+10,"apply cvars")
  count=count+req(graphics.actions[len(graphics.actions)-1].name=="vid_restart","restart command")
  print("PASS: "+str(count)+" native ui_video contracts")
  return 0
end function
