// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_team as team
function main(args)
  for each value in [0,1,2,3,-1,99]
    print("team "+str(value)+" "+str(team.OtherTeam(value))+" "+team.TeamName(value)+" "+team.OtherTeamName(value)+" "+team.TeamColorString(value))
  end for
  clients = [63,1,31,0,-1,999]; index = 1
  while index < len(clients)
    value = clients[index]; previous = index-1
    while previous >= 0 and team.SortClients(clients[previous],value) > 0
      clients[previous+1] = clients[previous]; previous = previous-1
    end while
    clients[previous+1] = value; index = index+1
  end while
  text = "sort"; for each value in clients text = text+" "+str(value) end for; print(text)
  return 0
end function
