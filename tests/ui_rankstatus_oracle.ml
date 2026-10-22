import mq3.client.ui_rankstatus as r
import mq3.client.ui_rankings as rankings
import mq3.client.ui_qmenu as q

function run(status,event)
  state=r.create(false);state.status=status;r.RankStatus_MenuEvent(state,r.ID_OK,event);sequence="";for each action in state.actions if action.kind=="pop-menu" then sequence=sequence+"P" else if action.name=="rankings" then sequence=sequence+"R" else if action.name=="login" then sequence=sequence+"L" else if action.name=="signup" then sequence=sequence+"S" end if end for;print(str(status)+" "+str(event)+" "+sequence);return void
end function

function main(args)
  run(rankings.QGR_STATUS_BAD_PASSWORD,1);run(rankings.QGR_STATUS_NO_USER,q.QM_ACTIVATED);run(rankings.QGR_STATUS_BAD_PASSWORD,q.QM_ACTIVATED);run(rankings.QGR_STATUS_USER_EXISTS,q.QM_ACTIVATED);run(rankings.QGR_STATUS_ACTIVE,q.QM_ACTIVATED);return 0
end function
