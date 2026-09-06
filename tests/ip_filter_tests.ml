// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete filter storage and actual VM/engine Cvars at every host boundary.
import mq3.game.ip_filters as ip
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n
import std.fs as fs
struct IpReader
  data
  offset
end struct
struct IpCheck
  expected
  offset
  words
  effects
  actions
end struct
struct IpLevel
  ipFilters
  gameCvars
  cvarSetFn
  gamePrintFn
  context
  registry
end struct
struct IpRow
  vmName
  vm
end struct
struct IpRows
  rows
end struct
function ipReadInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete IP input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function ipReadText(reader)
  size = ipReadInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid IP input string") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function ipWord(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected IP output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"IP mismatch at action "+str(check.actions)+" byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function ipWords(check,values)
  for each value in values
    ipWord(check,value)
  end for
  return void
end function
function ipBoolean(check,value)
  if value then return ipWord(check,1) end if
  return ipWord(check,0)
end function
function ipTextWord(check,value)
  if value == void then return ipWord(check,-1) end if
  data = bytes(value); ipWord(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"IP text mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function ipVmSnapshot(check,vm)
  ipWords(check,[vm.handle,vm.modificationCount,n.floatBits(vm.value),vm.integer]); ipTextWord(check,vm.string); return void
end function
function ipEngineSnapshot(check,registry,name)
  variable = cv.find(registry,name); ipWords(check,[variable.index,variable.flags]); ipBoolean(check,variable.modified)
  ipWords(check,[variable.modificationCount,n.floatBits(variable.value),variable.integer])
  ipTextWord(check,variable.string); ipTextWord(check,variable.resetString); ipTextWord(check,variable.latchedString); return void
end function
function ipSnapshot(level)
  check = level.context; state = ip.get(level); ipWords(check,[201,state.count])
  for each filter in state.filters
    ipWords(check,[filter.mask,filter.compare])
  end for
  buffer = ip.banBytes(level)
  for index = 0 to 63
    ipWord(check,n.readU32(buffer,index*4))
  end for
  ipVmSnapshot(check,ip.filterVm(level,"g_banIPs")); ipVmSnapshot(check,ip.filterVm(level,"g_filterBan"))
  ipWords(check,[level.registry.numIndexes,level.registry.modifiedFlags])
  ipEngineSnapshot(check,level.registry,"g_banIPs"); ipEngineSnapshot(check,level.registry,"g_filterBan"); return void
end function
function ipRecordPrint(level,text)
  check = level.context; ipWords(check,[200,1]); ipTextWord(check,""); ipTextWord(check,text)
  ipSnapshot(level); check.effects = check.effects+1; return void
end function
function ipRecordSet(level,name,text)
  check = level.context; ipWords(check,[200,2]); ipTextWord(check,name); ipTextWord(check,text)
  ipSnapshot(level); check.effects = check.effects+1; cv.set2(level.registry,name,text,true); return void
end function
function ipNewLevel(check)
  registry = cv.create(); ban = cv.createVm(); filter = cv.createVm()
  cv.registerVm(registry,ban,"g_banIPs","",1); cv.registerVm(registry,filter,"g_filterBan","1",1)
  level = IpLevel(void,void,ipRecordSet,ipRecordPrint,check,registry); ip.bindVm(level,ban,filter); return level
end function
function ipRefresh(level,which)
  if which == 0 or which == 1 then cv.updateVm(level.registry,ip.filterVm(level,"g_banIPs")) end if
  if which == 0 or which == 2 then cv.updateVm(level.registry,ip.filterVm(level,"g_filterBan")) end if
  return void
end function
function ipQuietPrint(level,text)
  level.context = level.context+[text]; return void
end function
function ipQuietSet(level,name,text)
  cv.set2(level.registry,name,text,true); return void
end function
function ipContractLevel()
  level = ipNewLevel([]); level.gamePrintFn = ipQuietPrint; level.cvarSetFn = ipQuietSet; return level
end function
function ipRequire(condition,label)
  if not condition then return error(499,"Failed IP contract: "+label) end if
  return void
end function
function ipContracts()
  count = 0; level = ipContractLevel(); state = ip.get(level)
  ipRequire(state.count == 0 and len(state.filters) == 1024 and state.filters[0] != state.filters[1],"separate zeroed filter storage"); count = count+1
  for each address in ["","1","1.2","1.2.3","1.2.3.","1:27960","1.2:27960","1.2.3:27960",":","a."]
    ipRequire(try(ip.filterPacket(level,address)) is error,"uninitialized native packet octets"); count = count+1
  end for
  ipRequire(not ip.filterPacket(level,"localhost") and not ip.filterPacket(level,"1.2.3.a") and not ip.filterPacket(level,"1.2.3.:"),"four initialized nonnumeric packet octets stay defined"); count = count+1
  embedded = decode(bytes([49,0,50]))
  ipRequire(try(ip.filterPacket(level,embedded)) is error,"embedded packet NUL"); count = count+1
  parsed = ip.Filter(7,9)
  ipRequire(try(ip.stringToFilter(level,embedded,parsed)) is error and parsed.mask == 7 and parsed.compare == 9,"embedded mask NUL preserves output"); count = count+1
  ipRequire(try(ip.stringToFilter(level,decode(bytes(128,57)),parsed)) is error and parsed.mask == 7 and parsed.compare == 9,"native 128 byte numeric scratch overflow rejected"); count = count+1
  ipRequire(not ip.stringToFilter(level,"1.2.bad",parsed) and parsed.mask == 7 and parsed.compare == 9 and level.context[0] == "Bad filter address: bad\n","failed conversion and suffix diagnostic"); count = count+1
  ip.addIP(level,"1.2.3.4"); ip.removeCommand(level,["removeip","1.2.3.4"]); ip.addIP(level,"bad")
  ipRequire(state.count == 1 and state.filters[0].mask == 0xffffffff and state.filters[0].compare == 0xffffffff,"failed reuse retains removed mask"); count = count+1
  ipRequire(ip.filterPacket(level,"255.255.255.255"),"freed full mask still matches packet sentinel"); count = count+1
  ip.addIP(level,"10.*")
  ipRequire(state.count == 1 and state.filters[0].mask == 255 and state.filters[0].compare == 10,"first free slot reused"); count = count+1
  ipRequire(ip.filterVm(level,"g_banIPs").string == "" and cv.find(level.registry,"g_banIPs").string == "10.*.*.* ","engine set does not refresh VM snapshot"); count = count+1
  ipRefresh(level,1); ip.processBans(level)
  ipRequire(state.count == 2 and ip.filterVm(level,"g_banIPs").string == "10.*.*.*" and ip.banBytes(level)[8] == 0,"process mutates live VM string and retains prior filters"); count = count+1
  ip.processBans(level); ipRequire(state.count == 2,"repeated process without VM refresh sees truncated prefix"); count = count+1
  cv.set2(level.registry,"g_banIPs","1.2.3.4",true); ipRefresh(level,1); ip.processBans(level)
  ipRequire(state.count == 2,"last unterminated token ignored"); count = count+1
  cv.set2(level.registry,"g_filterBan","0",true)
  ipRequire(ip.filterPacket(level,"10.3.2.1"),"pending whitelist change waits for VM refresh"); count = count+1
  ipRefresh(level,2)
  ipRequire(not ip.filterPacket(level,"10.3.2.1") and ip.filterPacket(level,"11.3.2.1"),"refreshed whitelist reverses matched and unmatched results"); count = count+1
  actual = cv.createVm(); actual.integer = 1; level.gameCvars = IpRows([IpRow("g_filterBan",actual)])
  ipRequire(ip.filterPacket(level,"10.3.2.1"),"game VM table takes priority over isolated binding"); count = count+1
  ipRequire(try(ip.processBans(level)) is error,"missing table row does not silently use isolated binding"); count = count+1
  level.gameCvars = void; state.count = -1
  ipRequire(try(ip.filterPacket(level,"1.2.3.4")) is error,"negative filter count"); count = count+1
  state.count = 1025
  ipRequire(try(ip.updateBans(level)) is error,"filter count exceeds original capacity"); count = count+1
  state.count = 0; ip.filterVm(level,"g_banIPs").string = decode(bytes(256,97))
  ipRequire(try(ip.processBans(level)) is error,"overlength VM storage"); count = count+1
  missing = IpLevel(void,void,void,void,void,void)
  ipRequire(try(ip.filterPacket(missing,"1.2.3.4")) is error,"missing VM boundary"); count = count+1
  ipRequire(try(ip.addCommand(missing,[])) is error,"missing diagnostic boundary"); count = count+1
  ipRequire(try(ip.addIP(missing,"1.2.3.4")) is error,"missing engine Cvar delivery"); count = count+1
  diagnostic = ipContractLevel(); parsed = ip.Filter(7,9)
  ipRequire(try(ip.stringToFilter(diagnostic,decode(bytes(1003,120)),parsed)) is error and len(diagnostic.context) == 0 and parsed.mask == 7 and parsed.compare == 9,"oversized bad-address diagnostic rejected before G_Printf sink"); count = count+1
  ipRequire(try(ip.removeCommand(diagnostic,["removeip","1.2.3.4"+decode(bytes(1003,120))])) is error and len(diagnostic.context) == 0,"oversized remove-miss diagnostic rejected before G_Printf sink"); count = count+1
  ipRequire(try(ip.addCommand(diagnostic,["addip",decode(bytes(1500,120))])) is error and len(diagnostic.context) == 0 and cv.find(diagnostic.registry,"g_banIPs").string == "","oversized copied-argument diagnostic rejected before persistence"); count = count+1
  print "PASS: "+str(count)+" IP runtime contracts"; return 0
end function
function main(args)
  if len(args) > 0 and args[0] == "--contracts" then return ipContracts() end if
  reader = IpReader(fs.readAllBytes(args[0]),0); check = IpCheck(fs.readAllBytes(args[1]),0,0,0,0)
  level = ipNewLevel(check); state = ip.get(level); count = ipReadInt(reader)
  for action = 1 to count
    kind = ipReadInt(reader); result = 0; parsed = ip.Filter(0,0)
    switch kind
      case 1
        ip.addIP(level,ipReadText(reader))
      end case
      case 2,3
        argc = ipReadInt(reader); text = ipReadText(reader); argv = []
        if argc > 0 then
          for index = 0 to argc-1
            if index == 1 then argv = argv+[text] else argv = argv+["ignored"] end if
          end for
        end if
        if kind == 2 then ip.addCommand(level,argv) else ip.removeCommand(level,argv) end if
      end case
      case 4
        if ip.filterPacket(level,ipReadText(reader)) then result = 1 end if
      end case
      case 5
        ip.processBans(level)
      end case
      case 6
        name = ipReadText(reader); text = ipReadText(reader); cv.set2(level.registry,name,text,true)
      end case
      case 7
        ipRefresh(level,ipReadInt(reader))
      end case
      case 8
        maximum = ipReadInt(reader); mask = n.u32(ipReadInt(reader)); compare = n.u32(ipReadInt(reader)); step = n.u32(ipReadInt(reader))
        if maximum < 0 or maximum > 1024 then return error(499,"Invalid fixture filter count") end if
        state.count = maximum
        for index = 0 to 1023
          state.filters[index].mask = 0; state.filters[index].compare = 0
          if index < maximum then state.filters[index].mask = mask; state.filters[index].compare = n.u32(compare+index*step) end if
        end for
      end case
      case 9
        index = ipReadInt(reader); mask = ipReadInt(reader); compare = ipReadInt(reader)
        state.filters[index].mask = n.u32(mask); state.filters[index].compare = n.u32(compare)
      end case
      case 10
        text = ipReadText(reader); parsed.mask = n.u32(ipReadInt(reader)); parsed.compare = n.u32(ipReadInt(reader))
        if ip.stringToFilter(level,text,parsed) then result = 1 end if
      end case
      case 11
        ip.updateBans(level)
      end case
      case 12
        name = ipReadText(reader); cv.find(level.registry,name).modificationCount = ipReadInt(reader)
      end case
      case default
        return error(499,"Invalid IP action")
      end case
    end switch
    ipWords(check,[202,kind,result,parsed.mask,parsed.compare]); ipSnapshot(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete IP output stream") end if
  print "PASS: "+str(check.actions)+" IP actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
