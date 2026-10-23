// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then return error(7895,"usage: server_world_sectorlist_retail_probe <pak0.pk3> <qvm-dir>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  before=len(state.context.prints);executed=match.executeClientConsole(state,"sectorlist")
  if executed is error then return error(7895,"productive sectorlist command was not dispatched") end if
  if len(state.context.prints)!=before+64 then return error(7895,"productive sectorlist did not emit all 64 slots") end if
  if state.context.prints[before]!="sector 0: 0 entities\n" or state.context.prints[before+63]!="sector 63: 0 entities\n" then return error(7895,"productive sectorlist output mismatch") end if
  print("PASS: Retail q3dm1 sectorlist emitted 64 live world-sector diagnostics")
  match.shutdown(state);return 0
end function
