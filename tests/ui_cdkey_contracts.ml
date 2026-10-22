import mq3.client.ui_cdkey as cdkey

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) value=0;for each action in state.actions if action.kind==kind then value=value+1 end if end for;return value end function
function main(args)
  failures=0
  failures=failures+req(cdkey.preValidateKey("")==1,"empty is incomplete")
  failures=failures+req(cdkey.preValidateKey("237abcdghjlprst")==1,"short is incomplete")
  failures=failures+req(cdkey.preValidateKey("237abcdghjlprstw")==0,"valid alphabet")
  failures=failures+req(cdkey.preValidateKey("237abcdghjlprstx")==-1,"invalid character")
  failures=failures+req(cdkey.preValidateKey("237ABCDGHJLPRSTW")==-1,"uppercase rejected")
  state=cdkey.create(true);state.buffer="237abcdghjlprstw";state.cursor=7;state.focus=true;state.overstrike=false;drawing=cdkey.drawKey(state);failures=failures+req(drawing.status==0 and drawing.cursorChar==10 and count(state,"field")==1 and not state.actions[0].dispatched,"valid draw and suppressed host action")
  state.overstrike=true;drawing=cdkey.drawKey(state);failures=failures+req(drawing.cursorChar==11,"overstrike cursor")
  state.focus=false;state.buffer="bad";drawing=cdkey.drawKey(state);failures=failures+req(drawing.cursorChar==0 and drawing.status==1 and drawing.message=="Please enter your CD Key","incomplete draw status")
  state.buffer="237abcdghjlprstx";drawing=cdkey.drawKey(state);failures=failures+req(drawing.status==-1 and drawing.message=="The CD Key is not valid","invalid draw status")
  state=cdkey.create(false);cdkey.init(state,"237abcdghjlprstw",true,0);failures=failures+req(state.buffer=="237abcdghjlprstw" and state.cursor==16 and not state.backVisible and state.verified,"verified key init")
  failures=failures+req(state.cached and count(state,"register-shader")==5 and count(state,"set-cvar")==1 and state.actions[0].dispatched,"cache and ui_cdkeychecked boundary")
  cdkey.init(state,"237abcdghjlprstwEXTRA",true,2);failures=failures+req(state.buffer=="237abcdghjlprstw" and state.backVisible,"field capacity and back visibility")
  cdkey.init(state,"237abcdghjlprstw",false,1);failures=failures+req(state.buffer=="" and state.cursor==0 and not state.verified,"failed engine verification clears key")
  state=cdkey.create(true);state.buffer="237abcdghjlprstw";failures=failures+req(not cdkey.menuEvent(state,cdkey.ID_ACCEPT,1) and len(state.actions)==0,"activation gate")
  failures=failures+req(cdkey.menuEvent(state,cdkey.ID_ACCEPT,cdkey.QM_ACTIVATED) and count(state,"set-cdkey")==1 and count(state,"menu-pop")==1,"accept writes key and pops")
  state=cdkey.create(true);failures=failures+req(cdkey.menuEvent(state,cdkey.ID_ACCEPT,cdkey.QM_ACTIVATED) and count(state,"set-cdkey")==0 and count(state,"menu-pop")==1,"empty accept only pops")
  state=cdkey.create(true);failures=failures+req(cdkey.menuEvent(state,cdkey.ID_BACK,cdkey.QM_ACTIVATED) and state.menuEvents[0][0]=="pop","back event")
  state=cdkey.create(true);cdkey.cdKeyMenuF(state,"237abcdghjlprstw",true,1);failures=failures+req(state.pushed and state.menuEvents[0][0]=="push" and count(state,"push-menu")==1,"public lifecycle")
  if failures!=0 then return failures end if;print("PASS: 18 native ui_cdkey contracts (7 symbols)");return 0
end function
