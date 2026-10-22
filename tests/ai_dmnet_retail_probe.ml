import mq3.format.pk3 as pk3
import mq3.game.ai_dmnet as dm
import std.string as strings

struct Bot inventory end struct
function require(value,label) if not value then return error(499,"ai_dmnet retail probe: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;checks=0
  bots=pk3.read(archive,"scripts/bots.txt");if bots is error then return bots end if;checks=checks+require(len(bots)>500,"retail bot registry")
  character=pk3.read(archive,"botfiles/bots/sarge_c.c");if character is error then return character end if;checks=checks+require(len(character)>100,"retail Sarge character")
  itemweights=pk3.read(archive,"botfiles/bots/sarge_i.c");if itemweights is error then return itemweights end if;checks=checks+require(len(itemweights)>100,"retail Sarge item weights")
  botfiles=0;for each entry in archive.entries if strings.indexOf(entry.name,"botfiles/bots/",0)==0 then botfiles=botfiles+1 end if end for;checks=checks+require(botfiles>=80,"retail bot decision resources")
  s=dm.create(void,void,void);b=Bot(array(64,0));b.inventory[dm.INVENTORY_MACHINEGUN]=1;b.inventory[dm.INVENTORY_BULLETS]=50;checks=checks+require(dm.BotSelectActivateWeapon(s,b)==dm.WEAPONINDEX_MACHINEGUN,"retail baseq3 activation weapon")
  print("PASS: "+str(checks)+" retail ai_dmnet probes botfiles="+str(botfiles)+" registry="+str(len(bots))+" sarge="+str(len(character))+"\n");return 0
end function
