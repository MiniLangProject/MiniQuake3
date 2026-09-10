// SPDX-License-Identifier: GPL-2.0-or-later
// Differential consumer for tests/reference/bot_registry_oracle.c.
import mq3.game.bot_registry as registry
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.fs as fs

struct Fixture
  names
  bodies
  botFiles
  arenaFiles
  prints
end struct

function readFile(fixture,name)
  index = 0
  while index < len(fixture.names)
    if fixture.names[index] == name then return fixture.bodies[index] end if
    index = index+1
  end while
  return void
end function
function listFiles(fixture,path,extension,capacity)
  if extension == ".bot" then return fixture.botFiles end if
  return fixture.arenaFiles
end function
function printLine(fixture,message)
  fixture.prints = fixture.prints+[message]; return void
end function
function textWords(result,value)
  if value == void then return result+[-1] end if
  data = bytes(value); result = result+[len(data)]
  for each part in data result = result+[part] end for
  return result
end function
function snapshot(state,id,lookup1,lookup2)
  result = [0x42524547,id,len(state.context.prints)]
  for each message in state.context.prints result = textWords(result,message) end for
  result = result+[len(state.botInfos)]; for each value in state.botInfos result = textWords(result,value) end for
  result = result+[len(state.arenaInfos)]; for each value in state.arenaInfos result = textWords(result,value) end for
  result = textWords(result,lookup1); return textWords(result,lookup2)
end function
function checkExpected(expected,actual)
  if len(expected) != len(actual)*4 then return error(490,"Bot registry oracle size mismatch") end if
  for index = 0 to len(actual)-1
    wanted = n.readI32(expected,index*4); got = n.i32(actual[index])
    if got != wanted then return error(490,"Bot registry mismatch word "+str(index)+" got "+str(got)+" wanted "+str(wanted)) end if
  end for
  return void
end function
function main(args)
  if len(args) != 2 then return error(490,"Expected case and oracle") end if
  id = textnum.atoi(args[0]); fixture = Fixture([],[],[],[],[]); state = registry.create(readFile,listFiles,printLine,fixture)
  lookup1 = void; lookup2 = void
  if id == 1 then
    state.botInfos = registry.parseInfos(state,"{ first one second two } { name \"Line Value\" }",4)
    lookup1 = registry.getBotInfoByName(state,"line value"); lookup2 = registry.getBotInfoByNumber(state,0)
  else if id == 2 then
    state.botInfos = registry.parseInfos(state,"{ key\nnext value } { ignored yes }",1)
    lookup1 = registry.getBotInfoByName(state,"missing"); lookup2 = registry.getBotInfoByNumber(state,1)
  else if id == 3 then
    fixture.names = ["scripts/bots.txt","scripts/extra.bot","scripts/arenas.txt","scripts/bonus.arena"]
    fixture.bodies = ["{ name Sarge model sarge/default }","{ name \"Major Major\" }","{ map q3dm1 longname \"Arena Gate\" }","{ map q3dm2 type ffa }"]
    fixture.botFiles = ["extra.bot"]; fixture.arenaFiles = ["bonus.arena"]
    registry.loadBots(state,true,""); registry.loadArenas(state,"")
    lookup1 = registry.getBotInfoByName(state,"MAJOR MAJOR"); lookup2 = registry.getArenaInfoByMap(state,"Q3DM2")
  else if id == 4 then
    fixture.names = ["custom.cfg","maps.cfg"]; fixture.bodies = ["{ name Custom } { name Second }","{ map custom fraglimit 7 }"]
    registry.loadBots(state,true,"custom.cfg"); registry.loadArenas(state,"maps.cfg")
    lookup1 = registry.getBotInfoByNumber(state,-1); lookup2 = registry.getArenaInfoByMap(state,"CUSTOM")
  else if id == 5 then
    fixture.names = ["huge.bot"]; fixture.bodies = [bytes(8192,65)]
    registry.loadBotsFromFile(state,"huge.bot"); registry.loadBotsFromFile(state,"missing.bot")
  else return error(490,"Invalid bot registry case") end if
  actual = snapshot(state,id,lookup1,lookup2); expected = fs.readAllBytes(args[1]); checkExpected(expected,actual)
  print "PASS: "+str(len(actual))+" bot registry words"; return 0
end function
