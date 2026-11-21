import mq3.renderer.scene_queue as scene
import mq3.compat.numeric as n
struct Context text end struct
function diag(c,text) c.text=c.text+text+",";return void end function
function req(value,label) if not value then return error(3479,"scene queue contract: "+label) end if;return 1 end function
function v(x,y,z,r) return scene.PolyVert([x,y,z],[x,y],[r,r,r,r]) end function
function main(args)
  count=0;s=scene.create(3,8);c=Context("");s.context=c;s.diagnosticFn=diag
  count=count+req(scene.addPolys(s,1,3,[v(0,0,0,1),v(1,0,0,2),v(0,1,0,3)],1)==0,"unregistered poly")
  count=count+req(not scene.addEntity(s,0,"x") and not scene.addLight(s,[0,0,0],10,1,1,1),"unregistered submissions")
  s.registered=true;count=count+req(scene.addPolys(s,0,3,[v(0,0,0,1),v(1,0,0,2),v(0,1,0,3)],1)==0 and c.text=="NULL poly shader,","NULL shader")
  verts=[v(0,0,0,1),v(1,0,0,2),v(0,1,0,3),v(2,0,0,4),v(3,0,0,5),v(2,1,0,6)]
  count=count+req(scene.addPolys(s,4,3,verts,2)==2 and s.polys.len()==2 and s.numPolyVerts==6,"two polys")
  count=count+req(s.polys.get(0).verts[1].xyz[0]==1 and s.polys.get(1).verts[0].xyz[0]==2,"vertex copy")
  verts[0].xyz[0]=99;count=count+req(s.polys.get(0).verts[0].xyz[0]==0,"owned copy")
  count=count+req(scene.addPolys(s,4,3,verts,1)==0 and c.text=="NULL poly shader,poly capacity reached,","vertex capacity")
  s.hardwareType=scene.GLHW_RAGEPRO;s.maxPolyVerts=20;scene.addPolys(s,5,3,verts,1)
  count=count+req(s.polys.get(2).verts[0].modulate==[255,255,255,255] and s.polys.get(2).verts[1].modulate[0]==2,"RagePro first vertex")
  count=count+req(scene.addPolys(s,5,3,verts,1)==0,"poly capacity")
  count=count+req(try(scene.addPolys(s,2,0,[],1)) is error,"invalid vertex count")
  f=scene.create(4,20);f.registered=true;f.worldLoaded=true;f.fogBounds=[[[0,0,0],[0,0,0]],[[10,10,10],[20,20,20]],[[30,30,30],[40,40,40]]]
  scene.addPolys(f,2,3,[v(9,12,12,1),v(11,13,12,1),v(9,14,12,1)],1);count=count+req(f.polys.get(0).fogIndex==1,"fog intersection")
  scene.addPolys(f,2,3,[v(21,21,21,1),v(22,22,22,1),v(23,23,23,1)],1);count=count+req(f.polys.get(1).fogIndex==0,"no fog")
  e=scene.create(2,2);e.registered=true;count=count+req(scene.addEntity(e,0,"model") and e.entities[0].lightingCalculated==false,"entity")
  count=count+req(try(scene.addEntity(e,-1,"bad")) is error and try(scene.addEntity(e,scene.RT_MAX_REF_ENTITY_TYPE,"bad")) is error,"entity types")
  count=count+req(scene.addLight(e,[1,2,3],64,1,0.5,0.25) and not e.dlights[0].additive,"normal light")
  count=count+req(scene.addAdditiveLight(e,[4,5,6],32,0,1,0) and e.dlights[1].additive,"additive light")
  count=count+req(not scene.addLight(e,[0,0,0],0,1,1,1),"nonpositive light")
  e.hardwareType=scene.GLHW_RIVA128;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"Riva light restriction")
  e.hardwareType=scene.GLHW_PERMEDIA2;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"Permedia light restriction")
  e.hardwareType=0;while len(e.dlights)<scene.MAX_DLIGHTS scene.addLight(e,[0,0,0],1,1,1,1) end while;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"light limit")
  e.dlights=[];e.polys.add(scene.Poly(1,[],0));scene.clearScene(e);scene.addEntity(e,1,"sprite");scene.addLight(e,[0,0,0],1,1,1,1);e.polys.add(scene.Poly(2,[],0))
  count=count+req(len(scene.sceneEntities(e))==1 and len(scene.sceneLights(e))==1 and len(scene.scenePolys(e))==1,"scene ranges")
  view=scene.finishScene(e);count=count+req(len(view.entities)==1 and len(view.dlights)==1 and len(view.polys)==1,"finished scene records")
  count=count+req(len(scene.sceneEntities(e))==0 and len(scene.sceneLights(e))==0 and len(scene.scenePolys(e))==0,"finished scene advances ranges")
  scene.addEntity(e,1,"next");count=count+req(len(scene.sceneEntities(e))==1 and scene.sceneEntities(e)[0].payload=="next","next scene is isolated")
  scene.toggleFrame(e);count=count+req(len(e.entities)==0 and len(e.dlights)==0 and e.polys.len()==0 and e.numPolyVerts==0,"frame reset")
  many=scene.create(1024,3072);many.registered=true;tri=[v(0,0,0,1),v(1,0,0,2),v(0,1,0,3)]
  for index=0 to 1023 scene.addPolys(many,4,3,tri,1) end for
  count=count+req(many.polys.len()==1024 and len(scene.scenePolys(many))==1024,"bounded growable polygon queue")
  firstView=scene.finishScene(many);scene.toggleFrame(many)
  count=count+req(len(firstView.polys)==1024 and many.polys.len()==0 and firstView.polys[1023].verts[0].xyz[0]==0,"snapshot survives queue reset")
  decoded=scene.create(4,12);decoded.registered=true;owned=[v(3,0,0,1),v(4,0,0,2),v(3,1,0,3)]
  scene.addPolysDecoded(decoded,7,3,owned,1)
  count=count+req(decoded.polys.get(0).verts==owned and scene.scenePolys(decoded)[0].hShader==7,"decoded single-poly ownership")
  scene.addPolysDecoded(decoded,8,3,[v(5,0,0,1),v(6,0,0,2),v(5,1,0,3),v(7,0,0,4),v(8,0,0,5),v(7,1,0,6)],2)
  count=count+req(decoded.polys.len()==3 and decoded.polys.get(1).verts[0].xyz[0]==5 and decoded.polys.get(2).verts[0].xyz[0]==7,"decoded multi-poly ranges")
  count=count+req(try(scene.addLight(e,[1,2],1,1,1,1)) is error or not e.registered,"vector validation boundary")
  count=count+req(try(scene.create(-1,0)) is error,"capacity validation")
  payload=bytes(140,0);n.writeU32(payload,4,9);n.writeU32(payload,8,17)
  values=[1.0,2.0,3.0,4.0,1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0,10.0,20.0,30.0,11.0,12.0,13.0]
  offsets=[12,16,20,24,28,32,36,40,44,48,52,56,60,68,72,76,84,88,92]
  for index=0 to len(values)-1 n.writeU32(payload,offsets[index],n.floatBits(values[index])) end for
  n.writeU32(payload,64,1);n.writeU32(payload,80,5);n.writeU32(payload,96,4);n.writeU32(payload,100,n.floatBits(0.25));n.writeU32(payload,104,6);n.writeU32(payload,108,7);n.writeU32(payload,112,8)
  payload[116]=10;payload[117]=20;payload[118]=30;payload[119]=40;n.writeU32(payload,120,n.floatBits(0.5));n.writeU32(payload,124,n.floatBits(0.75));n.writeU32(payload,128,n.floatBits(1.5));n.writeU32(payload,132,n.floatBits(16.0));n.writeU32(payload,136,n.floatBits(45.0))
  decoded=scene.decodeEntity(scene.RefEntity(0,payload,false))
  count=count+req(decoded.reType==0 and decoded.renderfx==9 and decoded.hModel==17,"decoded header")
  count=count+req(decoded.lightingOrigin==[1.0,2.0,3.0] and decoded.shadowPlane==4.0,"decoded lighting")
  count=count+req(decoded.axis==[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] and decoded.nonNormalizedAxes,"decoded axes")
  count=count+req(decoded.origin==[10.0,20.0,30.0] and decoded.oldorigin==[11.0,12.0,13.0],"decoded origins")
  count=count+req(decoded.frame==5 and decoded.oldframe==4 and decoded.backlerp==0.25,"decoded animation")
  count=count+req(decoded.skinNum==6 and decoded.customSkin==7 and decoded.customShader==8,"decoded materials")
  count=count+req(decoded.shaderRGBA==[10,20,30,40] and decoded.shaderTexCoord==[0.5,0.75],"decoded shader values")
  count=count+req(decoded.shaderTime==1.5 and decoded.radius==16.0 and decoded.rotation==45.0,"decoded sprite values")
  count=count+req(try(scene.decodeEntity(scene.RefEntity(0,bytes(139,0),false))) is error,"short refEntity rejected")
  print "PASS: "+str(count)+" scene queue contracts";return 0
end function
