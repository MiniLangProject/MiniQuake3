import mq3.client.ui_demos as demos

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) value=0;for each action in state.actions if action.kind==kind then value=value+1 end if end for;return value end function
function main(args)
  failures=0
  failures=failures+req(demos.normalize("demo001.dm3")=="DEMO001","dm3 strip and uppercase")
  failures=failures+req(demos.normalize("match.dm_68")=="MATCH.DM_68","only legacy dm3 suffix stripped")
  failures=failures+req(demos.compareNames("alpha","BETA")<0 and demos.compareNames("same","SAME")==0,"case-insensitive comparator")
  sorted=demos.sortNames(["zed.dm3","Alpha.dm3","beta.dm3"]);failures=failures+req(sorted[0]=="Alpha.dm3" and sorted[2]=="zed.dm3","deterministic listing order")
  state=demos.create(true);demos.menuInit(state,68,["zed.dm3","Alpha.dm3","beta.dm3"]);failures=failures+req(state.protocol==68 and state.extension=="dm_68" and state.names[0]=="ALPHA" and state.names[2]=="ZED" and state.numDemos==3,"protocol listing and normalization")
  failures=failures+req(state.columns==3 and state.height==14 and state.goVisible and state.selected==0 and state.top==0,"scroll-list geometry")
  failures=failures+req(state.cached and count(state,"register-shader")==9 and not state.actions[0].dispatched,"asset cache and suppressed boundary")
  empty=demos.create(true);demos.menuInit(empty,68,[]);failures=failures+req(empty.numDemos==1 and empty.names[0]=="No Demos Found." and not empty.goVisible,"empty-list sentinel")
  many=[];for i=0 to 129 many=many+["demo"+str(i)+".dm3"] end for;large=demos.create(true);demos.menuInit(large,68,many);failures=failures+req(large.numDemos==128,"maximum demo cap")
  state=demos.create(true);state.names=["DEMO001","DEMO002"];state.numDemos=2;state.goVisible=true;state.selected=1;failures=failures+req(not demos.menuEvent(state,demos.ID_GO,1) and len(state.actions)==0,"event activation gate")
  failures=failures+req(demos.menuEvent(state,demos.ID_GO,demos.QM_ACTIVATED) and count(state,"force-menu-off")==1 and count(state,"execute")==1,"go boundaries")
  failures=failures+req(state.actions[1].text=="demo DEMO002\n" and state.actions[1].value==2,"selected demo command")
  empty.actions=[];failures=failures+req(not demos.menuEvent(empty,demos.ID_GO,demos.QM_ACTIVATED) and len(empty.actions)==0,"inactive go blocked")
  state=demos.create(true);failures=failures+req(demos.menuEvent(state,demos.ID_BACK,demos.QM_ACTIVATED) and state.menuEvents[0][0]=="pop" and count(state,"menu-pop")==1,"back pop")
  state=demos.create(true);state.numDemos=50;state.selected=20;state.top=14;failures=failures+req(demos.menuEvent(state,demos.ID_LEFT,3) and state.selected==6 and state.top==0 and state.actions[0].value==demos.K_LEFTARROW,"left page")
  failures=failures+req(demos.menuEvent(state,demos.ID_RIGHT,3) and state.selected==20 and state.top==0 and state.actions[1].value==demos.K_RIGHTARROW,"right page")
  state.selected=49;failures=failures+req(demos.menuEvent(state,demos.ID_RIGHT,3) and state.selected==49,"right boundary still consumes event")
  state.actions=[];failures=failures+req(demos.menuKey(state,27)=="default" and state.actions[0].kind=="default-key" and state.actions[0].value==27,"default key delegation")
  state=demos.create(true);demos.demosMenu(state,68,["demo002.dm3"]);failures=failures+req(state.pushed and state.menuEvents[0][0]=="push" and count(state,"push-menu")==1,"public lifecycle")
  state=demos.create(false);state.names=["DEMO001"];state.numDemos=1;state.goVisible=true;demos.menuEvent(state,demos.ID_GO,3);failures=failures+req(state.actions[0].dispatched and state.actions[1].dispatched,"production boundary dispatch")
  if failures!=0 then return failures end if;print("PASS: 20 native ui_demos contracts (5 symbols)");return 0
end function
