import mq3.client.ui_demos as demos
import std.string as strings

function row(label,id,event,selected)
  state=demos.create(false);state.names=["DEMO001","Q3DM17_RUN","ZED"];state.numDemos=3;state.goVisible=true;state.selected=selected;demos.menuEvent(state,id,event);command="";forceOff=0;popped=0;scrollKey=0;for each action in state.actions if action.kind=="execute" then command=str(action.value)+":"+strings.substr(action.text,0,len(action.text)-1) else if action.kind=="force-menu-off" then forceOff=forceOff+1 else if action.kind=="menu-pop" then popped=popped+1 else if action.kind=="scroll-key" then scrollKey=action.value end if end for;print(label+"|"+command+"|"+str(forceOff)+"|"+str(popped)+"|"+str(scrollKey));return void
end function
function main(args)
  row("ignored",11,1,0);row("go",11,3,1);row("back",10,3,0);row("left",14,3,0);row("right",13,3,0);row("list",12,3,0);return 0
end function
