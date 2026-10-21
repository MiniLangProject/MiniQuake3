// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.command_ring as oracleCommandRing

function runAdvance(state,frameTime,oldTime,current)
  values=oracleCommandRing.create();for index=0 to 63 values[index]=2000+index end for
  result=oracleCommandRing.advance(state,frameTime,oldTime,current)
  created=0
  if result.created then created=1;oracleCommandRing.store(values,result.commandNumber,1000+result.frameMsec+created) end if
  marker=values[current&63];if result.created then marker=values[result.slot] end if
  frame=-999;if result.created then frame=result.frameMsec end if
  print("advance "+str(frame)+" "+str(result.oldFrameTime)+" "+str(result.commandNumber)+" "+str(created)+" "+str(marker))
end function

function main(args)
  runAdvance(5,250,10,3)
  runAdvance(oracleCommandRing.CA_PRIMED,250,0,0)
  runAdvance(oracleCommandRing.CA_PRIMED,300,250,63)
  runAdvance(oracleCommandRing.CA_PRIMED,240,300,9)
  values=oracleCommandRing.create();for index=0 to 63 values[index]=2000+index end for
  print("current 70")
  print("get 70 1 "+str(oracleCommandRing.get(values,70,70)))
  print("get 7 1 "+str(oracleCommandRing.get(values,70,7)))
  old=oracleCommandRing.get(values,70,6);found=1;if old==void then found=0;old=-1 end if;print("get 6 "+str(found)+" "+str(old))
  future=try(oracleCommandRing.get(values,70,71));failed=0;if future is error then failed=1 end if;print("future "+str(failed))
  return 0
end function
