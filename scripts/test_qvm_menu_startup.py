#!/usr/bin/env python3
"""Guard the fast, disconnected original-ui startup architecture."""

from toolchain import ROOT


def require(text: str, fragment: str, description: str) -> None:
    if fragment not in text:
        raise RuntimeError(f"missing {description}: {fragment}")


def main() -> int:
    menu = (ROOT / "src/mq3/client/qvm_menu_app.ml").read_text(encoding="utf-8")
    match = (ROOT / "src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    desktop = (ROOT / "src/mq3/client/desktop_session.ml").read_text(encoding="utf-8")
    main_source = (ROOT / "src/main.ml").read_text(encoding="utf-8")

    require(main_source, 'args[0]=="--menu-qvm"', "menu-only command-line entry")
    require(menu, "state=match.bootUiShellSettings", "disconnected UI shell boot")
    require(menu, "booted=match.bootUi(state)", "original ui.qvm boot")
    require(menu, 'pk3.read(archive,"scripts/gfx.shader")', "retail menuback shader source")
    require(menu, "window.inputClear()", "loading input reset")
    require(menu, "nativeEvents=window.inputEvents(256)", "timestamped menu input consumption")
    require(menu, "uiSession.frameQueued(ui,now,nativeEvents)", "ordered native menu input")
    require(menu, "desktopSession.capture(state,session)", "menu settings handoff")
    match_start = "result=try(loadLocalMatch(activeArchive,session,qvmRoot))"
    require(menu, match_start, "deferred local match start")
    require(menu, "gameApp.runMatchWithLoading(archive,selectedMap,session.mapName", "match loading screen handoff")
    require(menu, "frameTiming.remaining(menuFrameStart,window.milliseconds(),16)", "bounded menu refresh cadence")
    require(menu, "state.context.soundCommands=[];audio.commandCursor=0", "consumed menu sound queue compaction")
    require(desktop, '["spmap",mapCommand]', "single-player map handoff")
    require(desktop, '["quit",quitCommand]', "original UI quit-command handoff")
    require(desktop, "session.restartCommands=[state.context.commandState.buffer]", "commands after map survive the handoff")
    require(desktop, 'cvar.set(registry,"g_gametype","2")', "single-player game type reaches qagame")
    require(menu, "state.context.console=[]", "consumed host command queue compaction")
    require(match, "if not startGame then return Boot(void,machineRuntime,context,void,void) end if", "pre-game return before qagame/cgame")
    require(match, "bootConfiguredNamedMode(archive,map,now,qvmRoot,false,\"q3dm1\",false)", "UI shell without game startup")

    if menu.index("state=match.bootUiShellSettings") > menu.index(match_start):
        raise RuntimeError("full match is started before the disconnected original UI")
    print("PASS: original ui.qvm starts disconnected, receives ordered native input and defers qagame/cgame/map loading")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
