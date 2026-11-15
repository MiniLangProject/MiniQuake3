#!/usr/bin/env python3
"""Guard the fast, disconnected original-ui startup architecture."""

from toolchain import ROOT


def require(text: str, fragment: str, description: str) -> None:
    if fragment not in text:
        raise RuntimeError(f"missing {description}: {fragment}")


def main() -> int:
    menu = (ROOT / "src/mq3/client/qvm_menu_app.ml").read_text(encoding="utf-8")
    match = (ROOT / "src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    main_source = (ROOT / "src/main.ml").read_text(encoding="utf-8")

    require(main_source, 'args[0]=="--menu-qvm"', "menu-only command-line entry")
    require(menu, "state=match.bootUiShell", "disconnected UI shell boot")
    require(menu, "booted=match.bootUi(state)", "original ui.qvm boot")
    require(menu, "mapName=requestedMap", "original menu map-command handoff")
    require(menu, 'pk3.read(archive,"scripts/gfx.shader")', "retail menuback shader source")
    require(menu, "quitRequested=requestedQuit(state,0)", "original UI quit-command handoff")
    require(menu, "window.inputClear()", "loading input reset")
    require(menu, "nativeEvents=window.inputEvents(256)", "timestamped menu input consumption")
    require(menu, "inputLatch.observe(input.keys,event.type,event.value,event.value2)", "one-frame input edge latch")
    require(menu, "settings=match.captureUserSettings(state)", "menu settings handoff")
    require(menu, "return gameApp.runWithSettingsNamed(archive,selectedMap,mapName,qvmRoot,settings)", "deferred named full match start")
    require(menu, "time.sleep(16)", "bounded menu refresh cadence")
    require(menu, "state.context.soundCommands=[];audio.commandCursor=0", "consumed menu sound queue compaction")
    require(menu, "mapName=requestedMap(state,0);singlePlayer=requestedSinglePlayer(state,0);quitRequested=requestedQuit(state,0)", "single-player map handoff")
    require(menu, "settings.pendingBotCommands=menuBotCommands", "arena bot commands survive menu queue compaction")
    require(menu, 'saved[1]="2"', "single-player game type reaches qagame")
    require(menu, "state.context.console=[]", "consumed host command queue compaction")
    require(match, "if not startGame then return Boot(void,machineRuntime,context,void,void) end if", "pre-game return before qagame/cgame")
    require(match, "bootConfiguredNamedMode(archive,map,now,qvmRoot,false,\"q3dm1\",false)", "UI shell without game startup")

    if menu.index("state=match.bootUiShell") > menu.index("return gameApp.runWithSettingsNamed(archive,selectedMap,mapName,qvmRoot,settings)"):
        raise RuntimeError("full match is started before the disconnected original UI")
    print("PASS: original ui.qvm starts disconnected, latches input edges and defers qagame/cgame/map loading")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
