// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.qcommon.filesystem as qfs
import mq3.qcommon.md4 as md4
import std.fs as fs
import std.string as strings

function require(condition,message)
  if not condition then print "FAIL: "+message; return error(3511,message) end if
  return void
end function
function wrongLocalFile(name)
  return name == "mod/custom.pk3"
end function
function noLocalFile(name)
  return false
end function

function main(args)
  checksumCases = 0
  for each line in fs.readAllLines(args[0])
    line = strings.trim(line)
    if len(line) == 0 then continue end if
    fields = strings.split(line,"\t"); data = fs.readAllBytes(fields[0]); key = toNumber(fields[1])
    require(n.i32(md4.blockChecksum(data)) == n.i32(toNumber(fields[2])),"block checksum "+str(checksumCases))
    require(n.i32(md4.blockChecksumKey(data,key)) == n.i32(toNumber(fields[3])),"keyed checksum "+str(checksumCases))
    checksumCases = checksumCases+1
  end for

  feed = toNumber(args[4]); expected0 = toNumber(args[5]); pure0 = toNumber(args[6]); expected1 = toNumber(args[7]); pure1 = toNumber(args[8])
  state = qfs.create(feed)
  qfs.mountGameDirectory(state,args[1],"baseq3",[args[3],args[2]],["loose.cfg","maps/loose.bsp"])
  hostState = qfs.create(feed); discovered = qfs.mountHostGameDirectory(hostState,args[1],"baseq3")
  require(len(discovered[0])==2 and len(discovered[1])==1 and discovered[1][0]=="loose.cfg","automatic host game-directory enumeration")
  require(decode(qfs.read(hostState,"common.txt"))=="one" and decode(qfs.read(hostState,"loose.cfg"))=="loose","automatically mounted host search priority")
  sums = qfs.loadedPakChecksums(state); pureSums = qfs.loadedPakPureChecksums(state)
  require(len(sums)==2 and n.i32(sums[0])==n.i32(expected1) and n.i32(sums[1])==n.i32(expected0),"pak search order")
  require(n.i32(pureSums[0])==n.i32(pure1) and n.i32(pureSums[1])==n.i32(pure0),"pure checksum order")
  names = qfs.loadedPakNames(state); require(len(names)==2 and names[0]=="pak1" and names[1]=="pak0","loaded pak names")
  require(decode(qfs.read(state,"COMMON.TXT"))=="one","later pak overrides")
  require(len(qfs.referencedPakChecksums(state))==0,"txt read does not create general reference")
  qfs.read(state,"maps/b.bsp")
  refs = qfs.referencedPakChecksums(state); refNames = qfs.referencedPakNames(state)
  require(len(refs)==1 and n.i32(refs[0])==n.i32(expected1),"general read marks referenced pak")
  require(len(refNames)==1 and refNames[0]=="baseq3/pak1","referenced pak name includes game directory")
  tokens = qfs.referencedPakPureTokens(state)
  require(len(tokens)==3 and tokens[0]=="@" and n.i32(tokens[1])==n.i32(pure1) and n.i32(tokens[2])==n.i32(feed ^ pure1 ^ 1),"general pure reference proof")
  qfs.clearPakReferences(state,0); require(len(qfs.referencedPakChecksums(state))==0,"clear all pak references")
  qfs.markReference(state.paths[0].pak,"vm/cgame.qvm"); qfs.markReference(state.paths[1].pak,"vm/ui.qvm"); qfs.markReference(state.paths[1].pak,"vm/qagame.qvm")
  tokens = qfs.referencedPakPureTokens(state)
  require(len(tokens)==6 and n.i32(tokens[0])==n.i32(pure1) and n.i32(tokens[1])==n.i32(pure0) and tokens[2]=="@" and n.i32(tokens[5])==n.i32(feed ^ 4),"cgame ui general pure ordering and count proof")
  require(n.i32(qfs.qagamePakChecksum(state))==n.i32(expected0),"qagame referenced checksum")
  qfs.setPureServerReferencedPaks(state,[expected0,expected1],["baseq3/pak0","baseq3/pak1"])
  require(len(state.serverReferencedPakChecksums)==2 and state.serverReferencedPakNames[1]=="baseq3/pak1","server referenced pak negotiation state")
  require(qfs.idPak("BASEQ3\\pak8","baseq3") and not qfs.idPak("baseq3/pak9","baseq3"),"official pak autodownload exclusion")
  require(qfs.checksumHex(0x12345678)=="12345678" and qfs.checksumHex(-1)=="ffffffff","checksum collision suffix format")
  qfs.setPureServerReferencedPaks(state,[expected0,0x11111111,0x12345678],["mod/have","baseq3/pak8","mod/custom"])
  comparison = qfs.comparePaks(state,1024,true,wrongLocalFile)
  require(comparison.needed and comparison.text=="@mod/custom.pk3@mod/custom.12345678.pk3","download string and wrong-checksum local rename")
  comparison = qfs.comparePaks(state,1024,false,wrongLocalFile)
  require(comparison.text=="mod/custom.pk3 (local file exists with wrong checksum)\n","human-readable missing pak diagnostic")
  comparison = qfs.comparePaks(state,1024,true,noLocalFile)
  require(comparison.text=="@mod/custom.pk3@mod/custom.pk3","download keeps free local name")
  comparison = qfs.comparePaks(state,12,true,noLocalFile)
  require(comparison.needed and len(bytes(comparison.text))==11,"download comparison respects destination capacity")
  require(decode(qfs.read(state,"loose.cfg"))=="loose","loose directory read")
  maps = qfs.listFiles(state,"maps",".bsp")
  require(len(maps)==3 and maps[0]=="b.bsp" and maps[1]=="a.bsp" and maps[2]=="loose.bsp","ordered unique listing")
  scripts = qfs.listFiles(state,"scripts",".shader")
  require(len(scripts)==1 and scripts[0]=="common.shader","case-insensitive listing uniqueness")
  qfs.setPureServerPaks(state,[expected0])
  require(decode(qfs.read(state,"common.txt"))=="zero","pure pak filtering")
  maps = qfs.listFiles(state,"maps",".bsp")
  require(len(maps)==1 and maps[0]=="a.bsp","pure listing filters pak and directory")
  print "PASS: "+str(checksumCases)+" direct-C checksum cases / 2 values each / 25 filesystem contracts"
  return 0
end function
