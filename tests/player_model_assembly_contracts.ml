import mq3.format.md3 as md3
import mq3.renderer.model_tags as tags
import mq3.renderer.player_model_assembly as player
import mq3.renderer.surface_md3 as mesh

function require(ok,text) if not ok then return error(7530,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.0001 end function
function vecNear(a,b) return near(a[0],b[0]) and near(a[1],b[1]) and near(a[2],b[2]) end function

function surface(name,frames)
  packed=[]
  for frame=0 to frames-1
    packed=packed+[[mesh.vertex(64,0,0,0x40),mesh.vertex(0,64,0,0x40),mesh.vertex(0,0,64,0x40)]]
  end for
  return md3.Surface(name,["models/players/unit/"+name],mesh.surface(frames,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],packed))
end function

function model(name,frames,tagFrames)
  return md3.Model(name,0,frames,0,1,0,[],tagFrames,[surface(name,frames)],[[-8.0,-8.0,-8.0],[8.0,8.0,8.0]])
end function

function main(args)
  count=0;i=player.identityAxis();turn=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
  lower=model("lower",2,[[tags.tag("tag_torso",[0.0,0.0,2.0],i)],[tags.tag("tag_torso",[2.0,0.0,2.0],i)]])
  upper=model("upper",2,[[tags.tag("tag_head",[2.0,0.0,1.0],i)],[tags.tag("tag_head",[2.0,0.0,1.0],i)]])
  head=model("head",1,[[]])
  set=player.models(lower,upper,head)
  count=count+require(set.lower==lower and set.upper==upper and set.head==head,"model set preserves pieces")
  root=player.transform([10.0,20.0,30.0],turn)
  lowerAnim=player.animation(1,0,0.5);upperAnim=player.animation(1,0,0.25);headAnim=player.animation(0,0,0.0)
  assembled=player.assemble(set,lowerAnim,upperAnim,headAnim,root)
  count=count+require(assembled.lower.name=="lower" and assembled.lower.kind==player.LOWER_PART,"lower part identity")
  count=count+require(assembled.upper.name=="upper" and assembled.upper.kind==player.UPPER_PART,"upper part identity")
  count=count+require(assembled.head.name=="head" and assembled.head.kind==player.HEAD_PART,"head part identity")
  count=count+require(assembled.lower.transform==root,"root transform retained")
  count=count+require(vecNear(assembled.upper.transform.origin,[10.0,21.0,32.0]),"tag_torso origin interpolation and root transform")
  count=count+require(assembled.upper.transform.axis==turn,"tag_torso axis composition")
  count=count+require(vecNear(assembled.head.transform.origin,[10.0,23.0,33.0]),"tag_head chained origin")
  count=count+require(assembled.head.transform.axis==turn,"tag_head chained axis")
  count=count+require(assembled.lower.animation.backlerp==0.5,"lower animation retained")
  count=count+require(assembled.upper.animation.frame==1 and assembled.upper.animation.oldFrame==0,"upper animation retained")
  triangles=player.render(assembled,1)
  count=count+require(len(triangles)==3,"one triangle from each model piece")
  count=count+require(triangles[0].part==player.LOWER_PART and triangles[1].part==player.UPPER_PART and triangles[2].part==player.HEAD_PART,"stable lower upper head order")
  count=count+require(vecNear(triangles[0].positions[0],[10.0,21.0,30.0]),"lower vertex root transform")
  count=count+require(vecNear(triangles[1].positions[0],[10.0,22.0,32.0]),"upper vertex tag transform")
  count=count+require(vecNear(triangles[2].positions[0],[10.0,24.0,33.0]),"head vertex chained transform")
  count=count+require(triangles[2].normals[0][1]>0.99 and triangles[2].normals[0][0]>-0.01 and triangles[2].normals[0][0]<0.01,"normal uses composed axis")
  count=count+require(triangles[1].texCoords[2]==[0.0,1.0],"texture coordinates retained")
  count=count+require(triangles[2].shaderName=="models/players/unit/head","shader retained")
  count=count+require(len(player.render(assembled,0))==0,"zero triangle limit")
  count=count+require(try(player.render(assembled,-1)) is error,"negative triangle limit rejected")
  count=count+require(try(player.assemble(set,player.animation(2,0,0.0),upperAnim,headAnim,root)) is error,"current frame range checked")
  count=count+require(try(player.assemble(set,player.animation(0,-1,0.0),upperAnim,headAnim,root)) is error,"old frame range checked")
  count=count+require(try(player.assemble(set,player.animation(0,0,1.1),upperAnim,headAnim,root)) is error,"backlerp range checked")
  missingLower=model("lower",1,[[]])
  count=count+require(try(player.assemble(player.models(missingLower,upper,head),player.animation(0,0,0.0),upperAnim,headAnim,root)) is error,"missing tag_torso rejected")
  missingUpper=model("upper",1,[[]])
  count=count+require(try(player.assemble(player.models(lower,missingUpper,head),lowerAnim,player.animation(0,0,0.0),headAnim,root)) is error,"missing tag_head rejected")
  count=count+require(try(player.assemble(player.models(lower,upper,void),lowerAnim,upperAnim,headAnim,root)) is error,"all three pieces required")
  count=count+require(try(player.assemble(set,lowerAnim,upperAnim,headAnim,player.transform([0.0],i))) is error,"root origin shape checked")
  count=count+require(player.identityTransform().origin==[0.0,0.0,0.0] and player.identityTransform().axis==i,"identity transform")
  orientation=tags.Orientation(true,[1.0,2.0,3.0],turn)
  attached=player.attach(player.identityTransform(),orientation)
  count=count+require(attached.origin==[1.0,2.0,3.0] and attached.axis==turn,"public attachment primitive")
  count=count+require(try(player.attach(root,tags.Orientation(false,[0.0,0.0,0.0],i))) is error,"missing attachment rejected")
  count=count+require(player.multiplyAxis(turn,turn)==[[-1.0,0.0,0.0],[0.0,-1.0,0.0],[0.0,0.0,1.0]],"row-axis matrix composition")
  print("PASS: "+str(count)+" player-model assembly contracts");return 0
end function
