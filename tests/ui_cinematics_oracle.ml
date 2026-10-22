import mq3.client.ui_cinematics as cinema
import mq3.client.ui_gameinfo as game
import std.string as strings

function row(label,id,event,demo)
  data=game.create();data.demoversion=demo;state=cinema.create(data,demo,false);cinema.menuEvent(state,id,event);cvar="";command="";if len(state.actions)>0 then cvar=state.actions[0].name+"="+state.actions[0].text end if;if len(state.actions)>1 then text=state.actions[1].text;command=str(state.actions[1].value)+":"+strings.substr(text,0,len(text)-1) end if;print(label+"|"+cvar+"|"+command);return void
end function
function main(args)
  row("ignored",11,1,false);row("logo",11,3,false);row("tier4",16,3,false);row("retail-end",20,3,false);row("demo-end",20,3,true);return 0
end function
