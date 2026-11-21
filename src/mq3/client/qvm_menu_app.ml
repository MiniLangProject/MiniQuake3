// SPDX-License-Identifier: GPL-2.0-or-later
// Disconnected original ui.qvm front end.  qagame/cgame and map resources are
// intentionally deferred until the UI emits its original "map <name>" command.
package mq3.client.qvm_menu_app

import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as localQvmUi
import mq3.client.original_ui_session as uiSession
import mq3.client.qvm_preview_app as gameApp
import mq3.client.desktop_session as desktopSession
import mq3.client.desktop_video as desktopVideo
import mq3.client.demo_playback as demos
import mq3.client.remote_play as remote
import mq3.format.mod_stack as mods
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.playable_materials as materials
import mq3.audio.qvm_sound_assets as qvmSoundAssets
import mq3.audio.qvm_playback as qvmPlayback
import mq3.platform.playable_window as window
import mq3.platform.playable_ambient as audioOutput
import mq3.qcommon.command_buffer as commands
import mq3.client.frame_timing as frameTiming
import std.time as time
import std.string as strings

const SOURCE_WIDTH=1280
const SOURCE_HEIGHT=720
const FIRST_TEXTURE_SLOT=1
const MAX_TEXTURE_SLOTS=300

function fail(message) return error(7688,"QVM menu: "+message) end function

