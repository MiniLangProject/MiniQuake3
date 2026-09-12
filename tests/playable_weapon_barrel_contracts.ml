import mq3.client.playable_weapon_barrel as barrel
import mq3.client.playable_item_models as items
import mq3.format.md3 as md3

function require(ok,label) if not ok then return error(7631,"Weapon-barrel contract: "+label) end if;return 1 end function
function near(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function

function main(args)
  count=0;defs=barrel.definitions()
  count=count+require(len(defs)==3,"three retail barrel models")
  count=count+require(barrel.definition("WEAPON_MACHINEGUN").barrelClass=="barrel_machinegun" and barrel.definition("weapon_railgun")==void,"barrel lookup")
  count=count+require(barrel.classnames()==["barrel_gauntlet","barrel_machinegun","barrel_bfg"],"catalog classnames")
  state=barrel.state();count=count+require(near(barrel.advance(state,100,false),90.0,0.001),"zero-initialized coast phase")
  angle=barrel.advance(state,200,true);count=count+require(near(angle,170.0,0.001) and state.spinning,"coast transitions to firing")
  angle=barrel.advance(state,300,true);count=count+require(near(angle,259.996,0.01),"full-speed firing")
  angle=barrel.advance(state,300,false);count=count+require(not state.spinning and near(state.angle,259.996,0.01),"firing transitions to coast")
  angle=barrel.advance(state,1300,false);count=count+require(near(angle,709.996,0.02),"coast clamps at one second")
  count=count+require(near(barrel.angleMod(360.0),0.0,0.0) and barrel.angleMod(-1.0)>358.9,"16-bit angle wrap")
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  parent=items.transform([10.0,20.0,30.0],identity,1.0);tag=md3.Tag("tag_barrel",[2.0,3.0,4.0],identity)
  placed=barrel.rotatedTransform(parent,tag,90.0)
  count=count+require(placed.origin==[12.0,23.0,34.0],"barrel tag origin")
  count=count+require(near(placed.axis[0][0],1.0,0.001) and near(placed.axis[1][2],1.0,0.001) and near(placed.axis[2][1],-1.0,0.001),"local roll precedes tag and parent axes")
  count=count+require(try(barrel.advance(state,299,false)) is error,"backwards time rejected")
  count=count+require(try(barrel.render(void,"weapon_machinegun",parent,0.0,-1)) is error,"negative budget rejected")
  print("PASS: "+str(count)+" playable weapon-barrel contracts");return 0
end function
