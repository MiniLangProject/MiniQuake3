// SPDX-License-Identifier: GPL-2.0-or-later
// Disconnected original ui.qvm front end.  qagame/cgame and map resources are
// intentionally deferred until the UI emits its original "map <name>" command.
package mq3.client.qvm_menu_app

import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as localQvmUi
import mq3.client.original_ui_session as uiSession
import mq3.client.qvm_preview_app as gameApp
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.shader_index as shaderIndex
import mq3.audio.qvm_sound_assets as qvmSoundAssets
import mq3.audio.qvm_playback as qvmPlayback
import mq3.platform.playable_window as window
import mq3.platform.playable_ambient as audioOutput
import std.string as strings
import std.time as time

const WIDTH=1280
const HEIGHT=720
const SOURCE_WIDTH=1280
const SOURCE_HEIGHT=720
const FIRST_TEXTURE_SLOT=1
const MAX_TEXTURE_SLOTS=300

struct NativeInput mouse end struct

function fail(message) return error(7688,"QVM menu: "+message) end function
function keyDown(context,key) return window.keyDown(key) end function
function mouseDelta(context) return context.mouse end function

function requestedMap(state,start)
  if state==void or state.context==void then return void end if
  if start<0 or start>=len(state.context.console) then return void end if
  for index=start to len(state.context.console)-1
    text=strings.toLowerAscii(state.context.console[index][1])
    text=strings.replaceAll(text,";"," ");text=strings.replaceAll(text,"\r"," ");text=strings.replaceAll(text,"\n"," ");text=strings.replaceAll(text,"\t"," ")
    fields=strings.split(text," ")
    for fieldIndex=0 to len(fields)-1
      if (fields[fieldIndex]=="map" or fields[fieldIndex]=="spmap" or fields[fieldIndex]=="devmap") and fieldIndex+1<len(fields) then
        mapName=strings.trim(fields[fieldIndex+1]);if mapName!="" then return mapName end if
      end if
    end for
  end for
  return void
end function

function run(archive,bootstrapMap,qvmRoot)
  if archive==void then return fail("archive is required") end if
  opened=window.open(WIDTH,HEIGHT);if opened is error then return opened end if
  window.setTitle("MiniQuake3 | Main Menu")
  loading=window.showLoading(10,"Starting original Quake III menu");if loading is error then window.shutdown();return loading end if
  state=match.bootUiShell(archive,bootstrapMap,1000,qvmRoot);if state is error then window.shutdown();return state end if
  booted=match.bootUi(state);if booted is error then window.shutdown();match.shutdown(state);return booted end if
  input=NativeInput([0,0]);ui=localQvmUi.attach(state,input,keyDown,mouseDelta);if ui is error then window.shutdown();match.shutdown(state);return ui end if
  openedMenu=uiSession.openMain(ui);if openedMenu is error then window.shutdown();match.shutdown(state);return openedMenu end if
  renderCommands=uiSession.frame(ui,1000);if renderCommands is error then window.shutdown();match.shutdown(state);return renderCommands end if
  // Resolve the original menu shader immediately while deferring the other
  // 26 map/model shader files until a match is selected.  This preserves the
  // menu artwork without rebuilding the full 583 KiB catalog at startup.
  menuShader=pk3.read(archive,"scripts/menu.shader");if menuShader is error then window.shutdown();match.shutdown(state);return menuShader end if
  menuIndex=shaderIndex.build(decode(menuShader));if menuIndex is error then window.shutdown();match.shutdown(state);return menuIndex end if
  catalog=qvm2d.buildIndexed(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,FIRST_TEXTURE_SLOT,MAX_TEXTURE_SLOTS,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT,state.context.shaderRemaps,[menuIndex,1]);if catalog is error then window.shutdown();match.shutdown(state);return catalog end if
  uploaded=qvm2d.upload(catalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  sounds=qvmSoundAssets.load(archive,state.context.assets,state.context.assetKinds);if sounds is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return sounds end if
  audio=qvmPlayback.create(sounds,22050,4096);if audio is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return audio end if
  applied=qvmPlayback.consume(audio,state.context.soundCommands);if applied is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return applied end if
  audioStarted=audioOutput.init(22050);if audioStarted is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return audioStarted end if
  window.setTitle("MiniQuake3 | Quake III Arena Main Menu")
  consoleAt=len(state.context.console);uploadedTextures=len(catalog.textures);soundAssetCount=len(state.context.assets);now=1000;mapName=void
  while not window.shouldClose() and mapName==void
    window.poll();input.mouse=window.mouseDelta();now=now+16
    reset=localQvmUi.resetFrameCommands(state);if reset is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return reset end if
    frame=uiSession.frame(ui,now);if frame is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return frame end if
    refreshed=qvm2d.refresh(catalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if refreshed is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return refreshed end if
    if len(catalog.textures)>uploadedTextures then uploaded=qvm2d.upload(catalog);if uploaded is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return uploaded end if;uploadedTextures=len(catalog.textures) end if
    if len(state.context.assets)!=soundAssetCount then synced=qvmSoundAssets.sync(sounds,state.context.assets,state.context.assetKinds);if synced is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return synced end if;soundAssetCount=len(state.context.assets) end if
    applied=qvmPlayback.consume(audio,state.context.soundCommands);if applied is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return applied end if
    window.beginFrame(0,0,0);drawn=qvm2d.draw(catalog,now);if drawn is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return drawn end if;window.present()
    if audioOutput.canSubmit() then chunk=qvmPlayback.render(audio);if chunk is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return chunk end if;accepted=audioOutput.submit(chunk.samples);if accepted is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return accepted end if end if
    mapName=requestedMap(state,consoleAt);consoleAt=len(state.context.console)
    // Keep the disconnected UI at the original renderer's practical refresh
    // cadence instead of burning a CPU core and presenting partial frames.
    time.sleep(16)
  end while
  settings=match.captureUserSettings(state)
  audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state)
  if mapName==void then return 0 end if
  mapData=pk3.read(archive,"maps/"+mapName+".bsp");if mapData is error then return mapData end if
  selectedMap=bsp.load(mapData);if selectedMap is error then return selectedMap end if
  return gameApp.runWithSettingsNamed(archive,selectedMap,mapName,qvmRoot,settings)
end function
