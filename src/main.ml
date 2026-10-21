// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.vm.interpreter as vm
import mq3.vm.runtime as vmRuntime
import mq3.vm.syscall_common as vmSyscallCommon
import mq3.vm.syscall_qagame as vmSyscallQagame
import mq3.vm.syscall_qagame_world as vmSyscallQagameWorld
import mq3.vm.syscall_cgame as vmSyscallCgame
import mq3.vm.syscall_ui as vmSyscallUi
import mq3.vm.syscall_ui_media as vmSyscallUiMedia
import mq3.platform.udp as platformUdp
import mq3.platform.desktop_frame_host as desktopFrameHost
import mq3.platform.input_events as inputEvents
import mq3.platform.engine_loop as engineLoop
import mq3.qcommon.command_buffer as commandBuffer
import mq3.qcommon.startup_commands as startupCommands
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as messageDelta
import mq3.qcommon.message_state_delta as messageStateDelta
import mq3.qcommon.netchan as netchan
import mq3.qcommon.net_transport as netTransport
import mq3.qcommon.network_pump as networkPump
import mq3.server.netchan as serverNetchan
import mq3.server.snapshot_delta as snapshotDelta
import mq3.server.reliable_commands as reliableCommands
import mq3.server.snapshot_build as snapshotBuild
import mq3.server.snapshot_runtime as snapshotRuntime
import mq3.server.pipeline as serverPipeline
import mq3.server.snapshot_send as snapshotSend
import mq3.server.download as serverDownload
import mq3.server.oob_connect as oobConnect
import mq3.server.connectionless as serverConnectionless
import mq3.server.packet_event as serverPacketEvent
import mq3.server.client_message as serverClientMessage
import mq3.server.client_command_dispatch as serverClientCommandDispatch
import mq3.server.client_command as serverClientCommand
import mq3.server.user_move as serverUserMove
import mq3.server.client_input as serverClientInput
import mq3.server.network_ingress as serverNetworkIngress
import mq3.server.client_pings as serverClientPings
import mq3.server.timeouts as serverTimeouts
import mq3.server.pause as serverPause
import mq3.server.snapshot_schedule as serverSnapshotSchedule
import mq3.server.frame as serverFrame
import mq3.server.game_vm as serverGameVm
import mq3.client.snapshot_parse as snapshotParse
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.download as clientDownload
import mq3.client.server_message as serverMessage
import mq3.client.gamestate as clientGamestate
import mq3.client.system_info as clientSystemInfo
import mq3.client.protocol_runtime as clientProtocolRuntime
import mq3.client.demo as clientDemo
import mq3.client.netchan as clientNetchan
import mq3.client.connectionless as clientConnectionless
import mq3.client.packet_event as clientPacketEvent
import mq3.client.network_ingress as clientNetworkIngress
import mq3.client.frame as clientMainFrame
import mq3.client.cgame_vm as clientCgameVm
import mq3.client.ui_vm as clientUiVm
import mq3.client.cgame_time as clientCgameTime
import mq3.client.playable_viewer as playableViewer
import mq3.client.playable_app as playableApp
import mq3.client.qvm_preview_app as qvmPreviewApp
import mq3.engine.local_qvm_match as localQvmMatch
import mq3.audio.wav as wav
import mq3.platform.playable_audio as playableAudio
import mq3.renderer.shader_index as rendererShaderIndex
import mq3.renderer.shader_parser as rendererShaderParser
import mq3.renderer.tga as rendererTga
import mq3.renderer.image_processing as rendererImageProcessing
import mq3.renderer.image_registry as rendererImageRegistry
import mq3.renderer.surface_polychain as rendererSurfacePolychain
import mq3.renderer.surface_mesh as rendererSurfaceMesh
import mq3.renderer.surface_md3 as rendererSurfaceMd3
import mq3.renderer.model_tags as rendererModelTags
import mq3.renderer.view_math as rendererViewMath
import mq3.renderer.surface_entities as rendererSurfaceEntities
import mq3.renderer.texture_state as rendererTextureState
import mq3.renderer.surface_grid as rendererSurfaceGrid
import mq3.renderer.command_queue as rendererCommandQueue
import mq3.renderer.scene_queue as rendererSceneQueue
import mq3.renderer.qvm_scene_geometry as qvmSceneGeometry
import mq3.renderer.qvm_scene_materials as qvmSceneMaterials
import mq3.renderer.qvm_scene_batch as qvmSceneBatch
import mq3.renderer.draw_surfs as rendererDrawSurfs
import mq3.renderer.bsp_preview as rendererBspPreview
import mq3.platform.playable_window as playableWindow
import mq3.audio.mixer_transfer as audioMixerTransfer
import mq3.audio.channel_paint as audioChannelPaint
import mq3.game.bot_team_helpers as botTeamHelpers
import mq3.game.bot_inventory_ai as botInventoryAi
import mq3.game.bot_navigation as botNavigation
import mq3.game.replay as replay
import mq3.game.bot_combat_ai as botCombatAi
import mq3.game.bot_fight_state as botFightState
import mq3.game.bot_seek_state as botSeekState
import std.fs as fs

