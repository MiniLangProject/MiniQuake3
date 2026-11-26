// SPDX-License-Identifier: GPL-2.0-or-later
// A per-scene reset would lose HUD views; a missing per-frame reset exhausted
// the original 1022-entity arena after a few seconds and hid every MD3 model.
import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as uiBridge
import mq3.client.ui_vm as uiVm
import mq3.client.keycodes as frameKeys
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.scene_queue as scene
import mq3.renderer.qvm_scene_geometry as frameGeometry
import mq3.renderer.qvm_scene_materials as frameMaterials
import mq3.renderer.qvm_scene_batch as frameBatches
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import std.ds.list as lists
import std.string as strings

struct MaterialSurface shaderHandle customSkin shaderName surfaceName end struct

function require(value,label) if not value then return error(7685,"Retail renderer frame: "+label) end if;return true end function
function modelCount(entities)
  count=0;for each entity in entities if entity.reType==0 then count=count+1 end if end for;return count
end function
function tap(state,key)
  down=uiVm.keyEvent(state.ui,key,true);if down is error then return down end if
  return uiVm.keyEvent(state.ui,key,false)
end function
function crashSkinLods(state,archive)
  base="models/players/crash/";surfaces=lists.List.withCapacity(20)
  for each part in ["head","upper","lower"]
    handle=match.registerModel(state.context,base+part+".md3");skin=match.registerSkin(state.context,base+part+"_default.skin")
    asset=frameGeometry.modelAt(state.context.assetKinds,state.context.modelAssets,handle)
    if not frameGeometry.isLodModel(asset) or len(asset[1])!=3 then return error(7685,"Crash model LODs unavailable: "+part) end if
    for each level in asset[1]
      for each surface in level.surfaces surfaces.add(MaterialSurface(0,skin,"",surface.name)) end for
    end for
  end for
  catalog=frameMaterials.build(archive,surfaces.toArray(),state.context.assets,state.context.assetKinds,512,512,state.context.shaderRemaps);if catalog is error then return catalog end if
  if catalog.resolvedTriangles!=surfaces.len() or catalog.unresolvedTriangles!=0 then return error(7685,"Crash must resolve original skins on every LOD surface") end if
  for each material in catalog.materials
    if not strings.startsWith(material.shaderName,base) then return error(7685,"Crash LOD must resolve its retail skin shader") end if
    image=try(pk3.read(archive,material.imageName));if image is error then return error(7685,"Crash skin shader must start with a verified retail image") end if
  end for
  return surfaces.len()
