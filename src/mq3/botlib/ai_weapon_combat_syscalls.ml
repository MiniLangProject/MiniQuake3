// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BotChooseBestFightWeapon and BotGetWeaponInfo.
package mq3.botlib.ai_weapon_combat_syscalls

import mq3.botlib.ai_weapon_combat as aiWeaponCombat
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const INVENTORY_COUNT=256

/// Apply `mq3.vm.syscall_common.pointer` while evaluating `readInventory`.
/// @param vm Vm record; accesses `data`.
/// @param address Address within the VM memory or native data buffer.
function readInventory(vm,address)
  at=common.pointer(vm,address,INVENTORY_COUNT*4,"weapon inventory input");if at is error then return at end if
  result=array(INVENTORY_COUNT,0);for index=0 to INVENTORY_COUNT-1 result[index]=n.readI32(vm.data,at+index*4) end for;return result
end function

/// Apply `mq3.botlib.ai_weapon_combat_syscalls.readInventory`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_weapon_combat.chooseBestFightWeapon` while evaluating `dispatch`.
/// @param runtime AI weapon combat runtime; accesses `config`.
/// @param pools Bot resource pools; accesses `weaponStates`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
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
