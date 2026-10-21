import mq3.client.ui_team as team
function req(ok,label) if not ok then return error(7862,"UI team contract: "+label) end if;return 1 end function
function main(args)
  count=0;ffa=team.open(team.GT_FFA);ctf=team.open(team.GT_CTF)
  count=count+req(ffa.wrapAround and not ffa.fullscreen and len(ffa.items)==4 and ffa.actions==["push"],"menu topology")
  count=count+req(ffa.items[0].grayed and ffa.items[1].grayed and not ffa.items[2].grayed,"FFA states")
  count=count+req(not ctf.items[0].grayed and not ctf.items[1].grayed and ctf.items[2].grayed,"team states")
  ctf=team.event(ctf,team.ID_JOINRED,team.QM_ACTIVATED);count=count+req(ctf.commands==["cmd team red\n"] and ctf.actions[len(ctf.actions)-1]=="forceOff","join red")
  ctf=team.event(ctf,team.ID_JOINBLUE,team.QM_ACTIVATED);count=count+req(ctf.commands[1]=="cmd team blue\n","join blue")
  ctf=team.event(ctf,team.ID_JOINGAME,team.QM_ACTIVATED);count=count+req(ctf.commands[2]=="cmd team free\n","join game")
  ctf=team.event(ctf,team.ID_SPECTATE,team.QM_ACTIVATED);count=count+req(ctf.commands[3]=="cmd team spectator\n","spectate")
  before=len(ctf.commands);ctf=team.event(ctf,team.ID_JOINRED,0);count=count+req(len(ctf.commands)==before,"ignore non activation")
  count=count+req(team.cache()==["menu/art/cut_frame"],"cache")
  print("PASS: "+str(count)+" UI team contracts");return 0
end function
