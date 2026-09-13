import mq3.client.original_ui_session as session

struct Context catcher events resets commands down mouse end struct
function hostCatcher(c) return c.catcher end function
function key(c,key,down)
  c.events=c.events+[["key",key,down]]
  if key==27 and down then c.catcher=c.catcher&(~session.KEYCATCH_UI) end if
  return 0
end function
function mouse(c,dx,dy) c.events=c.events+[["mouse",dx,dy]];return 0 end function
function refresh(c,now) c.events=c.events+[["refresh",now]];c.commands=c.commands+5;return 0 end function
function menu(c,value) c.events=c.events+[["menu",value]];if value==session.UIMENU_NONE then c.catcher=c.catcher&(~session.KEYCATCH_UI) else c.catcher=c.catcher|session.KEYCATCH_UI end if;return 0 end function
function commandCount(c) return c.commands end function
function keyDown(c,key) return c.down[key] end function
function mouseDelta(c) result=c.mouse;c.mouse=[0,0];return result end function
function req(ok,message) if not ok then return error(7688,message) end if;return 1 end function

function main(args)
  count=0;context=Context(0,[],0,9,array(256,false),[0,0]);services=session.services(context,hostCatcher,key,mouse,refresh,menu,commandCount);state=session.create(services,context,keyDown,mouseDelta)
  count=count+req(not (state is error) and len(state.bindings)==80,"complete native key map")
  count=count+req(not session.active(state),"UI catcher initially inactive")
  context.down[65]=true;frame=session.frame(state,10)
  count=count+req(frame.keyEvents==0 and frame.charEvents==0 and not frame.refreshed and context.commands==9,"game key ignored while UI inactive")
  context.down[65]=false;session.frame(state,11)
  context.down[session.VK_ESCAPE]=true;frame=session.frame(state,12)
  count=count+req(frame.menuOpened and frame.active and frame.refreshed,"Escape opens and refreshes ingame menu")
  count=count+req(context.events[0]==["menu",session.UIMENU_INGAME] and context.events[1]==["refresh",12],"menu activation precedes refresh")
  count=count+req(frame.commandStart==9 and frame.uiCommands==5 and frame.commandCount==14,"UI commands append to existing cgame queue")
  context.down[session.VK_ESCAPE]=false;frame=session.frame(state,13)
  count=count+req(frame.keyEvents==1 and context.events[2]==["key",27,false],"Escape key-up reaches active UI")
  context.down[session.VK_DOWN]=true;context.mouse=[-4,7];frame=session.frame(state,14)
  count=count+req(frame.keyEvents==1 and frame.mouseEvents==1 and frame.refreshed,"navigation and mouse dispatched before refresh")
  count=count+req(context.events[4]==["key",session.K_DOWNARROW,true] and context.events[5]==["mouse",-4,7],"native arrow translated to Quake key")
  context.down[session.VK_DOWN]=false;context.down[session.VK_SHIFT]=true;context.down[65]=true;frame=session.frame(state,15)
  count=count+req(frame.keyEvents==3 and frame.charEvents==1,"modifier, key and character events counted")
  foundKey=false;foundChar=false
  for each event in context.events
    if event==["key",97,true] then foundKey=true end if
    if event==["key",65|session.K_CHAR_FLAG,true] then foundChar=true end if
  end for
  count=count+req(foundKey and foundChar,"letter key remains lowercase while shifted character is uppercase")
  context.down[session.VK_SHIFT]=false;context.down[65]=false;session.frame(state,16)
  context.down[session.VK_ESCAPE]=true;frame=session.frame(state,17)
  count=count+req(frame.keyEvents==1 and not frame.active and not frame.refreshed,"active UI handles Escape and releases catcher")
  count=count+req(session.openMain(state)==0 and session.active(state),"main menu activation delegated")
  count=count+req(session.close(state)==0 and not session.active(state),"menu close delegated")
  count=count+req(try(session.setMenu(state,3)) is error,"invalid menu rejected")
  count=count+req(try(session.frame(state,-1)) is error,"negative frame time rejected")
  count=count+req(try(session.create(session.services(context,void,key,mouse,refresh,menu,commandCount),context,keyDown,mouseDelta)) is error,"incomplete services rejected")
  count=count+req(session.K_CHAR_FLAG==1024 and session.K_MOUSE1==178 and session.K_UPARROW==132,"Baseq3 key constants pinned")
  print("PASS: "+str(count)+" original UI session contracts");return 0
end function
