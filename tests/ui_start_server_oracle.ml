import mq3.client.ui_start_server as u

function boolean(value)
  if value then return 1 end if
  return 0
end function

function main(args)
  for each text in ["ffa","tourney","single","team","ctf","ffa single","TEAM ctf","unknown"]
    print("bits|"+text+"|"+str(u.gametypeBits(text)))
  end for

  value=u.options()
  value.gametype=u.GT_TEAM
  value.newBotIndex=2
  value.playerTypes[1]=1
  value.playerNames[1]="Sarge"
  print("selected|same|"+str(boolean(u.botAlreadySelected(value,"sarge"))))
  value.playerTeams[1]=1
  print("selected|other-team|"+str(boolean(u.botAlreadySelected(value,"SARGE"))))
  value.gametype=u.GT_FFA
  print("selected|ffa|"+str(boolean(u.botAlreadySelected(value,"SARGE"))))

  print("icon|fallback|"+u.serverPlayerIcon("anarki/red",false))
  print("icon|default|"+u.serverPlayerIcon("visor",false))
  print("icon|found|"+u.serverPlayerIcon("major/blue",true))
  return 0
end function