function runMenu(archive,bootstrapMap,qvmRoot,session,openLevelSelect)
  state=match.bootUiShellSettings(archive,bootstrapMap,1000,qvmRoot,session.settings);if state is error then return state end if
  attached=desktopSession.attach(state,session);if attached is error then match.shutdown(state);return attached end if
  mode=desktopVideo.open(state.context.cvars);if mode is error then match.shutdown(state);return mode end if
  window.setTitle("MiniQuake3 | Main Menu")
  loading=window.showLoading(10,"Starting original Quake III menu");if loading is error then window.shutdown();match.shutdown(state);return loading end if
  if not loading then match.shutdown(state);return 0 end if
  booted=match.bootUi(state);if booted is error then window.shutdown();match.shutdown(state);return booted end if
  ui=localQvmUi.attachNative(state);if ui is error then window.shutdown();match.shutdown(state);return ui end if
  window.inputClear()
  openedMenu=uiSession.openMain(ui);if openedMenu is error then window.shutdown();match.shutdown(state);return openedMenu end if
  if openLevelSelect then match.executeClientConsole(state,"levelselect") end if
  reset=localQvmUi.resetFrameCommands(state);if reset is error then window.shutdown();match.shutdown(state);return reset end if
  renderCommands=uiSession.frameQueued(ui,1000,[]);if renderCommands is error then window.shutdown();match.shutdown(state);return renderCommands end if
  // Baseq3's actual menuback/menubacknologo definitions live in gfx.shader;
  // menu.shader on the retail CD is only an empty comment shell.  Index the
  // real source so the fullscreen menu uses logo512 instead of $defaultimage.
  menuScripts=void
  if archive.modArchive!=void then
    menuScripts=try(materials.buildScriptIndex(archive))
  else
    menuShader=try(pk3.read(archive,"scripts/gfx.shader"));if menuShader is error then window.shutdown();match.shutdown(state);return menuShader end if
    menuIndex=try(shaderIndex.build(decode(menuShader)));if menuIndex is error then window.shutdown();match.shutdown(state);return menuIndex end if
    menuScripts=[menuIndex,1]
  end if
  if menuScripts is error then window.shutdown();match.shutdown(state);return menuScripts end if
  catalog=qvm2d.buildIndexed(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,FIRST_TEXTURE_SLOT,MAX_TEXTURE_SLOTS,SOURCE_WIDTH,SOURCE_HEIGHT,mode.width,mode.height,state.context.shaderRemaps,menuScripts);if catalog is error then window.shutdown();match.shutdown(state);return catalog end if
  uploaded=qvm2d.upload(catalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  sounds=qvmSoundAssets.load(archive,state.context.assets,state.context.assetKinds);if sounds is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return sounds end if
  audio=qvmPlayback.create(sounds,22050,qvmSoundAssets.CHUNK_FRAMES);if audio is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return audio end if
  applied=qvmPlayback.consume(audio,state.context.soundCommands);if applied is error then qvm2d.release(catalog);window.shutdown();match.shutdown(state);return applied end if
  // The UI syscall array is a transient producer/consumer queue. Retaining
  // commands after the playback cursor consumed them made menu sessions grow
  // quadratically because every later append copied the full history.
  state.context.soundCommands=[];audio.commandCursor=0
  audioStarted=try(audioOutput.init(22050));if audioStarted is error then print "Warning: audio output unavailable; continuing without sound." end if
  window.setTitle("MiniQuake3 | Quake III Arena Main Menu")
  window.inputClear();state.context.console=[];uploadedTextures=len(catalog.textures);soundAssetCount=len(state.context.assets);now=1000;menuClockStart=window.milliseconds();lastSave=menuClockStart
  while not window.shouldClose() and session.action==""
    menuFrameStart=window.milliseconds();now=1000+frameTiming.elapsed(menuClockStart,menuFrameStart)
    window.poll();window.mouseDelta()
    nativeEvents=window.inputEvents(256);if nativeEvents is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return nativeEvents end if
    toggleFullscreen=window.takeVideoRestart()
    if session.videoRestart or toggleFullscreen then
      session.videoRestart=false;updatedMode=try(desktopVideo.apply(state.context.cvars,toggleFullscreen))
      if not (updatedMode is error) then mode=updatedMode else match.emitPrint(state.context,"Could not apply video settings.\n") end if
    end if
    reset=localQvmUi.resetFrameCommands(state);if reset is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return reset end if
    frame=uiSession.frameQueued(ui,now,nativeEvents);if frame is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return frame end if
    commands.execute(state.context.commandState);state.context.console=[]
    if session.action!="" then break end if
    if frameTiming.elapsed(lastSave,menuFrameStart)>=1000 then desktopSession.save(state,session);lastSave=menuFrameStart end if
    refreshed=qvm2d.refresh(catalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,SOURCE_WIDTH,SOURCE_HEIGHT,mode.width,mode.height);if refreshed is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return refreshed end if
    if len(catalog.textures)>uploadedTextures then uploaded=qvm2d.uploadFrom(catalog,uploadedTextures);if uploaded is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return uploaded end if;uploadedTextures=len(catalog.textures) end if
    if len(state.context.assets)!=soundAssetCount then synced=qvmSoundAssets.sync(sounds,state.context.assets,state.context.assetKinds);if synced is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return synced end if;soundAssetCount=len(state.context.assets) end if
    applied=qvmPlayback.consume(audio,state.context.soundCommands);if applied is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return applied end if
    state.context.soundCommands=[];audio.commandCursor=0
    window.beginFrame(0,0,0);drawn=qvm2d.draw(catalog,now);if drawn is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return drawn end if;window.present()
    if audioOutput.canSubmit() then chunk=qvmPlayback.renderFast(audio);if chunk is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return chunk end if;accepted=audioOutput.submit(chunk.samples);if accepted is error then audioOutput.shutdown();qvm2d.release(catalog);window.shutdown();match.shutdown(state);return accepted end if end if
    // Keep the disconnected UI at the original renderer's practical refresh
    // cadence instead of burning a CPU core and presenting partial frames.
    sleepMs=frameTiming.remaining(menuFrameStart,window.milliseconds(),16)
    if sleepMs>0 then time.sleep(sleepMs) end if
  end while
  desktopSession.capture(state,session)
  audioOutput.shutdown();qvm2d.release(catalog);match.shutdown(state)
  return 0
end function

function loadMap(archive,dataRoot,name)
  relative="maps/"+name+".bsp"
  if name=="" or match.desktopFilePath(dataRoot,relative)=="" then return fail("invalid map name") end if
  if strings.indexOf(name,"/",0)>=0 or strings.indexOf(name,"\\",0)>=0 then return fail("invalid map name") end if
  mapData=try(pk3.read(archive,relative));if mapData is error then return mapData end if
  return bsp.load(mapData)
end function

function switchGame(session,mounted)
  changed=not stringEqualsIgnoreCaseAscii(session.activeGame,mounted.game)
  session.activeGame=mounted.game;session.dataRoot=mounted.dataRoot
  if changed then
    session.settings=void;session.configLoaded=false;session.restartCommands=[]
  end if
  return void
end function

function waitForServer(live)
  while not window.shouldClose()
    now=window.milliseconds()
    ready=try(remote.pump(live,now,64));if ready is error or ready then return ready end if
    loading=try(window.showLoading(15,remote.status(live)));if loading is error or not loading then return loading end if
    events=try(window.inputEvents(256));if events is error then return events end if
    for each event in events
      if event.type==window.INPUT_KEY and event.value==27 and event.value2!=0 then return false end if
    end for
    time.sleep(10)
  end while
  return false
end function

function renderStream(baseArchive,archive,installRoot,qvmRoot,session,source)
  while not window.shouldClose()
    name=""
    if source.demo then name=source.transport.mapName end if
    mountedArchive=archive;activeArchive=archive;activeQvmRoot=qvmRoot
    if not source.demo then
      ready=try(waitForServer(source.transport));if ready is error or not ready then return ready end if
      name=remote.mapName(source.transport)
      game=remote.gameDirectory(source.transport)
      if not stringEqualsIgnoreCaseAscii(game,session.activeGame) then
        mounted=try(mods.mount(baseArchive,installRoot,game));if mounted is error then return mounted end if
        switchGame(session,mounted);mountedArchive=mounted.archive;activeArchive=mounted.archive
      end if
      approved=remote.approvedArchive(source.transport)
      if approved!=void then activeArchive=approved;activeQvmRoot="" end if
    end if
    selectedMap=try(loadMap(activeArchive,session.dataRoot,name));if selectedMap is error then return selectedMap end if
    result=try(gameApp.runDesktopStream(activeArchive,selectedMap,name,activeQvmRoot,session.settings,session,source));if result is error then return result end if
    if session.action!="stream-reload" then return result end if
    session.action=""
    archive=mountedArchive
  end while
  return false
end function

function runStream(baseArchive,archive,installRoot,qvmRoot,session,demoPlaying)
  now=window.milliseconds();name=session.target;transport=void
  previousGame=session.activeGame;previousRoot=session.dataRoot;previousSettings=session.settings;previousConfig=session.configLoaded
  if demoPlaying then
    transport=try(demos.open(session.dataRoot,archive,name,now))
  else
    userinfo="";if session.settings!=void then userinfo=session.settings.userinfos[0] end if
    transport=try(remote.create(name,userinfo,now))
  end if
  if transport is error then return transport end if
  if not demoPlaying then remote.setBasePackages(transport,installRoot+"/baseq3") end if
  source=gameApp.StreamSource(transport,transport.protocol,demoPlaying,name,"")
  result=try(renderStream(baseArchive,archive,installRoot,qvmRoot,session,source))
  if demoPlaying then demos.close(transport) else try(remote.close(transport,window.milliseconds())) end if
  if not stringEqualsIgnoreCaseAscii(previousGame,session.activeGame) then
    session.activeGame=previousGame;session.dataRoot=previousRoot;session.settings=previousSettings;session.configLoaded=previousConfig
  end if
  return result
end function

function run(archive,bootstrapMap,qvmRoot)
  if archive==void then return fail("archive is required") end if
  installRoot=window.executableDirectory()
  session=desktopSession.create(installRoot+"/baseq3")
  activeArchive=archive
  request="menu"
  while request!="" and request!="quit"
    session.action=""
    result=0
    if request=="map" or request=="restart" then
      selectedMap=try(loadMap(activeArchive,session.dataRoot,session.mapName))
      if selectedMap is error then result=selectedMap
      else result=try(gameApp.runDesktopMatch(activeArchive,selectedMap,session.mapName,qvmRoot,session.settings,session)) end if
      if result is error then
        session.notice=result.message
        print "MiniQuake3: "+session.notice
        request="menu";continue
      end if
    else if request=="connect" or request=="demo" then
      result=try(runStream(archive,activeArchive,installRoot,qvmRoot,session,request=="demo"))
      if result is error then
        session.notice=result.message
        print "MiniQuake3: "+session.notice
        window.shutdown();request="menu";continue
      end if
      if session.action=="" then session.action="menu" end if
    else if request=="mod" then
      mounted=try(mods.mount(archive,installRoot,session.requestedGame))
      if mounted is error then session.notice=mounted.message
      else switchGame(session,mounted);activeArchive=mounted.archive end if
      request="menu";continue
    else
      result=try(runMenu(activeArchive,bootstrapMap,qvmRoot,session,request=="levelselect"))
      if result is error then
        if session.activeGame=="" then window.shutdown();return result end if
        session.activeGame="";session.dataRoot=installRoot+"/baseq3";session.configLoaded=false;session.settings=void
        activeArchive=archive;session.notice=result.message
        request="menu";continue
      end if
    end if
    if window.shouldClose() then break end if
    request=session.action
  end while
  window.shutdown()
  return 0
end function
