import mq3.renderer.tr_sky as sky

function req(value,message) if not value then print("FAIL: "+message);return 1 end if;return 0 end function
function close(a,b) value=a-b;if value<0.0 then value=0.0-value end if;return value<0.001 end function

function main(args)
  failures=0;count=0
  bounds=sky.clearSkyBox();count=count+1;failures=failures+req(bounds.minS[0]==9999.0 and bounds.maxT[5]==-9999.0,"clear sky box")
  axis=sky.addSkyPolygon(bounds,[[8.0,-2.0,-4.0],[8.0,2.0,-4.0],[8.0,2.0,4.0],[8.0,-2.0,4.0]]);count=count+1;failures=failures+req(axis==0 and bounds.minS[0]<=-0.25 and bounds.maxS[0]>=0.25,"dominant sky face and projection")
  clipped=sky.rbClipSkyPolygons([[-5.0,-5.0,2.0],[5.0,-5.0,2.0],[5.0,5.0,2.0],[-5.0,5.0,2.0]],[0,1,2,0,2,3],[0.0,0.0,0.0]);count=count+1;failures=failures+req(not (clipped is error) and clipped.maxS[4]>=1.0 and clipped.minS[4]<=-1.0,"six-plane polygon clipping")
  value=sky.makeSkyVec(0.0,0.0,4,1024.0,0.0,1.0);count=count+1;failures=failures+req(close(value.xyz[2],1024.0/1.75) and value.st==[0.5,0.5],"sky vector and seam-safe UV")
  edge=sky.makeSkyVec(-1.0,1.0,0,1024.0,1.0/256.0,255.0/256.0);count=count+1;failures=failures+req(close(edge.st[0],1.0/256.0) and close(edge.st[1],1.0/256.0),"bilerp seam clamp")
  range=sky.quantizedBounds(bounds,0,-4);count=count+1;failures=failures+req(range[0][0]>=-4 and range[1][0]<=4 and range[0][1]>=-4 and range[1][1]<=4,"subdivision bounds clamp")
  side=sky.drawSkySide("right",0,[-1,-1],[1,1],1024.0);count=count+1;failures=failures+req(side.image=="right" and len(side.mesh.vertices)==9 and len(side.mesh.indexes)==24,"sky side grid and indexes")
  shader=sky.SkyShader(["right","left","front","back","up","down"],512.0,2);box=sky.drawSkyBox(shader,bounds,1024.0);count=count+1;failures=failures+req(len(box)>=1 and box[0].mesh!=void,"visible outer skybox faces")
  table=sky.rInitSkyTexCoords(512.0);count=count+1;failures=failures+req(len(table.coords)==6 and len(table.coords[0])==9 and table.factors[4][4][4]>0.0,"486 cloud intersections")
  cloud=sky.rBuildCloudData(shader,bounds,1024.0,[1.0,2.0,3.0],table);count=count+1;failures=failures+req(len(cloud.vertices)>0 and len(cloud.indexes)>0,"cloud geometry first-stage indexes")
  noCloud=sky.rBuildCloudData(sky.SkyShader(shader.outerbox,0.0,2),bounds,1024.0,[0.0,0.0,0.0],table);count=count+1;failures=failures+req(len(noCloud.vertices)==0 and len(noCloud.indexes)==0,"zero cloud height")
  sun=sky.rbDrawSun(true,true,1024.0,[0.0,0.0,1.0]);count=count+1;failures=failures+req(len(sun.vertices)==4 and sun.indexes==[0,1,2,0,2,3],"sun quad")
  hiddenSun=sky.rbDrawSun(false,true,1024.0,[0.0,0.0,1.0]);count=count+1;failures=failures+req(len(hiddenSun.vertices)==0,"sun requires rendered sky")
  fast=sky.rbStageIteratorSky([[-5.0,-5.0,2.0],[5.0,-5.0,2.0],[5.0,5.0,2.0]],[0,1,2],[0.0,0.0,0.0],shader,1024.0,true,false,table,true,[0.0,0.0,1.0]);count=count+1;failures=failures+req(not fast.skyRendered and len(fast.skybox)==0,"fastsky bypass")
  staged=sky.rbStageIteratorSky([[-5.0,-5.0,2.0],[5.0,-5.0,2.0],[5.0,5.0,2.0]],[0,1,2],[0.0,0.0,0.0],shader,1024.0,false,true,table,true,[0.0,0.0,1.0]);count=count+1;failures=failures+req(staged.skyRendered and staged.depthMin==0.0 and len(staged.sun.vertices)==4,"stage iterator order and showsky depth")
  if failures!=0 then return 1 end if;print("PASS: "+str(count)+" tr_sky contracts");return 0
end function
