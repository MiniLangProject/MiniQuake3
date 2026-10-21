import mq3.client.cgame_ents as subject
import mq3.game.constants as c
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.renderer.model_tags as tags

function req(value,message) if not value then return error(7755,message) end if;return 1 end function
function es(number,type) value=entitystate.create();value.number=number;value.eType=type;value.pos.trBase=[number*1.0,2.0,3.0];return value end function
function snap(time,client,entities) ps=playerstate.create();ps.clientNum=client;return subject.Snapshot(time,ps,entities) end function
function tagModel()
 a=tags.tag("tag_test",[1.0,2.0,3.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
 b=tags.tag("tag_test",[3.0,4.0,5.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
 return tags.model(void,tags.md3([[a],[b]],[-1.0,-1.0,-1.0],[1.0,1.0,1.0]))
end function
function main(args)
 count=0;state=subject.create(1024)
 parent=subject.renderEntity();parent.origin=[10.0,20.0,30.0];parent.oldframe=0;parent.frame=1;parent.backlerp=0.5
 child=subject.renderEntity();placed=subject.positionEntityOnTag(child,parent,tagModel(),"tag_test");count=count+req(placed.origin==[12.0,23.0,34.0] and placed.backlerp==0.5,"position tag")
 rotated=subject.renderEntity();rotated.axis=[[0.0,-1.0,0.0],[1.0,0.0,0.0],[0.0,0.0,1.0]];subject.positionRotatedEntityOnTag(rotated,parent,tagModel(),"tag_test");count=count+req(rotated.origin==[12.0,23.0,34.0] and rotated.axis[0]==[0.0,-1.0,0.0],"rotated tag")
 basic=es(4,c.ET_GENERAL);value=subject.cent(basic);value.lerpOrigin=[5.0,6.0,7.0];state.inlineMidpoints=array(3,[0.0,0.0,0.0]);state.inlineMidpoints[2]=[2.0,3.0,4.0];basic.solid=subject.SOLID_BMODEL;basic.modelindex=2;origin=subject.setEntitySoundPosition(state,value,false);count=count+req(origin==[7.0,9.0,11.0] and state.soundPositions[0].dispatched==false,"bmodel sound midpoint")
 subject.clearBoundaries(state);basic.solid=0;basic.loopSound=9;basic.constantLight=0x20403020;subject.entityEffects(state,value,false);count=count+req(len(state.audio)==1 and state.audio[0].kind=="loop" and len(state.scene)==1 and state.scene[0].render.radius==128.0,"continuous effects")
 subject.clearBoundaries(state);state.localClient=4;basic.modelindex=7;basic.frame=3;general=subject.general(state,value,false);count=count+req(general.render.model==7 and general.render.frame==3 and (general.render.renderfx&subject.RF_THIRD_PERSON)!=0,"general entity")
 subject.clearBoundaries(state);speakerState=es(5,c.ET_SPEAKER);speakerState.clientNum=2;speakerState.eventParm=11;speakerState.frame=4;speaker=subject.cent(speakerState);state.time=1000;subject.speaker(state,speaker,false);firstTime=speaker.miscTime;subject.speaker(state,speaker,false);count=count+req(len(state.audio)==1 and firstTime>1000,"speaker schedule")
 subject.clearBoundaries(state);itemState=es(6,c.ET_ITEM);itemState.modelindex=8;pickup=subject.cent(itemState);state.simpleItems=true;simple=subject.item(state,pickup,false);count=count+req(simple.render.reType==subject.RT_SPRITE and simple.render.radius==14.0,"simple item")
 subject.clearBoundaries(state);state.simpleItems=false;state.time=500;pickup.miscTime=0;itemState.modelindex=8;itemState.modelindex2=12;state.weaponMidpoints=array(12,[0.0,0.0,0.0]);state.weaponMidpoints[1]=[1.0,2.0,3.0];full=subject.item(state,pickup,false);count=count+req(state.scene[0].kind=="item" and full.nonNormalized and (full.renderfx&subject.RF_MINLIGHT)!=0,"weapon item model")
 subject.clearBoundaries(state);healthState=es(7,c.ET_ITEM);healthState.modelindex=4;healthState.modelindex2=99;health=subject.cent(healthState);state.time=1200;subject.item(state,health,false);count=count+req(len(state.scene)==2 and state.scene[1].kind=="item-ring","item ring")
 count=count+req(subject.item(state,subject.cent(es(8,c.ET_ITEM)),false)==void,"invisible item zero")
 subject.clearBoundaries(state);missileState=es(9,c.ET_MISSILE);missileState.weapon=subject.WP_PLASMAGUN;missileState.pos.trDelta=[100.0,0.0,0.0];projectile=subject.cent(missileState);state.missileLights[subject.WP_PLASMAGUN]=200.0;state.missileSounds[subject.WP_PLASMAGUN]=17;plasma=subject.missile(state,projectile,false);count=count+req(plasma.reType==subject.RT_SPRITE and len(state.audio)==1 and len(state.scene)==3,"plasma effects")
 subject.clearBoundaries(state);missileState.weapon=5;rocket=subject.missile(state,projectile,false);count=count+req(rocket.axis[0]==[1.0,0.0,0.0] and rocket.renderfx==subject.RF_NOSHADOW,"missile orientation")
 subject.clearBoundaries(state);grappleState=es(10,c.ET_GRAPPLE);grappleState.weapon=10;grappleState.pos.trDelta=[0.0,0.0,0.0];hook=subject.grapple(state,subject.cent(grappleState),false);count=count+req(len(state.scene)==2 and hook.axis[0]==[0.0,0.0,1.0],"grapple trail and model")
 subject.clearBoundaries(state);moverState=es(11,c.ET_MOVER);moverState.modelindex=3;moverState.modelindex2=4;moving=subject.cent(moverState);moving.lerpOrigin=[1.0,2.0,3.0];subject.mover(state,moving,false);count=count+req(len(state.scene)==2 and state.scene[1].kind=="mover-secondary","mover models")
 subject.clearBoundaries(state);beamState=es(12,c.ET_BEAM);beamState.pos.trBase=[9.0,8.0,7.0];beamState.origin2=[1.0,2.0,3.0];line=subject.beam(state,subject.cent(beamState),false);count=count+req(line.reType==subject.RT_BEAM and line.origin==[9.0,8.0,7.0] and line.oldorigin==[1.0,2.0,3.0],"beam endpoints")
 subject.clearBoundaries(state);portalState=es(13,c.ET_PORTAL);portalState.eventParm=5;portalState.powerups=7;portalState.frame=8;portalState.clientNum=128;portalValue=subject.cent(portalState);portalValue.lerpOrigin=[4.0,5.0,6.0];surface=subject.portal(state,portalValue,false);count=count+req(surface.reType==subject.RT_PORTALSURFACE and surface.oldframe==7 and surface.frame==8 and surface.skin==180.0,"portal surface")
 moverState.number=20;moverState.pos.trType=c.TR_LINEAR;moverState.pos.trBase=[10.0,20.0,30.0];moverState.pos.trDelta=[10.0,-20.0,30.0];adjusted=subject.adjustPositionForMover([1.0,2.0,3.0],subject.cent(moverState),1000,1250);count=count+req(adjusted==[3.5,-3.0,10.5],"mover translation")
 count=count+req(subject.adjustPositionForMover([1.0,2.0,3.0],void,1000,1250)==[1.0,2.0,3.0],"invalid mover copy")
 current=es(21,c.ET_PLAYER);current.pos.trBase=[0.0,10.0,20.0];current.apos.trBase=[350.0,10.0,20.0];next=entitystate.copy(current);next.pos.trBase=[10.0,30.0,50.0];next.apos.trBase=[10.0,30.0,40.0];interpolated=subject.cent(current);interpolated.nextState=next;subject.interpolateEntityPosition(interpolated,1000,1100,0.5);count=count+req(interpolated.lerpOrigin==[5.0,20.0,35.0] and interpolated.lerpAngles==[360.0,20.0,30.0],"entity interpolation")
 state.snap=snap(1000,0,[]);state.nextSnap=snap(1100,0,[]);state.frameInterpolation=0.25;interpolated.interpolate=true;current.pos.trType=c.TR_INTERPOLATE;subject.calcEntityLerpPositions(state,interpolated,false);count=count+req(interpolated.lerpOrigin==[2.5,15.0,27.5],"calc interpolation")
 state.entities[20]=subject.cent(moverState);riderState=es(22,c.ET_GENERAL);riderState.groundEntityNum=20;riderState.pos.trBase=[1.0,2.0,3.0];rider=subject.cent(riderState);state.time=1250;subject.calcEntityLerpPositions(state,rider,false);count=count+req(rider.lerpOrigin==[3.5,-3.0,10.5],"rider mover adjustment")
 subject.clearBoundaries(state);state.gametype=subject.GT_CTF;baseState=es(23,c.ET_TEAM);baseState.modelindex=subject.TEAM_RED;subject.teamBase(state,subject.cent(baseState),false);count=count+req(state.scene[0].kind=="team-base-red","ctf base")
 subject.clearBoundaries(state);playerState=es(24,c.ET_PLAYER);state.snap=snap(1000,0,[playerState]);state.time=1000;subject.addCEntity(state,subject.cent(playerState),false,true);count=count+req(state.scene[0].kind=="player" and not state.scene[0].dispatched,"player boundary suppression")
 hidden=es(25,c.ET_INVISIBLE);before=len(state.scene);subject.addCEntity(state,subject.cent(hidden),false,true);count=count+req(len(state.scene)==before,"hidden entity")
 eventOnly=es(26,c.ET_EVENTS+1);before=len(state.actions);subject.addCEntity(state,subject.cent(eventOnly),false,true);count=count+req(len(state.actions)==before,"event-only entity")
 subject.clearBoundaries(state);packetGeneral=es(27,c.ET_GENERAL);packetGeneral.modelindex=2;packetGeneral.pos.trType=c.TR_INTERPOLATE;packetGeneral.pos.trBase=[0.0,2.0,3.0];first=snap(1000,0,[packetGeneral]);laterState=entitystate.copy(packetGeneral);laterState.pos.trBase=[10.0,2.0,3.0];later=snap(1100,0,[laterState]);state.time=1050;observed=subject.addPacketEntities(state,first,later,void,true);count=count+req(observed>0 and state.entities[27].lerpOrigin==[5.0,2.0,3.0] and state.dispatched==0 and state.suppressed>0,"packet observation suppression")
 subject.clearBoundaries(state);state.time=1050;subject.addPacketEntities(state,first,later,void,false);count=count+req(state.dispatched>0 and state.scene[0].dispatched,"native boundary dispatch")
 count=count+req(try(subject.ensureCent(state,es(2048,c.ET_GENERAL))) is error,"entity bounds")
 print("PASS: "+str(count)+" cgame ents contracts");return 0
end function
