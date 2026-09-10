import mq3.renderer.scene_queue as scene
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
  count=count+req(scene.addPolys(s,4,3,verts,2)==2 and len(s.polys)==2 and s.numPolyVerts==6,"two polys")
  count=count+req(s.polys[0].verts[1].xyz[0]==1 and s.polys[1].verts[0].xyz[0]==2,"vertex copy")
  verts[0].xyz[0]=99;count=count+req(s.polys[0].verts[0].xyz[0]==0,"owned copy")
  count=count+req(scene.addPolys(s,4,3,verts,1)==0 and c.text=="NULL poly shader,poly capacity reached,","vertex capacity")
  s.hardwareType=scene.GLHW_RAGEPRO;s.maxPolyVerts=20;scene.addPolys(s,5,3,verts,1)
  count=count+req(s.polys[2].verts[0].modulate==[255,255,255,255] and s.polys[2].verts[1].modulate[0]==2,"RagePro first vertex")
  count=count+req(scene.addPolys(s,5,3,verts,1)==0,"poly capacity")
  count=count+req(try(scene.addPolys(s,2,0,[],1)) is error,"invalid vertex count")
  f=scene.create(4,20);f.registered=true;f.worldLoaded=true;f.fogBounds=[[[0,0,0],[0,0,0]],[[10,10,10],[20,20,20]],[[30,30,30],[40,40,40]]]
  scene.addPolys(f,2,3,[v(9,12,12,1),v(11,13,12,1),v(9,14,12,1)],1);count=count+req(f.polys[0].fogIndex==1,"fog intersection")
  scene.addPolys(f,2,3,[v(21,21,21,1),v(22,22,22,1),v(23,23,23,1)],1);count=count+req(f.polys[1].fogIndex==0,"no fog")
  e=scene.create(2,2);e.registered=true;count=count+req(scene.addEntity(e,0,"model") and e.entities[0].lightingCalculated==false,"entity")
  count=count+req(try(scene.addEntity(e,-1,"bad")) is error and try(scene.addEntity(e,scene.RT_MAX_REF_ENTITY_TYPE,"bad")) is error,"entity types")
  count=count+req(scene.addLight(e,[1,2,3],64,1,0.5,0.25) and not e.dlights[0].additive,"normal light")
  count=count+req(scene.addAdditiveLight(e,[4,5,6],32,0,1,0) and e.dlights[1].additive,"additive light")
  count=count+req(not scene.addLight(e,[0,0,0],0,1,1,1),"nonpositive light")
  e.hardwareType=scene.GLHW_RIVA128;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"Riva light restriction")
  e.hardwareType=scene.GLHW_PERMEDIA2;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"Permedia light restriction")
  e.hardwareType=0;while len(e.dlights)<scene.MAX_DLIGHTS scene.addLight(e,[0,0,0],1,1,1,1) end while;count=count+req(not scene.addLight(e,[0,0,0],1,1,1,1),"light limit")
  e.dlights=[];e.polys=[scene.Poly(1,[],0)];scene.clearScene(e);scene.addEntity(e,1,"sprite");scene.addLight(e,[0,0,0],1,1,1,1);e.polys=e.polys+[scene.Poly(2,[],0)]
  count=count+req(len(scene.sceneEntities(e))==1 and len(scene.sceneLights(e))==1 and len(scene.scenePolys(e))==1,"scene ranges")
  scene.toggleFrame(e);count=count+req(len(e.entities)==0 and len(e.dlights)==0 and len(e.polys)==0 and e.numPolyVerts==0,"frame reset")
  count=count+req(try(scene.addLight(e,[1,2],1,1,1,1)) is error or not e.registered,"vector validation boundary")
  count=count+req(try(scene.create(-1,0)) is error,"capacity validation")
  print "PASS: "+str(count)+" scene queue contracts";return 0
end function
