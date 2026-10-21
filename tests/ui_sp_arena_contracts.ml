import mq3.client.ui_sp_arena as arena

struct Host maxClients tiers events end struct
function variableValue(host,name) host.events=host.events+[["get",name]];return host.maxClients end function
function setValue(host,name,value) host.events=host.events+[["set",name,value]];if name=="sv_maxclients" then host.maxClients=value end if;return void end function
function numTiers(host) host.events=host.events+[["tiers"]];return host.tiers end function
function executeText(host,when,text) host.events=host.events+[["exec",when,text]];return void end function
function require(ok,label) if not ok then return error(7751,"UI SP arena contract: "+label) end if;return 1 end function
function main(args)
  count=0;host=Host(4.0,7,[]);services=arena.services(host,variableValue,setValue,numTiers,executeText)
  result=arena.start(services,"\\num\\3\\map\\q3dm7")
  count=count+require(result.maxClientsRaised and result.selection==3 and result.map=="q3dm7" and result.command=="spmap q3dm7\n","ordinary arena result")
  count=count+require(host.events==[["get","sv_maxclients"],["set","sv_maxclients",8],["set","ui_spSelection",3],["exec",arena.EXEC_APPEND,"spmap q3dm7\n"]],"original trap ordering")
  host=Host(8.0,7,[]);services=arena.services(host,variableValue,setValue,numTiers,executeText);result=arena.start(services,"\\num\\9\\special\\TrAiNiNg\\map\\q3dm0")
  count=count+require(not result.maxClientsRaised and result.selection==-4,"training sentinel and case folding")
  count=count+require(host.events==[["get","sv_maxclients"],["set","ui_spSelection",-4],["exec",arena.EXEC_APPEND,"spmap q3dm0\n"]],"no redundant maxclient write")
  host=Host(12.0,6,[]);services=arena.services(host,variableValue,setValue,numTiers,executeText);result=arena.start(services,"\\num\\9\\special\\FINAL\\map\\q3tourney6")
  count=count+require(result.selection==24 and host.events[1]==["tiers"],"final arena follows tier count")
  host=Host(8.0,1,[]);services=arena.services(host,variableValue,setValue,numTiers,executeText);result=arena.start(services,"\\num\\garbage\\special\\bonus\\map\\")
  count=count+require(result.selection==0 and result.command=="spmap \n","CRT atoi fallback and empty map command")
  count=count+require(try(arena.start(void,"")) is error,"service validation")
  print("PASS: "+str(count)+" UI single-player arena contracts");return 0
end function