function formatVector(vector)
  return "("+str(vector[0])+", "+str(vector[1])+", "+str(vector[2])+")"
end function

function printTrace(result)
  print "Fraction: "+str(result.trace.fraction)
  print "End: "+formatVector(result.endpos)
  print "Normal: "+formatVector(result.trace.normal)+" Distance: "+str(result.trace.distance)
  print "Contents: "+str(result.trace.contents)+" Surface flags: "+str(result.trace.surfaceFlags)
  print "Start solid: "+str(result.trace.startsolid)+" All solid: "+str(result.trace.allsolid)
  return void
end function

function main(args)
  if len(args)==4 and args[0]=="--play-qvm" then
    archive=pk3.open(args[1]);map=bsp.load(pk3.read(archive,args[2]));return qvmPreviewApp.run(archive,map,args[3])
  end if
  if len(args)==5 and args[0]=="--play-qvm-smoke" then
    archive=pk3.open(args[1]);map=bsp.load(pk3.read(archive,args[2]));return qvmPreviewApp.runLimited(archive,map,args[3],toNumber(args[4]))
  end if
  if len(args)==5 and args[0]=="--qvm-match" then
    archive=pk3.open(args[1]);map=bsp.load(pk3.read(archive,args[2]));frames=toNumber(args[3])
    if frames<=0 then return error(7650,"--qvm-match requires a positive frame count") end if
    state=localQvmMatch.bootWithQvms(archive,map,1000,args[4]);if state is error then return state end if
    if len(state.context.errors)>0 then return error(7651,state.context.errors[0]) end if
    joined=localQvmMatch.connectLocal(state,0);if joined is error then return joined end if;clientStarted=false
    for frame=1 to frames
      serverTime=1000+frame*50;command=vmSyscallQagameWorld.userCommand(serverTime,[0,0,0],0,2,0,0,0);thought=localQvmMatch.submitUsercmd(state,0,command);if thought is error then return thought end if
      advanced=localQvmMatch.runFrame(state,serverTime);if advanced is error then return advanced end if;snapshot=localQvmMatch.snapshot(state,0);if snapshot is error then return snapshot end if
      if not clientStarted then client=localQvmMatch.bootCgame(state);if client is error then return client end if;clientStarted=true end if
      drawn=localQvmMatch.drawCgame(state,serverTime);if drawn is error then return drawn end if
      if len(state.context.errors)>0 then return error(7651,state.context.errors[0]) end if
    end for
    triangleCount=0;geometryModels=0;cgameViewCount=len(state.context.renderViews);expanded=[]
    for each view in state.context.renderViews
      geometry=qvmSceneGeometry.buildRecords(view.scene.entities,view.scene.polys,state.context.assetKinds,state.context.modelAssets,view.refdef,8192);if geometry is error then return geometry end if
      triangleCount=triangleCount+len(geometry.triangles);geometryModels=geometryModels+geometry.modelEntities;expanded=expanded+geometry.triangles
    end for
    materialCatalog=qvmSceneMaterials.build(archive,expanded,state.context.assets,state.context.assetKinds,512,512,state.context.shaderRemaps);if materialCatalog is error then return materialCatalog end if
    prepared=qvmSceneBatch.build(materialCatalog);if prepared is error then return prepared end if
    ui=localQvmMatch.bootUi(state);if ui is error then return ui end if
    activated=localQvmMatch.setUiMenu(state,1);if activated is error then return activated end if
    refreshed=localQvmMatch.refreshUi(state,1000+frames*50);if refreshed is error then return refreshed end if
    if len(state.context.errors)>0 then return error(7651,state.context.errors[0]) end if
    print "Retail QVM local match: frames="+str(frames)+" entities="+str(len(state.context.latestSnapshot.entities))+" assets="+str(len(state.context.assets))+" views="+str(cgameViewCount)+" geometryModels="+str(geometryModels)+" triangles="+str(triangleCount)+" materials="+str(len(materialCatalog.materials))+" textures="+str(len(materialCatalog.textures))+" texturedTriangles="+str(materialCatalog.resolvedTriangles)+" emittedTriangles="+str(prepared.batch.emittedTriangles)+" renderPasses="+str(len(prepared.batch.passes))+" draw2D="+str(len(state.context.renderQueue.commands))+" sound="+str(len(state.context.soundCommands))+" ui="+str(state.ui.uiStarted)
    localQvmMatch.shutdown(state);return 0
  end if
  if len(args)==3 and args[0]=="--play" then
    opened=playableWindow.open(640,480);if opened is error then return opened end if
    loading=playableWindow.showLoading(2,"Opening retail archive");if loading is error then playableWindow.shutdown();return loading end if;if not loading then playableWindow.shutdown();return 0 end if
    archive=try(pk3.open(args[1]));if archive is error then playableWindow.shutdown();return archive end if
    loading=playableWindow.showLoading(7,"Reading "+args[2]);if loading is error then playableWindow.shutdown();return loading end if;if not loading then playableWindow.shutdown();return 0 end if
    mapBytes=try(pk3.read(archive,args[2]));if mapBytes is error then playableWindow.shutdown();return mapBytes end if
    loading=playableWindow.showLoading(11,"Parsing BSP map");if loading is error then playableWindow.shutdown();return loading end if;if not loading then playableWindow.shutdown();return 0 end if
    map=try(bsp.load(mapBytes));if map is error then playableWindow.shutdown();return map end if;sound=void
    loading=playableWindow.showLoading(14,"Loading game data");if loading is error then playableWindow.shutdown();return loading end if;if not loading then playableWindow.shutdown();return 0 end if
    soundBytes=try(pk3.read(archive,"sound/feedback/fight.wav"))
    if not (soundBytes is error) then
      parsedSound=try(wav.decode(soundBytes));if not (parsedSound is error) then sound=parsedSound end if
    end if
    result=try(playableApp.run(map,sound,archive));playableWindow.shutdown();if result is error then return result end if;return result
  end if
  if len(args)==2 and args[0]=="--play-bsp" then
    map=bsp.load(fs.readAllBytes(args[1]))
    return playableApp.run(map,void,void)
  end if
  if len(args)==3 and args[0]=="--play-smoke-bsp" then
    map=bsp.load(fs.readAllBytes(args[1]))
    return playableApp.smoke(map,toNumber(args[2]))
  end if
  if len(args)==4 and args[0]=="--play-smoke" then
    archive=pk3.open(args[1]);map=bsp.load(pk3.read(archive,args[2]))
    return playableApp.smokeAssets(map,toNumber(args[3]),archive)
  end if
  if len(args) == 6 and args[0] == "--inspect-visibility" then
    archive = pk3.open(args[1]); world = cm.loadBrushWorld(pk3.read(archive,args[2]))
    point = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    leaf = cm.pointLeafnum(world,point); state = world.visibility
    cluster = vis.leafCluster(state,leaf); area = vis.leafArea(state,leaf)
    row = vis.clusterPVS(state,cluster); visible = 0; index = 0
    while index < state.numClusters
      if (row[index>>3] & (1 << (index & 7))) != 0 then visible = visible+1 end if
      index = index+1
    end while
    connected = 0; index = 0
    while index < state.numAreas
      if vis.areasConnected(state,area,index) then connected = connected+1 end if
      index = index+1
    end while
    print "Leaf: "+str(leaf)+" Cluster: "+str(cluster)+" Area: "+str(area)
    print "Clusters: "+str(state.numClusters)+" PVS bytes: "+str(state.clusterBytes)
    print "Visible clusters: "+str(visible)+" Connected areas: "+str(connected)
    print "Areas: "+str(state.numAreas)+" Leaves: "+str(len(world.leaves))
    return 0
  end if
  if len(args) == 16 and args[0] == "--trace-model" then
    archive = pk3.open(args[1]); world = cm.load(pk3.read(archive,args[2]))
    model = toNumber(args[3])
    start = [n.f32(toNumber(args[4])),n.f32(toNumber(args[5])),n.f32(toNumber(args[6]))]
    finish = [n.f32(toNumber(args[7])),n.f32(toNumber(args[8])),n.f32(toNumber(args[9]))]
    origin = [n.f32(toNumber(args[10])),n.f32(toNumber(args[11])),n.f32(toNumber(args[12]))]
    angles = [n.f32(toNumber(args[13])),n.f32(toNumber(args[14])),n.f32(toNumber(args[15]))]
    result = cm.transformedTrace(world,start,finish,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],model,0x2010001,origin,angles,false,true)
    print "Transformed player box trace: "+args[2]+" model "+str(model)
    printTrace(result)
    return 0
  end if
  if len(args) == 7 and args[0] == "--pmove-map" then
    archive = pk3.open(args[1]); world = cm.load(pk3.read(archive,args[2]))
    origin = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    return replay.run(world,origin,fs.readAllText(args[6]))
  end if
  if len(args) == 2 and args[0] == "--inspect-pk3" then
    archive = pk3.open(args[1])
    print "PK3: " + archive.path
    print "Entries: " + str(len(archive.entries))
    for each entry in archive.entries
      print entry.name + " " + str(entry.size)
    end for
    return 0
  end if
  if len(args) == 3 and args[0] == "--inspect-map" then
    archive = pk3.open(args[1])
    map = bsp.load(pk3.read(archive, args[2]))
    print "BSP46: " + args[2]
    print "Entities: " + str(len(bsp.entities(map)))
    print "Models: " + str(map.counts[7]) + " Brushes: " + str(map.counts[8])
    print "Surfaces: " + str(map.counts[13]) + " Vertices: " + str(map.counts[10])
    return 0
  end if
  if len(args) == 3 and args[0] == "--vm-probe" then
    state = vm.load(fs.readAllBytes(args[1]), void)
    print "vmMain: " + str(vm.call(state, [toNumber(args[2])]))
    print "Instructions: " + str(state.steps)
    return 0
  end if
  if len(args) == 9 and args[0] == "--trace-map" then
    archive = pk3.open(args[1])
    world = cm.load(pk3.read(archive,args[2]))
    start = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    finish = [n.f32(toNumber(args[6])),n.f32(toNumber(args[7])),n.f32(toNumber(args[8]))]
    result = cm.boxTrace(world,start,finish,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],0,0x2010001,false)
    print "Player box trace: "+args[2]+" (brushes and curved surfaces)"
    printTrace(result)
    return 0
  end if
  print "MiniQuake3 development runtime"
  print "Reference: Quake III Arena 1.32b / protocol 68"
  print "Playable lightmapped preview available; full game port remains in progress."
  print "--play <archive.pk3> <maps/name.bsp>"
  print "--play-qvm <archive.pk3> <maps/name.bsp> <1.32b-qvm-directory>"
  print "--play-qvm-smoke <archive.pk3> <maps/name.bsp> <1.32b-qvm-directory> <frames>"
  print "--play-bsp <map.bsp>"
  print "--play-smoke-bsp <map.bsp> <frames>"
  print "--play-smoke <archive.pk3> <maps/name.bsp> <frames>"
  print "--qvm-match <archive.pk3> <maps/name.bsp> <frames> <1.32b-qvm-directory>"
  print "--inspect-pk3 <archive.pk3>"
  print "--inspect-map <archive.pk3> <maps/name.bsp>"
  print "--vm-probe <module.qvm> <command> (without engine syscalls)"
  print "--trace-map <archive.pk3> <maps/name.bsp> <sx> <sy> <sz> <ex> <ey> <ez>"
  print "--pmove-map <archive.pk3> <maps/name.bsp> <x> <y> <z> <commands.tsv>"
  print "--trace-model <archive.pk3> <maps/name.bsp> <model> <sx> <sy> <sz> <ex> <ey> <ez> <ox> <oy> <oz> <pitch> <yaw> <roll>"
  print "--inspect-visibility <archive.pk3> <maps/name.bsp> <x> <y> <z>"
  return 0
end function
