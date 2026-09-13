import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import std.string as strings

function main(args)
  if len(args)!=2 then print("usage: qvm_2d_retail_probe <pak0.pk3> <qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  for frame=1 to 8
    serverTime=1000+frame*50;command=qworld.userCommand(serverTime,[0,0,0],0,2,127,0,0)
    submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
    advanced=match.runFrame(state,serverTime);if advanced is error then return advanced end if
  end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  client=match.bootCgame(state);if client is error then return client end if
  drawn=match.drawCgame(state,1450);if drawn is error then return drawn end if
  cgame= qvm2d.extract(state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,1280.0,720.0,640.0,480.0);if cgame is error then return cgame end if
  if len(cgame.quads)==0 then return error(7685,"retail cgame submitted no 2D quads") end if
  ui=match.bootUi(state);if ui is error then return ui end if
  activated=match.setUiMenu(state,1);if activated is error then return activated end if
  refreshed=match.refreshUi(state,1500);if refreshed is error then return refreshed end if
  if len(state.context.errors)>0 then return error(7685,state.context.errors[0]) end if
  extracted=qvm2d.extract(state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,1280.0,720.0,640.0,480.0);if extracted is error then return extracted end if
  catalog=qvm2d.build(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,0,512,1280.0,720.0,640.0,480.0);if catalog is error then return catalog end if
  if len(extracted.quads)<=len(cgame.quads) then return error(7685,"retail UI submitted no additional 2D quads") end if
  if catalog.sourceQuads!=len(extracted.quads) or catalog.resolvedQuads!=catalog.sourceQuads or catalog.unresolvedQuads!=0 then return error(7685,"retail QVM 2D shader resolution incomplete") end if
  if len(catalog.materials)==0 or len(catalog.textures)==0 or len(catalog.runs)==0 or catalog.emittedTriangles<catalog.sourceQuads*2 then return error(7685,"retail QVM 2D native batches incomplete") end if
  cachedMaterials=len(catalog.materials);cachedTextures=len(catalog.textures);refreshed=qvm2d.refresh(catalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,1280.0,720.0,640.0,480.0);if refreshed is error then return refreshed end if
  if refreshed!=catalog or len(catalog.materials)!=cachedMaterials or len(catalog.textures)!=cachedTextures or catalog.resolvedQuads!=catalog.sourceQuads or catalog.emittedTriangles<catalog.sourceQuads*2 then return error(7685,"retail frame refresh did not retain decoded assets and rebuild batches") end if
  retailTextures=0;whiteTextures=0;defaultTextures=0;noMipTextures=0
  for each texture in catalog.textures
    if strings.startsWith(texture.imageName,"$white") then whiteTextures=whiteTextures+1 else if strings.startsWith(texture.imageName,"$default") then defaultTextures=defaultTextures+1 else retailTextures=retailTextures+1 end if
    if texture.noMipMaps then noMipTextures=noMipTextures+1 end if
  end for
  if retailTextures==0 or whiteTextures==0 or noMipTextures==0 then return error(7685,"retail images, white shader or no-mip policy missing") end if
  menuBackdrop=false
  for each quad in extracted.quads if quad.shaderName=="menuback" and quad.positions[0].x==80.0 and quad.positions[2].x>559.0 then menuBackdrop=true end if end for
  if not menuBackdrop then return error(7685,"widescreen UI coordinates were not scaled to native output") end if
  print("PASS: retail QVM 2D cgameQuads="+str(len(cgame.quads))+" uiQuads="+str(len(extracted.quads)-len(cgame.quads))+" materials="+str(len(catalog.materials))+" textures="+str(len(catalog.textures))+" retailTextures="+str(retailTextures)+" whiteTextures="+str(whiteTextures)+" defaultTextures="+str(defaultTextures)+" noMipTextures="+str(noMipTextures)+" runs="+str(len(catalog.runs))+" triangles="+str(catalog.emittedTriangles))
  match.shutdown(state);return 0
end function
