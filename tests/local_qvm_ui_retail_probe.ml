import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as bridge
import mq3.client.original_ui_session as session
import mq3.client.ui_host_lifecycle as uiHost
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

struct Input down mouse end struct
function keyDown(input,key) return input.down[key] end function
function mouseDelta(input) value=input.mouse;input.mouse=[0,0];return value end function
function drawWorld(state) return 0 end function
function drawCinematic(state) return 0 end function

function main(args)
  if len(args)!=2 then print("usage: local_qvm_ui_retail_probe <pak0.pk3> <qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  staged=match.setUiConnection(state,uiHost.CA_CHALLENGING,3,"127.0.0.1:27960","Awaiting challenge");if staged is error then return staged end if
  loaded=match.bootUi(state);if loaded is error then return loaded end if
  if loaded.lastArgs[0]!=1 or loaded.lastArgs[1]!=1 then return error(7689,"retail UI did not initialize in connecting mode") end if
  encoded=uiHost.encodeClientState(state.context.uiClient)
  if n.readU32(encoded,0)!=uiHost.CA_CHALLENGING or n.readU32(encoded,4)!=3 or n.readU32(encoded,8)!=0 then return error(7689,"productive UI client-state ABI was not populated") end if
  bridge.resetFrameCommands(state);connectFrame=bridge.drawScreen(state,uiHost.CA_CHALLENGING,1100,drawWorld,drawCinematic);if connectFrame is error then return connectFrame end if
  if connectFrame.connectCalls!=1 or connectFrame.refreshCalls<1 or connectFrame.overlay then return error(7689,"retail connection dialog lifecycle was not drawn") end if
  activated=match.setUiConnection(state,uiHost.CA_ACTIVE,0,"localhost","");if activated is error then return activated end if
  uiBaseline=state.context.uiFrames
  input=Input(array(256,false),[0,0]);ui=bridge.attach(state,input,keyDown,mouseDelta);if ui is error then return ui end if
  opened=session.openMain(ui);if opened is error then return opened end if
  if (state.context.uiKeyCatcher&session.KEYCATCH_UI)==0 then return error(7689,"retail main menu did not claim UI input") end if
  bridge.resetFrameCommands(state)
  first=session.frame(ui,1200);if first is error then return first end if
  if not first.active or not first.refreshed or first.commandStart!=0 or first.uiCommands==0 or first.commandCount==0 or state.context.uiFrames!=uiBaseline+1 then return error(7689,"retail UI frame was not refreshed into a fresh command queue") end if
  firstCommands=first.commandCount;bridge.resetFrameCommands(state);input.down[session.VK_DOWN]=true;input.mouse=[3,-2];second=session.frame(ui,1250);if second is error then return second end if
  if second.keyEvents!=1 or second.mouseEvents!=1 or not second.refreshed or state.context.uiFrames!=uiBaseline+2 then return error(7689,"retail UI did not consume native navigation input") end if
  bridge.resetFrameCommands(state);input.down[session.VK_DOWN]=false;input.down[65]=true;third=session.frame(ui,1300);if third is error then return third end if
  if third.keyEvents!=2 or third.charEvents!=1 or not third.active then return error(7689,"retail UI did not receive key-up and character events") end if
  closed=session.close(ui);if closed is error then return closed end if
  if session.active(ui) then return error(7689,"retail UI menu did not release key catcher") end if
  input.down[65]=false;session.frame(ui,1350);bridge.resetFrameCommands(state);input.down[session.VK_ESCAPE]=true;reopened=session.frame(ui,1400);if reopened is error then return reopened end if
  if not reopened.menuOpened or not reopened.active or not reopened.refreshed or state.context.uiFrames!=uiBaseline+4 then return error(7689,"Escape did not activate retail ingame menu") end if
  if len(state.context.errors)>0 then return error(7689,state.context.errors[0]) end if
  report="PASS: retail interactive UI firstCommands="+str(firstCommands)+" navigationCommands="+str(second.commandCount)+" ingameCommands="+str(reopened.commandCount)+" uiFrames="+str(state.context.uiFrames)+" keyEvents="+str(second.keyEvents+third.keyEvents)+" charEvents="+str(third.charEvents)+" mouseEvents="+str(second.mouseEvents)
  match.shutdown(state);if (match.keyCatcher(state)&session.KEYCATCH_UI)!=0 then return error(7689,"retail UI shutdown retained shared key catcher") end if
  print(report);return 0
end function
