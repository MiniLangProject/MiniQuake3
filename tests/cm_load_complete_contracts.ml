import mq3.collision.world as cm
import mq3.format.bsp as bsp
import mq3.qcommon.md4 as md4
import mq3.compat.numeric as n
import std.fs as fs

function req(ok,label) if not ok then return error(7751,"cm_load: "+label) end if;return 1 end function
function copy(data) return slice(data,0,len(data)) end function
function main(args)
  if len(args)!=1 then return error(7751,"usage: cm_load_complete_contracts <map.bsp>") end if
  count=0;data=fs.readAllBytes(args[0]);map=bsp.load(data);state=cm.mapState(true);loaded=cm.CM_LoadMap(state,"maps/q3dm1.bsp",data,false);world=loaded.world
  count=count+req(loaded.checksum==md4.blockChecksum(data) and state.checksum==loaded.checksum and state.lastChecksum==loaded.checksum,"whole-file checksum")
  count=count+req(cm.CM_Checksum(map)!=0 and cm.CM_LumpChecksum(map,0)==md4.blockChecksum(slice(data,map.offsets[0],map.lengths[0])),"metadata/lump checksums")
  count=count+req(len(world.shaders)==map.counts[1] and world.shaders[0].name!="","shader loading")
  count=count+req(len(world.nodes)==map.counts[3] and len(world.leaves)==map.counts[4] and len(world.brushes)==map.counts[8],"node/leaf/brush loading")
  count=count+req(len(world.models)==map.counts[7] and len(world.surfaces)==map.counts[13] and len(world.models[0].brushes)==0 and len(world.models[0].surfaces)==0,"model/surface loading")
  count=count+req(len(bytes(cm.CM_EntityString(world)))==map.lengths[0],"entity string retained byte-for-byte")
  count=count+req(cm.CM_NumClusters(world)==world.visibility.numClusters and cm.CM_NumInlineModels(world)==map.counts[7],"count queries")
  count=count+req(cm.CM_LeafCluster(world,0)==world.visibility.clusters[0] and cm.CM_LeafArea(world,0)==world.visibility.areas[0],"leaf queries")
  count=count+req(try(cm.CM_LeafCluster(world,-1)) is error and try(cm.CM_LeafArea(world,len(world.leaves))) is error,"leaf range validation")
  bounds=cm.CM_ModelBounds(world,0);saved=bounds[0][0];bounds[0][0]=999.0;count=count+req(cm.CM_ModelBounds(world,0)[0][0]==saved,"model bounds copy")
  count=count+req(cm.CM_InlineModel(world,len(world.models)-1)==len(world.models)-1 and try(cm.CM_InlineModel(world,len(world.models))) is error,"inline model range")
  count=count+req(cm.CM_ClipHandleToModel(world,0)==world.models[0] and cm.CM_ClipHandleToModel(world,255)==world.temporary and try(cm.CM_ClipHandleToModel(world,254)) is error,"clip handle resolution")
  box=cm.CM_TempBoxModel(world,[-2.0,-8.0,-3.0],[5.0,9.0,1.0],false);capsule=cm.CM_TempBoxModel(world,[-2.0,-8.0,-3.0],[5.0,9.0,1.0],true);count=count+req(box==255 and capsule==254 and cm.CM_ModelBounds(world,box)==[[-2.0,-8.0,-3.0],[5.0,9.0,1.0]],"temporary box/capsule handles")
  count=count+req(cm.SetPlaneSignbits([-1.0,2.0,-3.0])==5 and cm.CM_BoundBrush(world.brushes[0].planes)==[world.brushes[0].mins,world.brushes[0].maxs],"plane bits and brush bounds")
  cached=cm.CM_LoadMap(state,"maps/q3dm1.bsp",void,true);count=count+req(cached.cached and cached.world==world and cached.checksum==loaded.checksum,"client cache hit avoids reload")
  last=state.lastChecksum;cm.CM_ClearMap(state);count=count+req(state.world==void and state.name=="" and state.checksum==0 and state.lastChecksum==last,"clear preserves static last checksum")
  count=count+req(try(cm.CM_LoadMap(state,"",data,false)) is error and try(cm.CM_LoadMap(state,"maps/x.bsp",void,false)) is error,"map arguments validated")
  bad=copy(data);n.writeU32(bad,12+1*8,0);count=count+req(try(cm.load(bad)) is error,"shader lump cannot be empty")
  bad=copy(data);n.writeU32(bad,12+2*8,map.lengths[2]-1);count=count+req(try(cm.load(bad)) is error,"plane lump stride validation")
  count=count+req(try(cm.CM_LumpChecksum(map,-1)) is error and try(cm.CM_LumpChecksum(map,17)) is error,"checksum lump range")
  print("PASS: "+str(count)+" cm_load complete contracts");return 0
end function
