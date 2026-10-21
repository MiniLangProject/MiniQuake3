import mq3.client.cgame_playerstate as subject
import mq3.game.playerstate as playerstate
import mq3.compat.numeric as n
function damageRow(name,state) print(name+"|"+str(n.floatBits(state.damageX))+"|"+str(n.floatBits(state.damageY))+"|"+str(n.floatBits(state.vDmgRoll))+"|"+str(n.floatBits(state.vDmgPitch))+"|"+str(n.floatBits(state.damageValue))+"|"+str(state.vDmgTime)+"|"+str(state.damageTime)+"|"+str(state.attackerTime));return void end function
function main(args)
 state=subject.create();p=playerstate.create();p.stats[subject.STAT_WEAPONS]=1<<subject.WP_MACHINEGUN;p.ammo[subject.WP_MACHINEGUN]=25;subject.checkAmmo(state,p);print("ammo-high|"+str(state.lowAmmoWarning)+"|"+str(len(state.actions)))
 p.ammo[subject.WP_MACHINEGUN]=4;subject.checkAmmo(state,p);print("ammo-low|"+str(state.lowAmmoWarning)+"|"+str(len(state.actions)))
 p.ammo[subject.WP_MACHINEGUN]=0;subject.checkAmmo(state,p);print("ammo-none|"+str(state.lowAmmoWarning)+"|"+str(len(state.actions)));subject.checkAmmo(state,p);print("ammo-repeat|"+str(state.lowAmmoWarning)+"|"+str(len(state.actions)))
 state.time=1000;state.serverTime=990;p.stats[subject.STAT_HEALTH]=100;subject.damageFeedback(state,p,255,255,3);damageRow("damage-center",state)
 state.time=2000;state.serverTime=1980;p.stats[subject.STAT_HEALTH]=20;subject.damageFeedback(state,p,64,0,20);damageRow("damage-side",state)
 p.weapon=7;subject.respawn(state,p);print("respawn|1|"+str(state.weaponSelectTime)+"|"+str(state.weaponSelect));return 0
end function
