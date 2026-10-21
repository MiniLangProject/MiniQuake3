import mq3.client.ui_video as u
import std.string as strings

function b(value)
  if value then return 1 end if
  return 0
end function

function lineState(tag,state)
  print(tag+"|"+str(state.mode)+"|"+str(b(state.fullscreen))+"|"+str(state.tq)+"|"+str(state.lighting)+"|"+str(state.colorDepth)+"|"+str(state.textureBits)+"|"+str(state.geometry)+"|"+str(state.filter)+"|"+str(state.driver)+"|"+str(b(state.extensions)))
end function

function main(args)
  config=u.GlConfig("","","","",0,0,0,u.GLDRV_ICD,0)
  cvars=u.VideoCvars(-1,0,1,5,1,16,"GL_LINEAR_MIPMAP_NEAREST",1,20,32,"opengl32")
  state=u.graphicsState()
  u.graphicsOptionsSetMenuItems(state,cvars)
  lineState("set",state)
  u.graphicsOptionsGetInitialVideo(state)
  print("initial|"+str(state.initial.mode)+"|"+str(b(state.initial.fullscreen))+"|"+str(state.initial.tq)+"|"+str(state.initial.colorDepth))

  state.driver=1;state.mode=0;state.extensions=false;state.textureBits=0
  u.graphicsOptionsUpdateMenuItems(state)
  print("update|"+str(state.mode)+"|"+str(b(state.fullscreen))+"|"+str(state.colorDepth)+"|"+str(state.textureBits)+"|"+str(b(not state.applyVisible))+"|"+str(state.preset))

  state=u.graphicsState()
  state.mode=4;state.fullscreen=true;state.tq=2;state.colorDepth=2;state.textureBits=1;state.geometry=1;state.filter=1
  u.graphicsOptionsCheckConfig(state)
  print("template|"+str(state.preset))
  state.tq=1.6;u.graphicsOptionsTQEvent(state,u.QM_ACTIVATED)
  print("tq|"+str(state.tq))

  state.mode=5;state.fullscreen=true;state.tq=2;state.extensions=true;state.textureBits=2
  state.colorDepth=2;state.lighting=1;state.geometry=1;state.filter=1;state.driver=0
  u.graphicsOptionsApplyChanges(state,u.QM_ACTIVATED,false)
  for each action in state.actions
    if action.boundary=="cvar" then print("write|"+action.name+"|"+action.text)
    else if action.boundary=="command" then print("command|"+strings.substr(action.text,0,len(action.text)-1)) end if
  end for
  return 0
end function
