// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.format.pk3 as pk3
import mq3.shared.q_shared_runtime as q
function require(ok,text) if not ok then return error(7681,text) end if;return 1 end function
function containsInfo(values,key,wanted) for each value in values if q.info_ValueForKey(value,key)==wanted then return true end if end for;return false end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]+"/baseq3/pak0.pk3");checks=0
  arenasText=decode(pk3.read(archive,"scripts/arenas.txt"));botsText=decode(pk3.read(archive,"scripts/bots.txt"))
  checks=checks+require(len(arenasText)>3000 and len(botsText)>2000,"retail metadata payloads")
  arenas=q.com_ParseInfos(arenasText,128);bots=q.com_ParseInfos(botsText,128)
  checks=checks+require(len(arenas)==30 and len(bots)==32,"retail info counts")
  checks=checks+require(q.info_ValueForKey(arenas[0],"map")=="q3dm1" and q.info_ValueForKey(arenas[0],"longname")=="Arena Gate","first retail arena")
  checks=checks+require(containsInfo(arenas,"map","q3ctf4") and containsInfo(arenas,"longname","The Longest Yard"),"arena coverage")
  checks=checks+require(q.info_ValueForKey(bots[0],"name")=="Xaero" and q.info_ValueForKey(bots[0],"aifile")=="bots/xaero_c.c","first retail bot")
  checks=checks+require(containsInfo(bots,"name","Sarge") and containsInfo(bots,"model","visor"),"bot coverage")
  checks=checks+require(q.info_Validate(arenas[0]) and q.info_Validate(bots[0]),"retail info validation")
  compact=q.com_Compress(arenasText);checks=checks+require(len(compact)<len(arenasText) and len(q.com_ParseInfos(compact,128))==30,"retail compression round trip")
  print("PASS: "+str(checks)+" retail q_shared.c probes arenas="+str(len(arenas))+" bots="+str(len(bots)));return 0
end function
