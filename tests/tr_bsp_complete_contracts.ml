import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as render
import mq3.renderer.tr_bsp_runtime as tr

function require(ok,text) if not ok then return error(7711,text) end if;return 1 end function
function putI(data,offset,value) n.writeU32(data,offset,value);return value end function
function putF(data,offset,value) n.writeU32(data,offset,n.floatBits(value));return value end function
function fixture()
  data=bytes(52000,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  entity=bytes("{ \"classname\" \"worldspawn\" \"gridsize\" \"64 64 128\" }");offsets[0]=144;lengths[0]=len(entity);for i=0 to len(entity)-1 data[144+i]=entity[i] end for
  offsets[1]=256;lengths[1]=144;counts[1]=2;a=bytes("textures/one");for i=0 to len(a)-1 data[256+i]=a[i] end for;putI(data,320,0x80);b=bytes("textures/two");for i=0 to len(b)-1 data[328+i]=b[i] end for
  offsets[2]=400;lengths[2]=16;counts[2]=1;putF(data,400,1.0);putF(data,412,4.0)
  offsets[3]=420;lengths[3]=36;counts[3]=1;putI(data,420,0);putI(data,424,0xffffffff);putI(data,428,0xffffffff);putI(data,432,-16);putI(data,436,-16);putI(data,440,-16);putI(data,444,16);putI(data,448,16);putI(data,452,16)
  offsets[4]=460;lengths[4]=48;counts[4]=1;putI(data,460,0);putI(data,464,1);putI(data,468,-16);putI(data,472,-16);putI(data,476,-16);putI(data,480,16);putI(data,484,16);putI(data,488,16);putI(data,492,0);putI(data,496,4)
  offsets[5]=512;lengths[5]=16;counts[5]=4;for i=0 to 3 putI(data,512+i*4,i) end for
  offsets[7]=540;lengths[7]=40;counts[7]=1;putF(data,540,0.0);putF(data,544,0.0);putF(data,548,0.0);putF(data,552,0.0);putF(data,556,0.0);putF(data,560,0.0);putI(data,564,0);putI(data,568,4)
  offsets[10]=600;counts[10]=16;lengths[10]=704;positions=[[0.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0],[0.0,0.0,3.0],[0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0],[0.0,1.0,0.0],[1.0,1.0,2.0],[2.0,1.0,0.0],[0.0,2.0,0.0],[1.0,2.0,0.0],[2.0,2.0,0.0],[9.0,9.0,9.0],[10.0,10.0,10.0]]
  for i=0 to 15 off=600+i*44;for axis=0 to 2 putF(data,off+axis*4,positions[i][axis]) end for;putF(data,off+28,0.0);putF(data,off+32,0.0);putF(data,off+36,1.0);data[off+40]=10;data[off+41]=20;data[off+42]=30;data[off+43]=255 end for
  offsets[11]=1400;counts[11]=9;lengths[11]=36;indexes=[0,1,2,0,2,3,0,1,4];for i=0 to 8 putI(data,1400+i*4,indexes[i]) end for
  offsets[13]=1500;counts[13]=4;lengths[13]=416
  putI(data,1500,0);putI(data,1504,0xffffffff);putI(data,1508,1);putI(data,1512,0);putI(data,1516,4);putI(data,1520,0);putI(data,1524,6);putI(data,1528,0);putF(data,1584,0.0);putF(data,1588,0.0);putF(data,1592,1.0)
  off=1604;putI(data,off,1);putI(data,off+4,0xffffffff);putI(data,off+8,3);putI(data,off+12,0);putI(data,off+16,5);putI(data,off+20,6);putI(data,off+24,3);putI(data,off+28,0xffffffff)
  off=1708;putI(data,off,1);putI(data,off+4,0xffffffff);putI(data,off+8,2);putI(data,off+12,5);putI(data,off+16,9);putI(data,off+28,0);putI(data,off+96,3);putI(data,off+100,3)
  off=1812;putI(data,off,1);putI(data,off+4,0xffffffff);putI(data,off+8,4);putF(data,off+48,10.0);putF(data,off+52,20.0);putF(data,off+56,30.0);putF(data,off+60,0.25);putF(data,off+64,0.5);putF(data,off+68,1.0);putF(data,off+92,1.0)
  offsets[14]=2000;counts[14]=1;lengths[14]=49152;data[2000]=1;data[2001]=2;data[2002]=3
  offsets[15]=51200;lengths[15]=8;counts[15]=1;data[51200]=10;data[51201]=20;data[51202]=30;data[51203]=40;data[51204]=50;data[51205]=60
  offsets[16]=51216;lengths[16]=9;counts[16]=9;putI(data,51216,1);putI(data,51220,1);data[51224]=1
  return bsp.BSP(data,offsets,lengths,counts)
end function
function grid(points,width,height,origin,radius) return tr.Grid(points,width,height,array(width,0.0),array(height,0.0),origin,radius,false,false) end function
function makeVertex(x,y,z) return render.RenderVertex([x,y,z],[0.0,0.0],[0.0,0.0],[0.0,0.0,1.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function
function main(args)
  count=0;map=fixture();world=tr.World("maps/unit.bsp","unit",map,[],[],[],void,[],[],[],[],void,"",void,void,void,0);world.shaders=tr.R_LoadShaders(map)
  count=count+require(len(world.shaders)==2 and world.shaders[0].name=="textures/one" and world.shaders[0].surfaceFlags==0x80,"R_LoadShaders")
  count=count+require(tr.ShaderForShaderNum(world,1,3).lightmapIndex==3,"ShaderForShaderNum")
  count=count+require(tr.HSVtoRGB(0.0,1.0,0.5)==[0.5,0.0,0.0],"HSVtoRGB")
  count=count+require(tr.R_ColorShiftLightingBytes([200,100,50,77],2)==[255,127,63,77],"R_ColorShiftLightingBytes")
  maps=tr.R_LoadLightmaps(map,2,0,false);count=count+require(len(maps)==2 and maps[0][0]==4 and maps[0][3]==255,"R_LoadLightmaps and one-map workaround")
  planes=tr.R_LoadPlanes(map);count=count+require(len(planes)==1 and planes[0].type==0 and planes[0].dist==4.0,"R_LoadPlanes")
  world.planes=planes;face=tr.ParseFace(world,0);tri=tr.ParseTriSurf(world,1);mesh=tr.ParseMesh(world,2);flare=tr.ParseFlare(world,3)
  count=count+require(face.kind==tr.MST_PLANAR and face.data.triangleCount==2,"ParseFace")
  count=count+require(tri.kind==tr.MST_TRIANGLE_SOUP and tri.data.triangleCount==1 and tri.shader.lightmapIndex==tr.LIGHTMAP_BY_VERTEX,"ParseTriSurf")
  count=count+require(mesh.kind==tr.MST_PATCH and mesh.data.triangleCount>0,"ParseMesh")
  count=count+require(flare.kind==tr.MST_FLARE and flare.flare.origin==[10.0,20.0,30.0],"ParseFlare")
  count=count+require(tr.patch(world,2).kind==tr.MST_PATCH,"patch facade")
  world.surfaces=tr.R_LoadSurfaces(world);count=count+require(len(world.surfaces)==4,"R_LoadSurfaces")
  marks=tr.R_LoadMarksurfaces(map);count=count+require(marks==[0,1,2,3],"R_LoadMarksurfaces")
  nodes=tr.R_LoadNodesAndLeafs(map);count=count+require(len(nodes)==2 and nodes[1].parent==0 and nodes[1].cluster==0,"R_LoadNodesAndLeafs and R_SetParent")
  world.nodes=nodes;models=tr.R_LoadSubmodels(world);count=count+require(len(models)==1 and models[0].name=="*0" and models[0].numSurfaces==4,"R_LoadSubmodels")
  visibility=tr.R_LoadVisibility(map,1,void);count=count+require(visibility.numClusters==1 and visibility.clusterBytes==1 and visibility.data[0]==1,"R_LoadVisibility")
  state=tr.createState();external=bytes(1,3);tr.RE_SetWorldVisData(state,external);count=count+require(state.externalVisData==external,"RE_SetWorldVisData")
  tr.R_LoadEntities(world);token=tr.R_GetEntityToken(world,64);count=count+require(token==[true,"{"],"R_LoadEntities and R_GetEntityToken")
  gridData=tr.R_LoadLightGrid(map);count=count+require(gridData.valid and gridData.bounds==[1,1,1],"R_LoadLightGrid")
  fogs=tr.R_LoadFogs(map,void);count=count+require(len(fogs.fogs)==1,"R_LoadFogs empty sentinel")
  a=grid([makeVertex(0.0,0.0,0.0),makeVertex(1.0,0.0,0.0),makeVertex(2.0,0.0,0.0),makeVertex(0.0,1.0,0.0),makeVertex(1.0,1.0,0.0),makeVertex(2.0,1.0,0.0),makeVertex(0.0,2.0,0.0),makeVertex(1.0,2.0,0.0),makeVertex(2.0,2.0,0.0)],3,3,[0.0,0.0,0.0],2.0)
  b=grid([makeVertex(0.0,0.0,0.0),makeVertex(2.0,0.0,0.0),makeVertex(0.0,-1.0,0.0),makeVertex(2.0,-1.0,0.0)],2,2,[0.0,0.0,0.0],2.0)
  a.widthLodError=[0.0,7.0,0.0];mergedWidth=tr.R_MergedWidthPoints(a,0);mergedHeight=tr.R_MergedHeightPoints(a,0);count=count+require(mergedWidth==false and mergedHeight==false,"merged-edge detection")
  count=count+require(tr.R_StitchPatches(a,b) and b.width==3 and b.control[1].position==[1.0,0.0,0.0],"R_StitchPatches inserts missing edge vertex")
  fixed=grid(a.control,3,3,[0.0,0.0,0.0],2.0);tr.R_FixSharedVertexLodError([a,fixed]);count=count+require(fixed.lodFixed==2 and fixed.widthLodError[1]==7.0,"R_FixSharedVertexLodError")
  copies=tr.R_MovePatchSurfacesToHunk([a]);count=count+require(len(copies)==1 and copies[0].control==a.control,"R_MovePatchSurfacesToHunk retained copy")
  count=count+require(tr.R_StitchAllPatches([a])==0,"R_StitchAllPatches stable")
  print("PASS: "+str(count)+" complete tr_bsp contracts");return 0
end function
