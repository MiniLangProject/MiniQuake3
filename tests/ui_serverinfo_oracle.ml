import mq3.client.ui_serverinfo as s
import mq3.client.ui_qmenu as q
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  v=s.create(false);s.Favorites_Add(v);print("empty "+str(len(v.actions)));v=s.create(false);v.currentAddress="127.0.0.1:27960";v.favorites=["bad"];s.Favorites_Add(v);print("add "+str(len(v.actions))+" "+v.actions[0].name+" "+v.actions[0].text);s.Favorites_Add(v);print("duplicate "+str(len(v.actions)));v=s.create(false);v.currentAddress="9.9.9.9:27960";for i=1 to 16 v.favorites=v.favorites+[str(i)+".0.0.1"] end for;s.Favorites_Add(v);print("full "+str(len(v.actions)));v=s.create(false);v.currentAddress="8.8.8.8:27960";s.ServerInfo_Event(v,s.ID_ADD,1);print("ignore "+str(len(v.actions))+" "+str(flag(v.popped)));s.ServerInfo_Event(v,s.ID_ADD,q.QM_ACTIVATED);print("event_add 1 "+str(flag(v.popped))+" "+v.actions[0].name);s.ServerInfo_Event(v,s.ID_BACK,q.QM_ACTIVATED);print("event_back 2");return 0
end function
