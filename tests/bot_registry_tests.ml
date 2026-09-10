import mq3.game.bot_registry as registry
import mq3.shared.info as info

struct Fixture
  names
  bodies
  botFiles
  arenaFiles
  prints
  reads
end struct

function require(value,label)
  if not value then return error(499,"Failed bot registry contract: "+label) end if
  return void
end function

function readFile(fixture,name)
  fixture.reads = fixture.reads+[name]
  index = 0
  while index < len(fixture.names)
    if fixture.names[index] == name then return fixture.bodies[index] end if
    index = index+1
  end while
  return void
end function

function listFiles(fixture,path,extension,capacity)
  require(path == "scripts" and capacity == 1024,"native list request")
  if extension == ".bot" then return fixture.botFiles end if
  if extension == ".arena" then return fixture.arenaFiles end if
  return []
end function

function printLine(fixture,text)
  fixture.prints = fixture.prints+[text]; return void
end function

function makeFixture()
  return Fixture(
    ["scripts/bots.txt","scripts/extra.bot","scripts/arenas.txt","scripts/bonus.arena","custom.cfg"],
    ["{ name Sarge model sarge/default }", "{ name \"Major Major\" funname Major }",
     "{ map q3dm1 longname \"Arena Gate\" }", "{ map q3dm2 type ffa }", "{ name Custom }"],
    ["extra.bot"],["bonus.arena"],[],[])
end function

function main(args)
  count = 0; fixture = makeFixture(); state = registry.create(readFile,listFiles,printLine,fixture)
  parsed = registry.parseInfos(state,"{ first one second two } { name \"Line Value\" }",4)
  require(len(parsed) == 2,"parse count"); count = count+1
  require(parsed[0] == "\\second\\two\\first\\one","Info_SetValueForKey prepend order"); count = count+1
  require(info.value(parsed[1],"name") == "Line Value","quoted parse"); count = count+1

  before = len(fixture.prints); missing = registry.parseInfos(state,"oops",3)
  require(len(missing) == 0 and fixture.prints[before] == "Missing { in info file\n","missing brace diagnostic"); count = count+1
  before = len(fixture.prints); capped = registry.parseInfos(state,"{ a b } { c d }",1)
  require(len(capped) == 1 and fixture.prints[before] == "Max infos exceeded\n","max before next body"); count = count+1
  before = len(fixture.prints); partial = registry.parseInfos(state,"{ key",2)
  require(len(partial) == 1 and info.value(partial[0],"key") == "<NULL>" and fixture.prints[before] == "Unexpected end of info file\n","line value and eof semantics"); count = count+1

  registry.loadBots(state,true,"")
  require(fixture.reads[0] == "scripts/bots.txt" and fixture.reads[1] == "scripts/extra.bot","bot file order"); count = count+1
  require(len(state.botInfos) == 2 and info.value(state.botInfos[0],"name") == "Sarge","bot load"); count = count+1
  require(registry.getBotInfoByName(state,"major major") == state.botInfos[1],"case-insensitive bot lookup"); count = count+1
  require(registry.getBotInfoByNumber(state,0) == state.botInfos[0],"number lookup"); count = count+1
  before = len(fixture.prints); require(registry.getBotInfoByNumber(state,2) == void and fixture.prints[before] == "^1Invalid bot number: 2\n","invalid number"); count = count+1
  saved = state.botInfos; registry.loadBots(state,false,"custom.cfg")
  require(state.botInfos == saved and len(fixture.reads) == 2,"disabled bot load retains registry"); count = count+1

  registry.loadArenas(state,"")
  require(len(state.arenaInfos) == 2,"arena load"); count = count+1
  require(info.value(state.arenaInfos[0],"num") == "0" and info.value(state.arenaInfos[1],"num") == "1","arena numbering"); count = count+1
  require(registry.getArenaInfoByMap(state,"Q3DM2") == state.arenaInfos[1],"case-insensitive map lookup"); count = count+1
  require(registry.getArenaInfoByMap(state,"missing") == void,"missing map lookup"); count = count+1
  require(fixture.prints[len(fixture.prints)-1] == "2 arenas parsed\n","arena count diagnostic before numbering"); count = count+1

  registry.loadBots(state,true,"custom.cfg")
  require(len(state.botInfos) == 2 and info.value(state.botInfos[0],"name") == "Custom","custom base file then extension"); count = count+1
  tooLarge = bytes(8192,65); fixture.names = fixture.names+["huge.bot"]; fixture.bodies = fixture.bodies+[tooLarge]
  before = len(fixture.prints); registry.loadBotsFromFile(state,"huge.bot")
  require(len(state.botInfos) == 2 and fixture.prints[before] == "^1file too large: huge.bot is 8192, max allowed is 8192","8192-byte rejection"); count = count+1
  before = len(fixture.prints); registry.loadBotsFromFile(state,"absent.bot")
  require(fixture.prints[before] == "^1file not found: absent.bot\n","missing file diagnostic"); count = count+1
  print "PASS: "+str(count)+" bot registry contracts"
  return 0
end function
