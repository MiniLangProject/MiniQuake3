import mq3.client.cgame_ents as subject
import mq3.compat.numeric as n
import mq3.game.constants as c
import mq3.game.entitystate as entitystate
import mq3.renderer.model_tags as tags
function hex32(value) digits="0123456789abcdef";text="";for i=0 to 7 text=digits[(value>>(i*4))&15]+text end for;return text end function
function vec(name,value) print(name+"|"+hex32(n.floatBits(value[0]))+","+hex32(n.floatBits(value[1]))+","+hex32(n.floatBits(value[2])));return void end function
function model() a=tags.tag("tag_test",[1.0,2.0,3.0],subject.identityAxis());b=tags.tag("tag_test",[3.0,4.0,5.0],subject.identityAxis());return tags.model(void,tags.md3([[a],[b]],[-1.0,-1.0,-1.0],[1.0,1.0,1.0])) end function
function main(args)
 parent=subject.renderEntity();parent.origin=[10.0,20.0,30.0];parent.oldframe=0;parent.frame=1;parent.backlerp=0.5;child=subject.renderEntity();subject.positionEntityOnTag(child,parent,model(),"tag_test");vec("tag-origin",child.origin);vec("tag-axis0",child.axis[0]);print("tag-back|"+hex32(n.floatBits(child.backlerp)))
 child=subject.renderEntity();child.axis=[[0.0,-1.0,0.0],[1.0,0.0,0.0],[0.0,0.0,1.0]];subject.positionRotatedEntityOnTag(child,parent,model(),"tag_test");vec("rot-origin",child.origin);vec("rot-axis0",child.axis[0])
 input=[1.0,2.0,3.0];vec("adjust-none",subject.adjustPositionForMover(input,void,1000,1250));source=entitystate.create();source.number=20;source.eType=c.ET_MOVER;source.pos.trType=c.TR_LINEAR;source.pos.trTime=1000;source.pos.trBase=[10.0,20.0,30.0];source.pos.trDelta=[10.0,-20.0,30.0];vec("adjust-mover",subject.adjustPositionForMover(input,subject.cent(source),1000,1250))
 current=entitystate.create();current.pos.trBase=[0.0,10.0,20.0];current.apos.trBase=[350.0,10.0,20.0];next=entitystate.copy(current);next.pos.trBase=[10.0,30.0,50.0];next.apos.trBase=[10.0,30.0,40.0];value=subject.cent(current);value.nextState=next;subject.interpolateEntityPosition(value,1000,1100,0.5);vec("lerp-origin",value.lerpOrigin);vec("lerp-angles",value.lerpAngles);return 0
end function
