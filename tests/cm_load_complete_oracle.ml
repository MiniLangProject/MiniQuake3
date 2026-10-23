import mq3.collision.world as cm
import mq3.format.bsp as bsp
import mq3.qcommon.md4 as md4
import mq3.compat.numeric as n
import std.fs as fs

function u(value) return str(n.u32(value)) end function
function six(bounds) return u(n.floatBits(bounds[0][0]))+","+u(n.floatBits(bounds[0][1]))+","+u(n.floatBits(bounds[0][2]))+","+u(n.floatBits(bounds[1][0]))+","+u(n.floatBits(bounds[1][1]))+","+u(n.floatBits(bounds[1][2])) end function
function main(args)
  data=fs.readAllBytes(args[0]);map=bsp.load(data);state=cm.mapState(true);loaded=cm.CM_LoadMap(state,args[0],data,false);world=loaded.world
  print("load="+u(loaded.checksum)+","+str(cm.CM_NumClusters(world))+","+str(cm.CM_NumInlineModels(world))+","+str(len(world.leaves))+","+str(world.visibility.numAreas)+","+str(len(world.shaders)))
  entityData=slice(map.data,map.offsets[0],map.lengths[0]);print("entity="+str(len(entityData))+","+u(md4.blockChecksum(entityData)))
  first=world.shaders[0];last=world.shaders[len(world.shaders)-1];print("shader0="+first.name+","+u(first.surfaceFlags)+","+u(first.contentFlags));print("shaderN="+last.name+","+u(last.surfaceFlags)+","+u(last.contentFlags))
  print("leaf0="+str(cm.CM_LeafCluster(world,0))+","+str(cm.CM_LeafArea(world,0)));lastLeaf=len(world.leaves)-1;print("leafN="+str(cm.CM_LeafCluster(world,lastLeaf))+","+str(cm.CM_LeafArea(world,lastLeaf)))
  print("model0="+six(cm.CM_ModelBounds(world,0)));print("modelN="+six(cm.CM_ModelBounds(world,len(world.models)-1)))
  patchCount=0;for each surface in world.surfaces if surface!=void then patchCount=patchCount+1 end if end for
  print("lumps="+str(map.lengths[0])+","+str(map.counts[1])+","+str(map.counts[2])+","+str(map.counts[3])+","+str(map.counts[4])+","+str(map.counts[5])+","+str(map.counts[6])+","+str(map.counts[7])+","+str(map.counts[8])+","+str(map.counts[9])+","+str(map.counts[13])+","+str(world.visibility.numClusters)+","+str(world.visibility.clusterBytes)+","+str(world.visibility.numAreas)+","+str(boolInt(world.visibility.vised))+","+str(map.counts[6])+","+str(map.counts[5])+",patches="+str(patchCount))
  line="checksums="+u(cm.CM_Checksum(map));for index=0 to 16 line=line+","+u(cm.CM_LumpChecksum(map,index)) end for;print(line)
  mins=[-2.0,-8.0,-3.0];maxs=[5.0,9.0,1.0];box=cm.CM_TempBoxModel(world,mins,maxs,false);capsule=cm.CM_TempBoxModel(world,mins,maxs,true);print("temp="+str(box)+","+str(capsule));print("tempbounds="+six(cm.CM_ModelBounds(world,box)))
  cached=cm.CM_LoadMap(state,args[0],data,true);print("cached="+u(cached.checksum)+","+str(cm.CM_NumClusters(cached.world))+","+str(cm.CM_NumInlineModels(cached.world)))
  cm.CM_ClearMap(state);print("clear=0,0,0");return 0
end function
function boolInt(value) if value then return 1 end if;return 0 end function
