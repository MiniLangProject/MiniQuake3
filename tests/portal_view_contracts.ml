import mq3.renderer.portal_view as portal
struct Entity reType origin oldorigin axis oldframe frame skinNum end struct
function req(value,label) if not value then return error(7701,"portal view contract: "+label) end if;return 1 end function
function main(args)
  count=0;axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];sourceAxis=axis
  mirrorEntity=Entity(7,[5.0,2.0,3.0],[5.0,2.0,3.0],axis,0,0,0)
  mirror=portal.prepare([1.0,0.0,0.0],5.0,[mirrorEntity],1000,[8.0,2.0,3.0],sourceAxis)
  count=count+req(mirror!=void and mirror.mirror and mirror.entityIndex==0,"mirror marker selected")
  count=count+req(mirror.surface.origin==[5.0,0.0,0.0] and mirror.camera.origin==[5.0,0.0,0.0],"mirror anchors on plane")
  count=count+req(mirror.origin==[2.0,2.0,3.0] and mirror.axis[0]==[-1.0,0.0,0.0],"mirror reflects view")
  count=count+req(mirror.pvsOrigin==mirrorEntity.oldorigin,"mirror PVS origin")
  count=count+req(mirror.planeNormal==[1.0,0.0,0.0] and mirror.planeDist==5.0,"mirror clip plane")
  cameraEntity=Entity(7,[5.0,10.0,3.0],[100.0,20.0,30.0],axis,0,0,90)
  camera=portal.prepare([1.0,0.0,0.0],5.0,[cameraEntity],1000,[8.0,2.0,3.0],sourceAxis)
  count=count+req(camera!=void and not camera.mirror and camera.camera.origin==[100.0,20.0,30.0],"remote camera selected")
  count=count+req(camera.surface.origin==[5.0,10.0,3.0],"portal origin projected to plane")
  count=count+req(camera.camera.axis[0]==[-1.0,0.0,0.0],"camera forward inverted")
  count=count+req(camera.axis[0][0]== -1.0,"remote view mirrored through orientations")
  spinning=Entity(7,[5.0,0.0,0.0],[10.0,20.0,30.0],axis,1,45,0);spin=portal.portalOrientation([1.0,0.0,0.0],5.0,[spinning],2000)
  count=count+req(spin!=void and spin[1].axis[1]!=[0.0,-1.0,0.0],"continuous portal rotation")
  bobbing=Entity(7,[5.0,0.0,0.0],[10.0,20.0,30.0],axis,1,0,15);bob=portal.portalOrientation([1.0,0.0,0.0],5.0,[bobbing],500)
  count=count+req(bob!=void and bob[1].axis[1]!=[0.0,-1.0,0.0],"bobbing portal rotation")
  nonPortal=Entity(0,[5.0,0.0,0.0],[5.0,0.0,0.0],axis,0,0,0);count=count+req(portal.portalOrientation([1.0,0.0,0.0],5.0,[nonPortal],0)==void,"non-portal ignored")
  far=Entity(7,[70.0,0.0,0.0],[70.0,0.0,0.0],axis,0,0,0);count=count+req(portal.portalOrientation([1.0,0.0,0.0],5.0,[far],0)==void,"marker beyond 64 units ignored")
  nearby=Entity(7,[69.0,0.0,0.0],[69.0,0.0,0.0],axis,0,0,0);count=count+req(portal.portalOrientation([1.0,0.0,0.0],5.0,[nearby],0)!=void,"64-unit boundary accepted")
  count=count+req(try(portal.prepare([1.0],5.0,[mirrorEntity],0,[0.0,0.0,0.0],axis)) is error,"plane shape checked")
  count=count+req(try(portal.prepare([1.0,0.0,0.0],5.0,[mirrorEntity],0,[0.0],axis)) is error,"view origin checked")
  count=count+req(try(portal.prepare([1.0,0.0,0.0],5.0,[mirrorEntity],0,[0.0,0.0,0.0],[])) is error,"view axes checked")
  print("PASS: "+str(count)+" portal-view contracts");return 0
end function
