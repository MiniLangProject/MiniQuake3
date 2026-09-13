import mq3.client.playable_muzzle_flash as flash
import mq3.client.playable_item_models as items
import mq3.format.md3 as md3
import std.string as strings

function require(ok,label) if not ok then return error(7611,"Muzzle-flash contract: "+label) end if;return 1 end function

function main(args)
  count=0;defs=flash.definitions()
  count=count+require(flash.MUZZLE_FLASH_TIME==20,"Baseq3 impulse duration")
  count=count+require(len(defs)==9,"nine Baseq3 weapon flashes")
  for each def in defs
    count=count+require(strings.startsWith(def.modelPath,"models/weapons2/") and strings.endsWith(def.modelPath,"_flash.md3"),def.weaponClass+" retail path present")
  end for
  count=count+require(flash.definition("WEAPON_ROCKETLAUNCHER").flashClass=="flash_rocketlauncher" and flash.definition("unknown")==void,"definition lookup")
  names=flash.classnames();count=count+require(len(names)==9 and names[0]=="flash_gauntlet" and names[8]=="flash_bfg","catalog classnames")
  machine=flash.definition("weapon_machinegun")
  count=count+require(flash.visible(machine,100,100,false),"impulse visible at event")
  count=count+require(flash.visible(machine,100,120,false),"impulse visible at inclusive limit")
  count=count+require(not flash.visible(machine,100,121,false),"impulse expires after 20 ms")
  count=count+require(not flash.visible(machine,100,99,false),"future event hidden")
  gauntlet=flash.definition("weapon_gauntlet")
  count=count+require(flash.visible(gauntlet,0,900,true),"gauntlet continuous while firing")
  count=count+require(not flash.visible(gauntlet,0,900,false),"gauntlet stops with firing flag")
  count=count+require(flash.definition("weapon_lightning").continuous and not machine.continuous,"continuous families match cgame")
  count=count+require(flash.lightColor(flash.definition("weapon_plasmagun"))==[0.6,0.6,1.0] and flash.lightColor(flash.definition("weapon_rocketlauncher"))==[1.0,0.75,0.0],"exact Baseq3 flash dlight colors")
  count=count+require(flash.lightRadius(0)>=300 and flash.lightRadius(0)<=331 and flash.lightRadius(1)>=300 and flash.lightRadius(1)<=331,"muzzle dlight keeps Baseq3 random radius range")
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  rotated=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
  product=flash.multiplyAxis(rotated,identity);count=count+require(product==rotated,"axis multiply identity")
  parent=items.transform([10.0,20.0,30.0],rotated,2.0)
  tag=md3.Tag("tag_flash",[3.0,4.0,5.0],identity)
  placed=flash.attachTransform(parent,tag)
  count=count+require(placed.origin==[2.0,26.0,40.0],"scaled rotated tag origin")
  count=count+require(placed.axis==rotated and placed.scale==2.0,"tag axis and view scale")
  count=count+require(try(flash.attachTransform(void,tag)) is error,"missing parent rejected")
  count=count+require(try(flash.render(void,"weapon_machinegun",parent,0,0,false,-1)) is error,"negative render budget rejected")
  unknown=flash.render(void,"unknown",parent,0,0,false,10);count=count+require(len(unknown.triangles)==0,"unknown weapon has no flash")
  absent=flash.render(void,"weapon_rocketlauncher",parent,0,10,false,10);count=count+require(len(absent.triangles)==0 and absent.red==255 and absent.green==191,"missing catalog is graceful and colored")
  count=count+require(flash.dynamicLight(void,"weapon_machinegun",parent,0,0,false)==void,"missing retail catalog suppresses muzzle dlight")
  print("PASS: "+str(count)+" playable muzzle-flash contracts");return 0
end function
