// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.game_headers as h
function req(value,label) if not value then return error(499,"game header contract: "+label) end if;return 1 end function
function main(args)
 count=0
 count=count+req(h.headerCounts()==[44,115,49,11,94,19],"header macro counts")
 count=count+req(h.CONTENTS_SOLID==1 and h.CONTENTS_NODROP==-2147483648 and h.SURF_DUST==0x40000,"surface flags")
 count=count+req(h.INVENTORY_GAUNTLET==4 and h.INVENTORY_BLUECUBE==49 and h.WEAPONINDEX_CHAINGUN==13,"inventory ABI")
 count=count+req(h.CHARACTERISTIC_ATTACK_SKILL==2 and h.CHARACTERISTIC_VIEW_FACTOR==4 and h.CHARACTERISTIC_VIEW_MAXCHANGE==5,"aim ABI")
 count=count+req(h.CHARACTERISTIC_CROUCHER==36 and h.CHARACTERISTIC_JUMPER==37 and h.CHARACTERISTIC_WEAPONJUMPING==38,"movement characteristics")
 count=count+req(h.CHARACTERISTIC_WALKER==48 and len(h.characteristicValues())==49,"characteristic extent")
 count=count+req(h.CONTEXT_ALL==-1 and h.CONTEXT_REPLY==16 and h.CONTEXT_NAMES==1024,"synonym contexts")
 count=count+req(h.MTCONTEXT_MISC==2 and h.MSG_SUICIDE==33 and h.MSG_CTF==300,"match messages")
 count=count+req(h.ST_1FCTFGOTFLAG==65535 and h.NETNAME==0 and h.MORE==6 and h.EC_CODE==25,"match tokens")
 count=count+req(h.CTF_CAPTURE_BONUS==5 and h.CTF_TEAM_BONUS==0 and h.CTF_GRAPPLE_SPEED==750,"baseq3 team ABI")
 count=count+req(len(h.surfaceValues())+len(h.inventoryValues())+len(h.characteristicValues())+len(h.synonymContextValues())+len(h.matchValues())+len(h.teamValues())==332,"complete value surface")
 print("PASS: "+str(count)+" game header contracts\n");return 0
end function
