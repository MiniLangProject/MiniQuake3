// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.game_headers as h
function emit(values)
  output="";for index=0 to len(values)-1 if index>0 then output=output+"," end if;output=output+str(values[index]) end for;print(output);return void
end function
function main(args)
  emit(h.surfaceValues())
  emit(h.inventoryValues())
  emit(h.characteristicValues())
  emit(h.synonymContextValues())
  emit(h.matchValues())
  emit(h.teamValues())
  print("ec="+str(h.EC_CODE))
  return 0
end function
