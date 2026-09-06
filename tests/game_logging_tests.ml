// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.logging as logging
import mq3.compat.numeric as n
import std.fs as fs
struct LogReader
  data
  offset
end struct
struct LogCheck
  expected
  offset
  words
  effects
  actions
  flags
  printTime
  printDedicated
  printHandle
  writeTime
  writeDedicated
  writeHandle
  nested
end struct
struct LogLevel
  time
  dedicated
  logFile
  gamePrintFn
  logWriteFn
  context
end struct
function logReadInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete logging input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function logReadText(reader)
  size = logReadInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid logging input bytes") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function logWord(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected logging output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Logging mismatch at action "+str(check.actions)+" byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function logBytes(check,data)
  logWord(check,len(data))
  for each value in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != value then return error(499,"Logging byte mismatch at action "+str(check.actions)+" byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function logState(level)
  check = level.context
  for each value in [level.time,level.dedicated,level.logFile,check.flags]
    logWord(check,value)
  end for
  return void
end function
function logRecordPrint(level,text)
  check = level.context; logWord(check,410); logBytes(check,bytes(text)); logState(level); check.effects = check.effects+1
  if (check.flags & 1) != 0 then level.time = check.printTime; level.dedicated = check.printDedicated; level.logFile = check.printHandle end if
  if (check.flags & 4) != 0 then check.flags = check.flags & ~4; logging.write(level,check.nested) end if
  return void
end function
function logRecordWrite(level,data,handle)
  check = level.context; logWord(check,411); logWord(check,handle); logBytes(check,data); logState(level); check.effects = check.effects+1
  if (check.flags & 2) != 0 then level.time = check.writeTime; level.dedicated = check.writeDedicated; level.logFile = check.writeHandle end if
  return void
end function
function logQuietPrint(level,text)
  level.context = level.context+[[1,text]]; return void
end function
function logQuietWrite(level,data,handle)
  level.context = level.context+[[2,decode(data),handle]]; return void
end function
function logClosePrint(level,text)
  logQuietPrint(level,text); level.logFile = 0; return void
end function
function logOpenPrint(level,text)
  logQuietPrint(level,text); level.logFile = 17; return void
end function
function logRequire(condition,label)
  if not condition then return error(499,"Failed logging contract: "+label) end if
  return void
end function
function logContracts()
  count = 0; level = LogLevel(0,0,0,void,void,[])
  logRequire(logging.write(level,"") is void and len(level.context) == 0,"disabled outputs need no hooks"); count = count+1
  logRequire(try(logging.write(level,void)) is error,"missing formatted payload"); count = count+1
  logRequire(logging.write(level,decode(bytes(1016,120))) is void,"largest defined format payload"); count = count+1
  logRequire(try(logging.write(level,decode(bytes(1017,120)))) is error,"format overflow rejected even with both outputs disabled"); count = count+1
  level.dedicated = 1; level.logFile = 7; level.logWriteFn = logQuietWrite
  logRequire(try(logging.write(level,"text")) is error and len(level.context) == 0,"console delivery precedes file delivery"); count = count+1
  level.gamePrintFn = logQuietPrint; level.logWriteFn = void
  logRequire(try(logging.write(level,"text")) is error and len(level.context) == 1 and level.context[0][1] == "text","missing file sink fails after console effect"); count = count+1
  level.context = []; level.logWriteFn = logQuietWrite
  logRequire(try(logging.write(level,decode(bytes(1017,120)))) is error and len(level.context) == 0,"overflow precedes all effects"); count = count+1
  nul = decode(bytes([0])); logRequire(try(logging.write(level,nul+decode(bytes(1016,120)))) is error,"NUL does not excuse overflow in already formatted trailing bytes"); count = count+1
  logging.write(level,"A"+nul+"B")
  logRequire(len(level.context) == 2 and level.context[0][1] == "A" and level.context[1][1] == "  0:00 A" and level.context[1][2] == 7,"strlen stops both deliveries at first NUL"); count = count+1
  level.context = []; level.gamePrintFn = logClosePrint; level.logWriteFn = void
  logRequire(logging.write(level,"close") is void and level.logFile == 0 and len(level.context) == 1,"console closes live handle before file check"); count = count+1
  level.context = []; level.gamePrintFn = logOpenPrint
  logRequire(try(logging.write(level,"open")) is error and level.logFile == 17 and len(level.context) == 1,"console opens live handle before file-sink check"); count = count+1
  level = LogLevel(-11000,0,3,void,logQuietWrite,[]); logging.write(level,"X")
  logRequire(level.context[0][1] == "  0:-1-X","negative stamp overwritten at byte seven"); count = count+1
  level.time = 2147483647; logging.write(level,"X")
  logRequire(level.context[1][1] == "35791:2X","large stamp overwritten at byte seven"); count = count+1
  print "PASS: "+str(count)+" logging runtime contracts"; return 0
end function
function main(args)
  if len(args) > 0 and args[0] == "--contracts" then return logContracts() end if
  reader = LogReader(fs.readAllBytes(args[0]),0); check = LogCheck(fs.readAllBytes(args[1]),0,0,0,0,0,0,0,0,0,0,0,"")
  level = LogLevel(0,0,0,logRecordPrint,logRecordWrite,check); actions = logReadInt(reader)
  for action = 1 to actions
    level.time = logReadInt(reader); level.dedicated = logReadInt(reader); level.logFile = logReadInt(reader); check.flags = logReadInt(reader)
    check.printTime = logReadInt(reader); check.printDedicated = logReadInt(reader); check.printHandle = logReadInt(reader)
    check.writeTime = logReadInt(reader); check.writeDedicated = logReadInt(reader); check.writeHandle = logReadInt(reader)
    payload = logReadText(reader); check.nested = logReadText(reader); logging.write(level,payload)
    logWord(check,419); logState(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete logging stream") end if
  print "PASS: "+str(check.actions)+" logging actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
