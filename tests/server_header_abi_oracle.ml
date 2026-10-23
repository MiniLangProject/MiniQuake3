// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.abi as abi

function emitLayout(value)
  print("size|"+value.name+"|"+str(value.size))
  if len(value.fields)>0 then for index=0 to len(value.fields)-1 print("off|"+value.name+"|"+value.fields[index]+"|"+str(value.offsets[index])) end for end if
  if len(value.arrayFields)>0 then for index=0 to len(value.arrayFields)-1 print("count|"+value.name+"|"+value.arrayFields[index]+"|"+str(value.arrayCounts[index])) end for end if
  return void
end function
function main(args)
  print("const|PERS_SCORE|"+str(abi.PERS_SCORE))
  print("const|MAX_ENT_CLUSTERS|"+str(abi.MAX_ENT_CLUSTERS))
  print("const|MAX_CHALLENGES|"+str(abi.MAX_CHALLENGES))
  print("const|AUTHORIZE_TIMEOUT|"+str(abi.AUTHORIZE_TIMEOUT))
  print("const|MAX_MASTERS|"+str(abi.MAX_MASTERS))
  print("const|MAX_MASTER_SERVERS|"+str(abi.MAX_MASTER_SERVERS))
  print("serverState|"+str(abi.SS_DEAD)+"|"+str(abi.SS_LOADING)+"|"+str(abi.SS_GAME))
  print("clientState|"+str(abi.CS_FREE)+"|"+str(abi.CS_ZOMBIE)+"|"+str(abi.CS_CONNECTED)+"|"+str(abi.CS_PRIMED)+"|"+str(abi.CS_ACTIVE))
  for each value in abi.layouts() emitLayout(value) end for
  return 0
end function
