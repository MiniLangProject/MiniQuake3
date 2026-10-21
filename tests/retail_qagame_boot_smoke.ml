import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.qvm_scene_geometry as qvmSceneGeometry
import mq3.renderer.qvm_scene_materials as qvmSceneMaterials
import mq3.renderer.qvm_scene_batch as qvmSceneBatch
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then print("usage: retail_qagame_boot_smoke <pak0.pk3> <1.32b-qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"))
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  if len(state.context.errors)!=0 then print("Retail VM error after init: "+state.context.errors[0]);return error(7642,"retail qagame init error") end if
  worldHit=match.traceWorld(state.context,[216.0,1328.0,128.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],[216.0,1328.0,-1024.0],1023,0x2010001,false)
  if worldHit.fraction<=0.0 or worldHit.fraction>=1.0 or worldHit.entityNum!=1022 or worldHit.planeNormal[2]!=1.0 then return error(7642,"retail qagame host did not expose q3dm1 BSP collision") end if
  match.connectLocal(state,0)
  if len(state.context.errors)!=0 then print("Retail VM error after connect: "+state.context.errors[0]);return error(7642,"retail qagame connect error") end if
  initial=match.snapshot(state,0);if initial is error then return initial end if
  for frame=1 to 8
    command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,command);if thought is error then return thought end if
    match.runFrame(state,1000+frame*50);if len(state.context.errors)!=0 then print("Retail VM error after frame "+str(frame)+": "+state.context.errors[0]);return error(7642,"retail qagame frame error") end if
  end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  if snapshot.playerState.commandTime!=1400 or snapshot.playerState.origin==initial.playerState.origin then return error(7642,"retail qagame did not consume and simulate usercmd movement") end if
  if snapshot.playerState.clientNum!=0 or len(snapshot.entities)==0 then return error(7641,"retail qagame snapshot missing client state or entities") end if
  for each entity in snapshot.entities if entity.pos.trType<0 or entity.pos.trType>5 or entity.apos.trType<0 or entity.apos.trType>5 then print("Invalid snapshot trajectory entity="+str(entity.number)+" pos="+str(entity.pos.trType)+" apos="+str(entity.apos.trType));return error(7642,"invalid qagame entity trajectory") end if end for
  client=match.bootCgame(state);if client is error then return client end if
  if len(state.context.errors)!=0 then print("Retail VM error after cgame init: "+state.context.errors[0]);return error(7642,"retail cgame init error") end if
  observedSnapshot=match.snapshot(state,0);if observedSnapshot is error then return observedSnapshot end if
  predicted=qworld.userCommand(1450,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,predicted);if thought is error then return thought end if
  match.drawCgame(state,1450)
  if len(state.context.errors)!=0 then print("Retail VM error: "+state.context.errors[0]);return error(7642,"retail VM emitted an engine error") end if
  if state.context.cgameCollisionQueries==0 then return error(7642,"retail cgame prediction did not query collision") end if
  if state.context.cgameTagQueries==0 then return error(7642,"retail cgame did not interpolate registered MD3 tags") end if
  if state.context.latestRefdef==void or state.context.latestRefdef.width<=0 or state.context.latestRefdef.height<=0 or len(state.context.latestRefdef.viewaxis)!=3 then return error(7642,"retail cgame render-scene view was not decoded") end if
  if len(state.context.scene.entities)==0 or len(state.context.renderQueue.commands)==0 or len(state.context.soundCommands)==0 then return error(7642,"retail cgame did not submit scene, 2D or sound commands") end if
  if state.context.nativeDraw.suppressed==0 then return error(7642,"native cg_draw observer did not execute beside retail cgame") end if
  if not state.context.nativeParticles.retailActive or state.context.nativeParticles.capacity!=8192 then return error(7642,"native cg_particles observer is not attached to the retail match") end if
  if state.context.nativeServerCmds.serverCommandSequence==0 then return error(7642,"native cg_servercmds observer did not consume retail commands") end if
  if not state.context.nativeMain.initialized or state.context.nativeMain.time!=1450 then return error(7642,"native cg_main lifecycle observer did not follow retail cgame") end if
  if not state.context.nativeMarks.retailActive or state.context.nativeMarks.capacity!=256 or state.context.nativeMarks.time!=1400 then return error(7642,"native cg_marks observer is not attached to snapshots") end if
  models=0;sprites=0
  for each value in state.context.scene.entities
    decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if
    if decoded.reType==0 then models=models+1;if decoded.hModel<=0 or decoded.hModel>len(state.context.assets) then return error(7642,"retail refEntity model handle is not registered") end if
    else if decoded.reType==2 then sprites=sprites+1 end if
  end for
  listener=false;for each sound in state.context.soundCommands if sound.kind=="listener" then listener=true end if end for
  if not listener then return error(7642,"retail cgame did not submit a decoded listener") end if
  renderViewCount=len(state.context.renderViews);geometryTriangles=0;geometryModels=0;geometryInline=0;geometryUnsupported=0;expanded=[]
  for each view in state.context.renderViews
    geometry=qvmSceneGeometry.buildRecords(view.scene.entities,view.scene.polys,state.context.assetKinds,state.context.modelAssets,view.refdef,8192);if geometry is error then return geometry end if
    geometryTriangles=geometryTriangles+len(geometry.triangles);geometryModels=geometryModels+geometry.modelEntities;geometryInline=geometryInline+geometry.skippedInline;geometryUnsupported=geometryUnsupported+geometry.skippedUnsupported;expanded=expanded+geometry.triangles
  end for
  if renderViewCount==0 or geometryModels==0 or geometryTriangles==0 then return error(7642,"retail cgame views did not expand to MD3 geometry") end if
  materialCatalog=qvmSceneMaterials.build(archive,expanded,state.context.assets,state.context.assetKinds,512,512,state.context.shaderRemaps);if materialCatalog is error then return materialCatalog end if
  if materialCatalog.resolvedTriangles==0 or len(materialCatalog.textures)==0 then return error(7642,"retail cgame geometry did not resolve decoded textures") end if
  prepared=qvmSceneBatch.build(materialCatalog);if prepared is error then return prepared end if
  batchedSource=prepared.batch.sourceTriangles+prepared.depthHackBatch.sourceTriangles;batchedDrawable=prepared.batch.drawableTriangles+prepared.depthHackBatch.drawableTriangles;batchedEmitted=prepared.batch.emittedTriangles+prepared.depthHackBatch.emittedTriangles
  if batchedSource!=geometryTriangles or batchedDrawable!=geometryTriangles or batchedEmitted<geometryTriangles then return error(7642,"retail QVM geometry did not build complete world and depth-hack native batches") end if
  linked=0;for each ent in state.context.spatialScene.entities if ent.linked then linked=linked+1 end if end for
  if linked<len(snapshot.entities) or len(snapshot.entities)==0 then return error(7642,"PVS snapshot contains an invalid linked-entity selection") end if
  arenaFiles=match.uiFileList(state.context,"scripts",".arena");botFiles=match.uiFileList(state.context,"scripts",".bot");cfgFiles=match.uiFileList(state.context,"","cfg");playerDirs=match.uiFileList(state.context,"models/players","/")
  if len(cfgFiles)==0 or len(playerDirs)==0 then return error(7642,"retail UI PK3 file lists are incomplete") end if
  cgameAssets=len(state.context.assets);cgameDraw2D=len(state.context.renderQueue.commands);cgameSceneEntities=len(state.context.scene.entities);cgameViewWidth=state.context.latestRefdef.width;cgameViewHeight=state.context.latestRefdef.height
  ui=match.bootUi(state);if ui is error then return ui end if
  if not state.ui.uiStarted or state.ui.apiVersion!=4 then return error(7642,"retail q3_ui did not expose its pinned API") end if
  if len(state.context.errors)!=0 then print("Retail VM error after UI init: "+state.context.errors[0]);return error(7642,"retail UI init error") end if
  activated=match.setUiMenu(state,1);if activated is error then return activated end if
  refreshed=match.refreshUi(state,1500);if refreshed is error then return refreshed end if
  if len(state.context.errors)!=0 then print("Retail VM error after UI refresh: "+state.context.errors[0]);return error(7642,"retail UI refresh error") end if
  if state.context.uiFrames!=1 or (state.context.uiKeyCatcher&2)==0 then return error(7642,"retail UI did not own and refresh the menu") end if
  if len(state.context.assets)<=cgameAssets or len(state.context.renderQueue.commands)<=cgameDraw2D then return error(7642,"retail UI did not register media and draw the main menu") end if
  report="PASS: retail QVM match entities="+str(state.context.entityCount)+" stride="+str(state.context.entityStride)+" frames="+str(state.context.frames)
  report=report+" snapshotEntities="+str(len(snapshot.entities))+" spatialLinked="+str(linked)+" worldFraction="+str(worldHit.fraction)+" commandTime="+str(snapshot.playerState.commandTime)
  report=report+" predictionTraces="+str(state.context.cgameCollisionQueries)+" tagQueries="+str(state.context.cgameTagQueries)+" health="+str(snapshot.playerState.stats[0])
  report=report+" cgameAssets="+str(cgameAssets)+" uiAssets="+str(len(state.context.assets)-cgameAssets)+" addonArenas="+str(len(arenaFiles))+" addonBots="+str(len(botFiles))+" configs="+str(len(cfgFiles))+" playerDirs="+str(len(playerDirs))
  report=report+" cgameSceneEntities="+str(cgameSceneEntities)+" models="+str(models)+" sprites="+str(sprites)+" renderViews="+str(renderViewCount)+" geometryModels="+str(geometryModels)
  report=report+" inlineModels="+str(geometryInline)+" unsupportedEntities="+str(geometryUnsupported)+" triangles="+str(geometryTriangles)+" materials="+str(len(materialCatalog.materials))+" textures="+str(len(materialCatalog.textures))
  report=report+" texturedTriangles="+str(materialCatalog.resolvedTriangles)+" untexturedTriangles="+str(materialCatalog.unresolvedTriangles)+" emittedTriangles="+str(batchedEmitted)+" renderPasses="+str(len(prepared.batch.passes)+len(prepared.depthHackBatch.passes))+" skins="+str(len(materialCatalog.loadedSkins))
  report=report+" cgameView="+str(cgameViewWidth)+"x"+str(cgameViewHeight)+" lights="+str(len(state.context.scene.dlights))+" cgameDraw2D="+str(cgameDraw2D)
  report=report+" uiDraw2D="+str(len(state.context.renderQueue.commands)-cgameDraw2D)+" sounds="+str(len(state.context.soundCommands))+" nativeDrawSuppressed="+str(state.context.nativeDraw.suppressed)+" nativeServerSequence="+str(state.context.nativeServerCmds.serverCommandSequence)+" nativeMain="+str(state.context.nativeMain.initialized);print(report)
  match.shutdown(state);return 0
end function
