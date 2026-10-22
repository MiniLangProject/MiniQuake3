import mq3.client.ui_specifyleague as s
import mq3.client.ui_qmenu as q

function ready()
  state=s.create(false);s.SpecifyLeague_MenuInit(state,"Player",["Alpha League","Beta League","Gamma League"]);state.actions=[];state.list.curvalue=1;return state
end function

function run(id,event,name)
  state=ready();state.rankname.buffer=name;s.SpecifyLeague_Event(state,id,event,["Alpha League","Beta League","Gamma League"]);refreshes=0;pops=0;cvarName="";cvarValue="";for each action in state.actions if action.kind=="get-leagues" then refreshes=refreshes+1 else if action.kind=="pop-menu" then pops=pops+1 else if action.boundary=="cvar" then cvarName=action.name;cvarValue=action.text end if end for;print(str(id)+" "+str(event)+" "+str(state.list.curvalue)+" "+str(refreshes)+" "+str(pops)+" "+cvarName+" "+cvarValue);return void
end function

function main(args)
  run(s.ID_SPECIFYLEAGUELIST,q.QM_GOTFOCUS,"Player");run(s.ID_SPECIFYLEAGUEUP,q.QM_ACTIVATED,"Player");run(s.ID_SPECIFYLEAGUEDOWN,q.QM_ACTIVATED,"Player");run(s.ID_SPECIFYLEAGUENAME,q.QM_LOSTFOCUS,"Play");run(s.ID_SPECIFYLEAGUENAME,q.QM_LOSTFOCUS,"Other");run(s.ID_SPECIFYLEAGUEBACK,q.QM_ACTIVATED,"Player");return 0
end function
