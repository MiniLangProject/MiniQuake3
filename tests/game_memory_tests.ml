// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.memory as memory
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.cvars as gameCvars
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
struct Reader
  data
  offset
end struct
struct Check
  expected
  offset
  words
  effects
end struct
function readInt(reader)
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readText(reader)
  length = readInt(reader); text = decode(slice(reader.data,reader.offset,length)); reader.offset = reader.offset+length; return text
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected memory output") end if
  expected = n.readI32(check.expected,check.offset)
  if value != expected then return error(499,"Memory mismatch at byte "+str(check.offset)+": "+str(value)+" != "+str(expected)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function textWord(check,text)
  if text == void then return word(check,-1) end if
  data = bytes(text); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Memory text mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function recordMemoryPrint(level,text)
  check = level.context; words(check,[310,memory.get(level).allocPoint]); textWord(check,text)
  check.effects = check.effects+1; return void
end function
function arenaLevel(world,check)
  level = game.create(world); level.context = check; level.gamePrintFn = recordMemoryPrint; return level
end function
function memorySnapshot(level,blocks)
  check = level.context; state = memory.get(level); words(check,[319,state.allocPoint,state.debugAlloc,len(blocks)])
  for each block in blocks
    words(check,[block.offset,block.size])
  end for
  ent = level.entities[64]
  textWord(check,ent.classname); textWord(check,ent.message); textWord(check,ent.team); textWord(check,ent.target); textWord(check,ent.targetname)
  textWord(check,ent.model); textWord(check,ent.model2); textWord(check,ent.targetShaderName); textWord(check,ent.targetShaderNewName)
  return void
end function
function requireMemory(condition,label)
  if not condition then return error(499,"Failed game-memory contract: "+label) end if
  return void
end function
function quietMemoryPrint(level,text)
  return void
end function
function memoryContracts(world)
  level = game.create(world); state = memory.get(level); count = 0
  for each size in [-1,-32,2147483617,2147483647,1.0,"4",void]
    requireMemory(try(memory.allocate(level,size)) is error and state.allocPoint == 0,"allocation domain"); count = count+1
  end for
  state.allocPoint = -32; requireMemory(try(memory.allocate(level,1)) is error,"negative arena position"); count = count+1
  state.allocPoint = 1; requireMemory(try(memory.allocate(level,1)) is error,"unaligned arena position"); count = count+1
  state.allocPoint = 262176; requireMemory(try(memory.allocate(level,0)) is error,"past arena position"); count = count+1
  state.allocPoint = 262144; requireMemory(try(memory.allocate(level,2147483616)) is error,"signed-overflow domain"); count = count+1
  memory.init(level); state.debugAlloc = 1
  requireMemory(try(memory.allocate(level,1)) is error and state.allocPoint == 0,"debug diagnostic delivery before mutation"); count = count+1
  requireMemory(try(memory.status(level)) is error,"status diagnostic delivery"); count = count+1
  level.gamePrintFn = quietMemoryPrint; state.debugAlloc = 0; block = memory.allocate(level,2)
  for each index in [-1,2,1.0]
    requireMemory(try(memory.readByte(block,index)) is error,"bounded arena read"); count = count+1
    requireMemory(try(memory.writeByte(block,index,0)) is error,"bounded arena write"); count = count+1
  end for
  for each value in [-1,256,1.0]
    requireMemory(try(memory.writeByte(block,0,value)) is error,"byte input"); count = count+1
  end for
  memory.writeByte(block,0,65); memory.writeByte(block,1,66)
  requireMemory(try(memory.blockString(block)) is error,"unterminated pool string"); count = count+1
  requireMemory(try(memory.newString(level,void)) is error,"NULL string"); count = count+1
  memory.init(level)
  requireMemory(try(memory.newString(level,"x\\")) is error and state.allocPoint == 32 and state.pool[0] == 120 and state.pool[1] == 92,"trailing escape preserves actual writes before rejection"); count = count+1
  other = game.create(world); requireMemory(memory.get(other) != state and memory.get(other).pool[0] == 0,"separate module arenas"); count = count+1
  spawn.create(level,""); cvars = gameCvars.attach(level,"memory test"); gameCvars.register(level)
  cv.set2(cvars.registry,"g_debugAlloc","1",true)
  level.gamePrintFn = void; memory.init(level)
  requireMemory(not (try(memory.allocate(level,1)) is error),"engine changes do not refresh VM snapshot early"); count = count+1
  gameCvars.update(level)
  requireMemory(try(memory.allocate(level,1)) is error and state.allocPoint == 32,"refreshed g_debugAlloc VM drives allocator"); count = count+1
  print "PASS: "+str(count)+" game-memory runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3] == "--contracts" then return memoryContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0)
  level = arenaLevel(world,check); blocks = []; count = readInt(reader)
  for step = 0 to count-1
    kind = readInt(reader)
    switch kind
      case 1
        memory.init(level)
      end case
      case 2
        block = try(memory.allocate(level,readInt(reader)))
        if block is error then word(check,312) else blocks = blocks+[block]; words(check,[311,block.offset,block.size]) end if
      end case
      case 3
        memory.get(level).debugAlloc = readInt(reader)
      end case
      case 4
        memory.status(level)
      end case
      case 5
        block = blocks[readInt(reader)]; index = readInt(reader); memory.writeByte(block,index,readInt(reader))
      end case
      case 6
        offset = readInt(reader); size = readInt(reader); words(check,[313,offset,size]); state = memory.get(level)
        if size > 0 then
          for i = 0 to size-1
            word(check,state.pool[offset+i])
          end for
        end if
      end case
      case 7
        block = try(memory.newStringBlock(level,readText(reader)))
        if block is error then word(check,312)
        else
          blocks = blocks+[block]; words(check,[311,block.offset,block.size,314]); textWord(check,memory.blockString(block))
        end if
      end case
      case 8
        old = memory.get(level); level = arenaLevel(world,check); level.memoryState = old
      end case
      case 9
        key = readText(reader); value = readText(reader); outcome = try(spawn.parseLevelField(level,key,value,level.entities[64]))
        if outcome is error then word(check,312) end if
      end case
      case 10
        block = blocks[readInt(reader)]; value = readInt(reader)
        if block.size > 0 then
          for i = 0 to block.size-1
            memory.writeByte(block,i,(value+i) & 255)
          end for
        end if
      end case
      case default
        return error(499,"Invalid game-memory action")
      end case
    end switch
    memorySnapshot(level,blocks)
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete game-memory comparison") end if
  print "PASS: "+str(count)+" game-memory actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
