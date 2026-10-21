import mq3.client.ui_add_bots as add

function row(label,event,skill,team,delay,bot)
  state=add.create(void,false);state.skill=skill;state.team=team;state.teamNames=["Red","Blue"];state.delay=delay;state.botnames[0]=bot;add.fightEvent(state,event);text="";if len(state.actions)>0 then text="2:"+state.actions[0].text end if;print(label+"|"+text+"|"+str(state.delay));return void
end function
function main(args) row("ignored",1,2,0,1000,"Sarge");row("red",3,0,0,1000,"Sarge");row("blue",3,4,1,2500,"Xaero");row("spaces",3,2,0,4000,"Major Major");return 0 end function