end function
function main(args)
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  initial=match.snapshotProductive(state,0);if initial is error then return initial end if
  payload=match.snapshotBytes(state.context,state.context.snapshotNumber)
  if not payload.found or slice(payload.data,12,32)!=initial.areaBits then return error(7685,"cgame snapshot ABI must carry the server area mask") end if
  cached=match.snapshotBytesScratch(state.context,state.context.snapshotNumber)
  if not cached.found or cached.data!=payload.data then return error(7685,"scratch and allocating snapshot ABI bytes differ") end if
  staleOffset=len(cached.data)-32;oldValue=cached.data[staleOffset];cached.data[staleOffset]=oldValue^255
  refreshed=match.snapshotBytesScratch(state.context,state.context.snapshotNumber)
  if nativeBytesPtr(refreshed.data)!=nativeBytesPtr(cached.data) or refreshed.data[staleOffset]!=oldValue or refreshed.data!=payload.data then return error(7685,"snapshot scratch must be reused and clear its unused entity tail") end if
  booted=match.bootCgame(state);if booted is error then return booted end if
  skinned=crashSkinLods(state,archive);if skinned is error then return skinned end if
  cumulative=0;firstViews=void;finalModels=0;maxFrameEntities=0
  for frame=1 to 120
    now=1000+frame*16
    submitted=match.submitUsercmd(state,0,qworld.userCommand(now,[0,0,0],0,2,0,0,0));if submitted is error then return submitted end if
    simulated=match.runFrame(state,now);if simulated is error then return simulated end if
    snap=match.snapshotProductive(state,0);if snap is error then return snap end if
    begun=match.beginRendererFrame(state);if begun is error then return begun end if
    checked=require(len(state.context.scene.entities)==0 and len(state.context.renderViews)==0 and state.context.renderQueue.used==0,"BeginFrame resets per-frame capacities before any subscene");if checked is error then return checked end if
    drawn=match.drawCgameProductiveInFrame(state,now);if drawn is error then return drawn end if
    entities=len(state.context.scene.entities);cumulative=cumulative+entities;if entities>maxFrameEntities then maxFrameEntities=entities end if
    checked=require(entities>0 and entities<scene.ENTITYNUM_WORLD and len(state.context.renderViews)==3,"world plus 3D-head and armor subscenes survive every frame");if checked is error then return checked end if
    finalModels=0;weapon=false;hudModels=0
    for each view in state.context.renderViews
      count=modelCount(view.scene.entities);finalModels=finalModels+count
      if (view.refdef.flags&1)!=0 then hudModels=hudModels+count end if
      for each entity in view.scene.entities if entity.reType==0 then decoded=scene.decodeEntity(entity);if decoded is error then return decoded end if;if (decoded.renderfx&8)!=0 then weapon=true end if end if end for
    end for
    checked=require(finalModels>=5 and hudModels>=2 and weapon,"viewmodel and 3D HUD model submissions remain present");if checked is error then return checked end if
    checked=require(len(state.context.renderQueue.commands)>0 and state.context.renderQueue.used>0 and state.context.renderQueue.used<262140,"HUD commands remain within a fresh frame budget");if checked is error then return checked end if
    if firstViews==void then firstViews=state.context.renderViews end if
    state.context.soundCommands=[]
  end for
  checked=require(cumulative>scene.ENTITYNUM_WORLD and modelCount(firstViews[0].scene.entities)>0 and len(firstViews)==3,"more than 1022 cumulative submissions and old view snapshots survive resets");if checked is error then return checked end if
  triangles=lists.List.withCapacity(2048);expandedModels=0
  for each view in state.context.renderViews
    expanded=frameGeometry.buildRecords(view.scene.entities,view.scene.polys,state.context.assetKinds,state.context.modelAssets,view.refdef,8192);if expanded is error then return expanded end if
    expandedModels=expandedModels+expanded.modelEntities;for each triangle in expanded.triangles triangles.add(triangle) end for
  end for
  catalog=frameMaterials.build(archive,triangles.toArray(),state.context.assets,state.context.assetKinds,512,512,state.context.shaderRemaps);if catalog is error then return catalog end if
  prepared=frameBatches.build(catalog);if prepared is error then return prepared end if
  checked=require(expandedModels>=5 and catalog.resolvedTriangles>500 and prepared.depthHackBatch.drawableTriangles>0 and prepared.batch.drawableTriangles>=117,"frame 120 still expands real textured weapon and HUD geometry");if checked is error then return checked end if
  // Refreshing the menu overlay must append after cgame, never begin a second
  // renderer frame and discard the main scene or 3D status icons.
  loaded=match.bootUi(state);if loaded is error then return loaded end if
  opened=match.setUiMenu(state,1);if opened is error then return opened end if
  mainViews=state.context.renderViews;beforeCommands=len(state.context.renderQueue.commands)
  overlay=match.refreshUi(state,3000);if overlay is error then return overlay end if
  checked=require(len(state.context.renderViews)>=3 and modelCount(state.context.renderViews[0].scene.entities)==modelCount(mainViews[0].scene.entities) and len(state.context.renderQueue.commands)>beforeCommands,"UI overlay appends without resetting cgame/HUD subscenes");if checked is error then return checked end if
  // Navigate the unchanged retail main menu: Setup -> Player Settings. This
  // UI-only path emits a rotating 3D player and has its own host BeginFrame.
  pressed=tap(state,frameKeys.K_DOWNARROW);if pressed is error then return pressed end if
  pressed=tap(state,frameKeys.K_DOWNARROW);if pressed is error then return pressed end if
  pressed=tap(state,frameKeys.K_ENTER);if pressed is error then return pressed end if
  pressed=tap(state,frameKeys.K_ENTER);if pressed is error then return pressed end if
  uiCumulative=0;uiModels=0
  for frame=1 to 240
    begun=uiBridge.resetFrameCommands(state);if begun is error then return begun end if
    refreshed=match.refreshUi(state,3000+frame*16);if refreshed is error then return refreshed end if
    uiModels=0;for each view in state.context.renderViews uiModels=uiModels+modelCount(view.scene.entities) end for
    checked=require(uiModels>=5 and len(state.context.scene.entities)<32 and len(state.context.renderQueue.commands)>0,"UI-only player preview retains fresh bounded scene and commands");if checked is error then return checked end if
    uiCumulative=uiCumulative+len(state.context.scene.entities);state.context.soundCommands=[]
  end for
  checked=require(uiCumulative>scene.ENTITYNUM_WORLD and len(state.context.errors)==0,"UI-only preview also exceeds cumulative arena capacity without disappearing");if checked is error then return checked end if
  print("PASS: Retail renderer lifecycle cgameFrames=120 cumulativeEntities="+str(cumulative)+" maxFrameEntities="+str(maxFrameEntities)+" finalModels="+str(finalModels)+" texturedTriangles="+str(catalog.resolvedTriangles)+" uiFrames=240 uiEntities="+str(uiCumulative)+" uiModels="+str(uiModels)+" texturedCrashLodSurfaces="+str(skinned))
  match.shutdown(state);return 0
end function
