import mq3.client.playable_weapon_inventory as inventory

function require(ok,label) if not ok then return error(7581,"Weapon-inventory contract: "+label) end if;return 1 end function

function main(args)
  count=0;defs=inventory.definitions()
  count=count+require(len(defs)==8,"eight playable weapon definitions")
  count=count+require(defs[0].id==2 and defs[0].weaponQuantity==40 and defs[0].ammoQuantity==50,"machinegun bg_itemlist quantities")
  count=count+require(defs[1].id==3 and defs[1].weaponQuantity==10 and defs[1].ammoQuantity==10,"shotgun bg_itemlist quantities")
  count=count+require(defs[2].id==4 and defs[2].weaponQuantity==10 and defs[2].ammoQuantity==5,"grenade bg_itemlist quantities")
  count=count+require(defs[3].id==5 and defs[3].weaponQuantity==10 and defs[3].ammoQuantity==5,"rocket bg_itemlist quantities")
  count=count+require(defs[4].id==6 and defs[4].weaponQuantity==100 and defs[4].ammoQuantity==60,"lightning bg_itemlist quantities")
  count=count+require(defs[5].id==7 and defs[5].weaponQuantity==10 and defs[5].ammoQuantity==10,"rail bg_itemlist quantities")
  count=count+require(defs[6].id==8 and defs[6].weaponQuantity==50 and defs[6].ammoQuantity==30,"plasma bg_itemlist quantities")
  count=count+require(defs[7].id==9 and defs[7].weaponQuantity==20 and defs[7].ammoQuantity==15,"BFG bg_itemlist quantities")
  count=count+require(inventory.weaponDefinition("ROCKETLAUNCHER").id==5 and inventory.weaponDefinition("weapon_plasmagun").id==8,"weapon aliases")
  count=count+require(inventory.weaponDefinition("GAUNTLET").id==1 and inventory.weaponDefinition(1).classname=="weapon_gauntlet","gauntlet definition")
  count=count+require(inventory.ammoDefinition("AMMO_SLUGS").id==7 and inventory.ammoDefinition("ammo_unknown")==void,"ammo classname mapping")

  state=inventory.create(false)
  count=count+require(state.ownedBits==((1<<1)|(1<<2)) and inventory.owns(state,1) and inventory.owns(state,2),"FFA base ownership bits")
  count=count+require(state.ammo[1]==-1 and state.ammo[2]==100 and state.ammo[10]==-1 and state.selectedWeapon==2,"FFA spawn ammo")
  team=inventory.create(true);count=count+require(team.ammo[2]==50,"team spawn machinegun ammo")

  added=inventory.pickupWeapon(state,"weapon_rocketlauncher",0,false,false)
  count=count+require(added==10 and inventory.owns(state,5) and state.ammo[5]==10,"first respawning weapon pickup")
  count=count+require(inventory.pickupWeapon(state,"rocket",0,false,false)==1 and state.ammo[5]==11,"owned respawning weapon adds one")
  state.ammo[8]=12;count=count+require(inventory.pickupWeapon(state,"plasma",0,false,false)==38 and state.ammo[8]==50,"respawning weapon reaches nominal ammo")
  count=count+require(inventory.pickupWeapon(state,"rail",0,true,false)==10 and state.ammo[7]==10,"dropped weapon grants full quantity")
  count=count+require(inventory.pickupWeapon(state,"lightning",0,false,true)==100 and state.ammo[6]==100,"team weapon grants full quantity")
  count=count+require(inventory.pickupWeapon(state,"bfg",-1,false,false)==0 and inventory.owns(state,9) and state.ammo[9]==0,"negative count grants weapon without ammo")
  count=count+require(inventory.pickupWeapon(state,"grenade",7,false,false)==7 and state.ammo[4]==7,"weapon count override")
  count=count+require(inventory.pickupWeapon(state,"grenade",12,false,false)==5 and state.ammo[4]==12,"count override still uses respawning rule")

  count=count+require(inventory.pickupAmmo(state,"ammo_rockets",0)==5 and state.ammo[5]==16,"rocket ammo mapping")
  count=count+require(inventory.pickupAmmo(state,"ammo_cells",17)==17 and state.ammo[8]==67,"ammo count override")
  state.ammo[2]=190;inventory.pickupAmmo(state,"ammo_bullets",0);count=count+require(state.ammo[2]==200,"ammo clamps at Baseq3 maximum")
  count=count+require(inventory.addAmmo(state,1,99)==-1,"unlimited ammo remains unlimited")

  count=count+require(inventory.consume(state,5,3) and state.ammo[5]==13,"shot consumes selected ammo pool")
  count=count+require(not inventory.consume(state,5,99) and state.ammo[5]==13,"insufficient ammo is atomic")
  count=count+require(inventory.consume(state,1,1) and state.ammo[1]==-1,"unlimited gauntlet consumption")
  count=count+require(not inventory.consume(state,3,1),"unowned weapon cannot consume")

  state.selectedWeapon=2;state.ammo[4]=0;state.ammo[5]=13;state.ammo[6]=0;state.ammo[7]=10;state.ammo[8]=0
  count=count+require(inventory.nextWeapon(state)==5,"next skips unowned and empty weapons")
  count=count+require(inventory.nextWeapon(state)==7,"next continues in Baseq3 id order")
  count=count+require(inventory.nextWeapon(state)==2,"next wraps and never cycles to gauntlet")
  count=count+require(inventory.previousWeapon(state)==7,"previous wraps backwards")
  count=count+require(inventory.select(state,9) and state.selectedWeapon==9,"direct selection allows owned empty weapon")
  count=count+require(not inventory.select(state,3) and state.selectedWeapon==9,"direct selection rejects unowned weapon")
  count=count+require(inventory.selectDigit(state,1) and state.selectedWeapon==1,"digit one directly selects owned gauntlet")
  count=count+require(not inventory.selectDigit(state,3) and state.selectedWeapon==1,"digit selection rejects unowned weapon")
  count=count+require(not inventory.selectDigit(state,0) and not inventory.selectDigit(state,10),"digit selection accepts Baseq3 weapon range only")
  state.selectedWeapon=9
  count=count+require(inventory.outOfAmmoChange(state)==7,"out-of-ammo chooses highest usable id")
  state.ammo[7]=0;state.ammo[5]=0;state.ammo[2]=0;count=count+require(inventory.outOfAmmoChange(state)==1,"gauntlet is out-of-ammo fallback")

  ammoRef=state.ammo;bitsBefore=state.ownedBits;inventory.respawn(state,true)
  count=count+require(state.ammo==ammoRef and state.spawnCount==1,"respawn preserves state and ammo-array identity")
  count=count+require(state.ownedBits!=bitsBefore and state.ownedBits==((1<<1)|(1<<2)) and state.ammo[2]==50 and state.selectedWeapon==2,"respawn resets transient loadout")
  count=count+require(try(inventory.pickupWeapon(state,"unknown",0,false,false)) is error and try(inventory.pickupAmmo(state,"unknown",0)) is error,"unknown pickups rejected")
  count=count+require(try(inventory.cycle(state,0)) is error and try(inventory.respawn(void,false)) is error,"invalid state transitions rejected")
  print("PASS: "+str(count)+" playable weapon-inventory contracts");return 0
end function
