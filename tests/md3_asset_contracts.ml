import mq3.format.md3 as md3
import mq3.compat.numeric as n

function require(ok,text) if not ok then return error(7510,text) end if;return 1 end function
function w16(data,at,value) data[at]=value&255;data[at+1]=(value>>8)&255;return void end function
function w32(data,at,value) n.writeU32(data,at,value);return void end function
function wf(data,at,value) w32(data,at,n.floatBits(value));return void end function
function text(data,at,value,capacity)
  raw=bytes(value);limit=len(raw);if limit>capacity then limit=capacity end if
  for index=0 to limit-1 data[at+index]=raw[index] end for
  return void
end function
function build()
  data=bytes(512,0)
  w32(data,0,md3.MD3_IDENT);w32(data,4,md3.MD3_VERSION);text(data,8,"unit.md3",64)
  w32(data,72,7);w32(data,76,1);w32(data,80,1);w32(data,84,1);w32(data,88,0)
  w32(data,92,108);w32(data,96,164);w32(data,100,276);w32(data,104,512)
  wf(data,108,-2.0);wf(data,112,-3.0);wf(data,116,-4.0);wf(data,120,5.0);wf(data,124,6.0);wf(data,128,7.0)
  wf(data,132,1.0);wf(data,136,2.0);wf(data,140,3.0);wf(data,144,9.0);text(data,148,"idle0",16)
  text(data,164,"tag_weapon",64);wf(data,228,4.0);wf(data,232,5.0);wf(data,236,6.0)
  for axis=0 to 2 for component=0 to 2 value=0.0;if axis==component then value=1.0 end if;wf(data,240+axis*12+component*4,value) end for end for
  s=276;w32(data,s,md3.MD3_IDENT);text(data,s+4,"gun",64);w32(data,s+68,0);w32(data,s+72,1);w32(data,s+76,1);w32(data,s+80,3);w32(data,s+84,1)
  w32(data,s+88,108);w32(data,s+92,120);w32(data,s+96,188);w32(data,s+100,212);w32(data,s+104,236)
  w32(data,s+108,0);w32(data,s+112,1);w32(data,s+116,2);text(data,s+120,"models/weapons2/test",64);w32(data,s+184,3)
  wf(data,s+188,0.0);wf(data,s+192,0.0);wf(data,s+196,1.0);wf(data,s+200,0.0);wf(data,s+204,0.0);wf(data,s+208,1.0)
  w16(data,s+212,64);w16(data,s+214,0);w16(data,s+216,0);w16(data,s+218,0)
  w16(data,s+220,0);w16(data,s+222,64);w16(data,s+224,0);w16(data,s+226,0x40)
  w16(data,s+228,0xffff);w16(data,s+230,0x8000);w16(data,s+232,64);w16(data,s+234,0x4000)
  return data
end function
function copy(data) result=bytes(len(data),0);for index=0 to len(data)-1 result[index]=data[index] end for;return result end function

function main(args)
  count=0;data=build();model=md3.load(data)
  count=count+require(model.name=="unit.md3","header name")
  count=count+require(model.flags==7,"header flags")
  count=count+require(model.numFrames==1 and model.numTags==1 and model.numSurfaces==1,"header counts")
  count=count+require(model.frames[0].mins==[-2.0,-3.0,-4.0],"frame mins")
  count=count+require(model.frames[0].maxs==[5.0,6.0,7.0],"frame maxs")
  count=count+require(model.frames[0].localOrigin==[1.0,2.0,3.0],"frame origin")
  count=count+require(model.frames[0].radius==9.0 and model.frames[0].name=="idle0","frame radius/name")
  count=count+require(model.bounds==[[-2.0,-3.0,-4.0],[5.0,6.0,7.0]],"model bounds")
  count=count+require(model.tags[0][0].name=="tag_weapon","tag name")
  count=count+require(model.tags[0][0].origin==[4.0,5.0,6.0],"tag origin")
  count=count+require(model.tags[0][0].axis==[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],"tag axis")
  surface=model.surfaces[0]
  count=count+require(surface.name=="gun","surface name")
  count=count+require(surface.shaders==["models/weapons2/test"],"shader name")
  count=count+require(surface.mesh.numFrames==1 and surface.mesh.numVerts==3 and surface.mesh.numTriangles==1,"mesh counts")
  count=count+require(surface.mesh.triangles==[0,1,2],"triangle indexes")
  count=count+require(surface.mesh.texCoords==[[0.0,0.0],[1.0,0.0],[0.0,1.0]],"texture coordinates")
  count=count+require(surface.mesh.frames[0][0].xyz==[64,0,0],"packed vertex")
  count=count+require(surface.mesh.frames[0][2].xyz==[-1,-32768,64],"signed packed vertex")
  count=count+require(surface.mesh.frames[0][1].packedNormal==0x40,"packed normal")
  triangles=md3.renderTriangles(model,0,0,0,0.0,8)
  count=count+require(len(triangles)==1,"render triangle count")
  count=count+require(triangles[0].positions[0]==[1.0,0.0,0.0],"render position scale")
  count=count+require(triangles[0].texCoords[2]==[0.0,1.0],"render texture coordinates")
  count=count+require(len(triangles[0].normals)==3,"render normals")
  count=count+require(triangles[0].shaderName=="models/weapons2/test","render shader")
  count=count+require(len(md3.renderTriangles(model,0,0,0,0.0,0))==0,"render limit")
  bad=copy(data);w32(bad,0,0);count=count+require(try(md3.load(bad)) is error,"bad signature")
  bad=copy(data);w32(bad,4,14);count=count+require(try(md3.load(bad)) is error,"bad version")
  bad=copy(data);w32(bad,104,513);count=count+require(try(md3.load(bad)) is error,"file end outside data")
  bad=copy(data);w32(bad,276+104,9999);count=count+require(try(md3.load(bad)) is error,"surface end outside file")
  bad=copy(data);w32(bad,276+108,3);count=count+require(try(md3.load(bad)) is error,"triangle index range")
  bad=copy(data);w32(bad,276+72,2);count=count+require(try(md3.load(bad)) is error,"surface frame mismatch")
  bad=copy(data);w32(bad,276+80,4097);count=count+require(try(md3.load(bad)) is error,"vertex limit")
  count=count+require(try(md3.renderTriangles(model,1,0,0,0.0,1)) is error,"render surface range")
  count=count+require(try(md3.renderTriangles(model,0,0,0,0.0,-1)) is error,"negative render limit")
  emptyTags=copy(data);w32(emptyTags,80,0);count=count+require(len(md3.load(emptyTags).tags[0])==0,"zero tags")
  emptyShaders=copy(data);w32(emptyShaders,276+76,0);count=count+require(len(md3.load(emptyShaders).surfaces[0].shaders)==0,"zero shaders")
  emptyTriangles=copy(data);w32(emptyTriangles,276+84,0);emptyModel=md3.load(emptyTriangles);count=count+require(len(emptyModel.surfaces[0].mesh.triangles)==0 and len(md3.renderTriangles(emptyModel,0,0,0,0.0,4))==0,"zero triangles")
  tagOnly=bytes(276,0);for index=0 to 275 tagOnly[index]=data[index] end for;w32(tagOnly,84,0);w32(tagOnly,100,276);w32(tagOnly,104,276);tagModel=md3.load(tagOnly);count=count+require(tagModel.numSurfaces==0 and len(tagModel.surfaces)==0 and tagModel.tags[0][0].name=="tag_weapon","tag-only hand MD3")
  print("PASS: "+str(count)+" MD3 asset contracts");return 0
end function
