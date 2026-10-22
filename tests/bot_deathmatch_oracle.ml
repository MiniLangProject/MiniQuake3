// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_deathmatch as dm
import mq3.game.bot_combat_ai as combat
function bit(value) if value then return 1 end if;return 0 end function
function line(name,e) print(name+"|"+str(bit(dm.entityCarriesFlag(e)))+"|"+str(bit(dm.entityIsInvisible(e)))+"|"+str(bit(dm.entityIsShooting(e)))+"|"+str(bit(dm.entityIsChatting(e)))+"|"+str(bit(dm.entityHasQuad(e)))) end function
function main(args)
  e=combat.EntityInfo(1,0,0);line("empty",e);e.powerups=(1<<7)|(1<<4)|(1<<1);e.flags=0x100|0x1000;line("powered",e);e.powerups=1<<4;print("invis|"+str(bit(dm.entityIsInvisible(e))));print("find|"+str(dm.stristr("AlphaROCKETomega","rocket"))+"|"+str(bit(dm.stristr("AlphaROCKETomega","rail")>=0)));return 0
end function
