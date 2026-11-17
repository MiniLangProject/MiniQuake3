// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.gamestate as gamestate
function emitUpdate(state,index,value)
  gamestate.updateConfigString(state,index,value)
  text=str(state.dataCount)+"|"
  for slot=0 to gamestate.MAX_CONFIGSTRINGS-1 text=text+str(state.stringOffsets[slot])+"," end for
  print text+"|"+hex(slice(state.stringData,0,state.dataCount))
  return void
end function
function main(args)
  s=gamestate.create();emitUpdate(s,5,"five");emitUpdate(s,2,"two");emitUpdate(s,2,"two");emitUpdate(s,5,"")
  emitUpdate(s,1,"\\sv_serverid\\123\\sv_pure\\0");emitUpdate(s,12,"alpha beta gamma")
  s=gamestate.create();emitUpdate(s,0,decode(bytes(gamestate.MAX_GAMESTATE_CHARS-2,120)));emitUpdate(s,0,"")
  return 0
end function
