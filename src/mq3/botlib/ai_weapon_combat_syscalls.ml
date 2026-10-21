// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BotChooseBestFightWeapon and BotGetWeaponInfo.
package mq3.botlib.ai_weapon_combat_syscalls

import mq3.botlib.ai_weapon_combat as aiWeaponCombat
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const INVENTORY_COUNT=256

function readInventory(vm,address)
  at=common.pointer(vm,address,INVENTORY_COUNT*4,"weapon inventory input");if at is error then return at end if
  result=[];for index=0 to INVENTORY_COUNT-1 result=result+[n.readI32(vm.data,at+index*4)] end for;return result
end function

function dispatch(runtime,pools,vm,base,op)
  if op==aiWeaponCombat.OP_CHOOSE_BEST_FIGHT_WEAPON then
    inventory=readInventory(vm,common.argument(vm,base,2));if inventory is error then return inventory end if
    return aiWeaponCombat.chooseBestFightWeapon(runtime,pools,common.argument(vm,base,1),inventory)
  end if
  if op==aiWeaponCombat.OP_GET_WEAPON_INFO then
    info=aiWeaponCombat.weaponInfo(runtime,pools,common.argument(vm,base,1),common.argument(vm,base,2));if info==void then return 0 end if
    encoded=aiWeaponCombat.encodeWeaponInfo(info);if encoded is error then return encoded end if
    written=common.writeRaw(vm,common.argument(vm,base,3),encoded,aiWeaponCombat.WEAPON_INFO_SIZE,"weaponinfo_t output");if written is error then return written end if;return 0
  end if
  return error(7598,"unsupported AI weapon-combat trap "+str(op))
end function
