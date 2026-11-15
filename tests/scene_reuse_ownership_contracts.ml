// SPDX-License-Identifier: GPL-2.0-or-later
// Retained MD3 scratch belongs to its target; BSP data and older view colors
// must survive storage reuse and lighting changes without being modified.
import mq3.renderer.qvm_scene_geometry as reuseGeo
import mq3.renderer.playable_light_grid as reuseLight

function reuseCheck(value,label) if not value then return error(7685,"scene reuse ownership: "+label) end if;return 1 end function
function reuseAppendModel(output)
  return reuseGeo.appendIndexedModelTriangle(output,[[1.0,0.0,0.0],[1.0,1.0,0.0],[1.0,0.0,1.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],void,[255,255,255,255],[0.0,0.0],0.0,0,1,2,1,0,0,"model","surface",0,0,0,0,0)
end function
function reuseTransform(normals)
  return reuseGeo.TransformEntry(1,0,0,0,0.0,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[],normals,void,void,void,-1,void)
end function
function main(args)
  count=0;output=reuseGeo.Geometry(array(1,void),0,0,0,0,0,0,0,0,[],0,[],0)
  added=reuseAppendModel(output);if added is error then return added end if
  target=output.triangles[0];oldModelUvs=target.lightmapCoords
  count=count+reuseCheck(target.vertexIds==[0,1,2] and target.lightmapCoords==[[0.0,0.0],[0.0,0.0],[0.0,0.0]],"fresh MD3 target owns zero lightmap coordinates")
  output.triangleCount=0;added=reuseAppendModel(output);if added is error then return added end if
  // Mutation is only an alias probe; restore the owned buffer immediately.
  oldModelUvs[0][0]=17.0
  count=count+reuseCheck(target.lightmapCoords[0][0]==17.0,"consecutive MD3 reuse retains its own nested UV buffers")
  oldModelUvs[0][0]=0.0
  inlineUvs=[[0.25,0.75],[0.5,0.125],[0.875,0.625]]
  mapped=reuseGeo.mappedTriangle([[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],inlineUvs,[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],[[128,64,32,255],[128,64,32,255],[128,64,32,255]],[255,255,255,255],[0.0,0.0],0.0,2,0,0,"inline","",0,0,0,7,0,true,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],void)
  output.triangleCount=0;added=reuseGeo.appendTriangle(output,mapped);if added is error then return added end if
  count=count+reuseCheck(target.vertexIds==void and target.lightmapIndex==7 and target.lightmapCoords==inlineUvs,"MD3 to inline clears identity and binds BSP lightmap UVs")
  output.triangleCount=0;added=reuseAppendModel(output);if added is error then return added end if
  count=count+reuseCheck(target.vertexIds==[0,1,2] and target.lightmapIndex==-1 and not target.dynamicLight and target.lightmapCoords==[[0.0,0.0],[0.0,0.0],[0.0,0.0]],"inline to MD3 resets mapped state and installs owned zero UVs")
  target.lightmapCoords[0][0]=19.0
  count=count+reuseCheck(inlineUvs==[[0.25,0.75],[0.5,0.125],[0.875,0.625]] and oldModelUvs==[[0.0,0.0],[0.0,0.0],[0.0,0.0]],"new MD3 UV storage aliases neither BSP data nor the earlier MD3 buffer")
  target.lightmapCoords[0][0]=0.0
  // A generic zero-UV sprite/poly may also share storage owned elsewhere.
  plain=reuseGeo.triangle(mapped.positions,mapped.texCoords,mapped.normals,mapped.colors,[255,255,255,255],[0.0,0.0],0.0,0,0,0,"","",0,0,0);plainUvs=plain.lightmapCoords
  output.triangleCount=0;added=reuseGeo.appendTriangle(output,plain);if added is error then return added end if
  output.triangleCount=0;added=reuseAppendModel(output);if added is error then return added end if
  target.lightmapCoords[0][0]=23.0
  count=count+reuseCheck(plainUvs==[[0.0,0.0],[0.0,0.0],[0.0,0.0]] and target.vertexIds==[0,1,2],"generic zero UV values do not grant ownership to a later MD3 target")
  target.lightmapCoords[0][0]=0.0
  normals=[[0.0,0.0,1.0],[0.0,0.0,-1.0]];entry=reuseTransform(normals)
  firstLight=reuseLight.Sample([10.0,20.0,30.0],[3.0,4.0,5.0],[0.0,0.0,1.0],1.0)
  oldColors=reuseGeo.cachedVertexColors(entry,firstLight,100)
  count=count+reuseCheck(oldColors==[[13,24,35,100],[10,20,30,100]],"fixed-size diffuse buffers preserve original channel and alpha values")
  secondLight=reuseLight.Sample([99.0,88.0,77.0],[7.0,8.0,9.0],[0.0,0.0,1.0],1.0)
  newColors=reuseGeo.cachedVertexColors(entry,secondLight,200)
  count=count+reuseCheck(newColors==[[106,96,86,200],[99,88,77,200]] and oldColors==[[13,24,35,100],[10,20,30,100]],"lighting changes allocate fresh colors and preserve older prepared-view references")
  newColors[0][0]=9
  count=count+reuseCheck(newColors[1]==[99,88,77,200] and oldColors[0]==[13,24,35,100],"each vertex color owns a distinct fixed-size buffer")
  newColors[0][0]=106;sameColors=reuseGeo.cachedVertexColors(entry,secondLight,200);sameColors[1][1]=17
  count=count+reuseCheck(newColors[1][1]==17 and oldColors[1]==[10,20,30,100],"unchanged lighting reuses its valid color cache without reaching old view colors")
  sameColors[1][1]=88
  otherEntry=reuseTransform(normals);otherColors=reuseGeo.cachedVertexColors(otherEntry,secondLight,200);otherColors[0][0]=11
  count=count+reuseCheck(newColors==[[106,96,86,200],[99,88,77,200]] and normals==[[0.0,0.0,1.0],[0.0,0.0,-1.0]],"distinct transformed surfaces never share mutable output colors or overwrite normals")
  print("PASS: "+str(count)+" scene reuse ownership contracts (MD3/inline/poly UVs and older-view colors)");return 0
end function
