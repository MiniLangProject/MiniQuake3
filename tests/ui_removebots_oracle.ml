import mq3.client.ui_remove_bots as remove

function row(label,event,base,selected)
  state=remove.create(false);state.numBots=64;state.baseBotNum=base;state.selectedBotNum=selected;for i=0 to 63 state.botClientNums=state.botClientNums+[i*2+1] end for;remove.deleteEvent(state,event);text="";if len(state.actions)>0 then text="2:"+state.actions[0].text end if;print(label+"|"+text);return void
end function
function main(args) row("ignored",1,0,0);row("first",3,0,0);row("selected",3,0,4);row("paged",3,3,4);return 0 end function
