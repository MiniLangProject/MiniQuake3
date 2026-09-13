import mq3.client.playable_marks as marks
import mq3.client.playable_projectile_view as view
import mq3.client.playable_effects as effects

function require(ok,text) if not ok then return error(7641,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.0001 end function

function main(args)
  count=0
  count=count+require(marks.weaponProfile("weapon_machinegun")==[marks.KIND_BULLET,8.0,false],"machinegun mark profile")
  count=count+require(marks.weaponProfile("weapon_shotgun")[1]==4.0 and marks.weaponProfile("weapon_lightning")[1]==12.0,"shotgun and lightning radii")
  count=count+require(marks.weaponProfile("weapon_railgun")==[marks.KIND_ENERGY,24.0,true],"rail energy mark profile")
  count=count+require(marks.projectileProfile(view.STYLE_ROCKET)==[marks.KIND_BURN,64.0,false] and marks.projectileProfile(view.STYLE_GRENADE)[1]==64.0,"explosive burn profiles")
  count=count+require(marks.projectileProfile(view.STYLE_PLASMA)==[marks.KIND_ENERGY,16.0,true] and marks.projectileProfile(view.STYLE_BFG)[1]==32.0,"plasma and BFG profiles")
  state=marks.create();impact=view.defaultImpact(7,view.STYLE_ROCKET,[10.0,20.0,30.0],[0.0,0.0,1.0],1000)
  count=count+require(marks.update(state,[impact],[],1000)==1 and state.marks[0].radius==64.0,"projectile impact creates persistent mark")
  count=count+require(marks.update(state,[impact],[],1100)==1,"repeated snapshot is deduplicated")
  shot=effects.weaponShot(19,"weapon_machinegun",[0.0,0.0,0.0],[1.0,2.0,3.0],[0.0,1.0,0.0],true,1200)
  count=count+require(marks.update(state,[],[shot],1200)==2 and state.marks[1].kind==marks.KIND_BULLET,"world hitscan creates weapon mark")
  targetShot=effects.weaponShot(20,"weapon_machinegun",[0.0,0.0,0.0],[1.0,2.0,3.0],[0.0,0.0,0.0],false,1200)
  count=count+require(marks.update(state,[],[targetShot],1200)==2,"target hit does not mark world")
  axes=marks.axes(state.marks[0]);count=count+require(near(axes[0][2],0.0) and near(axes[1][2],0.0) and near(axes[0][0]*axes[1][0]+axes[0][1]*axes[1][1],0.0),"mark axes lie on impact plane")
  count=count+require(marks.color(state.marks[0],9999)==[255,255,255,255] and marks.color(state.marks[0],10500)==[127,127,127,255],"burn mark fades RGB in last second")
  energy=marks.Mark(1,marks.KIND_ENERGY,[0.0,0.0,0.0],[0.0,0.0,1.0],16.0,0.0,0,true)
  count=count+require(marks.color(energy,2000)==[150,150,150,255] and marks.color(energy,9500)==[0,0,0,127],"energy mark uses Baseq3 color and alpha fades")
  count=count+require(marks.update(state,[],[],11201)==0,"marks expire after ten seconds")
  print("PASS: "+str(count)+" playable mark contracts");return 0
end function
