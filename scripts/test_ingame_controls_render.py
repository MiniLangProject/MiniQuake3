"""Replay original ingame Controls through the complete productive WGL game loop.

The ignored module differs only by its package name, deterministic input events
and diagnostics. All simulation, asset preparation, upload and native rendering
statements come directly from qvm_preview_app.ml; no copied engine is checked in.
"""
from __future__ import annotations
import argparse
import json
import os
from pathlib import Path
import re
import subprocess

from build import build_file_lock, build_native, native_build_lock, minilang_inputs, valid_minilang_cache
from inventory import sha
from toolchain import ROOT, msvc_env, run

REPLAY_INPUT = """    // Test-only native replay: exact productive routing and render loop.
    replayMode=cvar.variableString(state.context.cvars,"mq3_regression_replay")
    replayEvents=[]
    if replayMode=="controls" then
      if frames==5 then replayEvents=[window.InputEvent(serverTime,window.INPUT_KEY,27,1),window.InputEvent(serverTime,window.INPUT_KEY,27,0)] end if
      if frames==10 or frames==15 then
        replayY=202;if frames==15 then replayY=170 end if
        replayEvents=[window.InputEvent(serverTime,window.INPUT_MOUSE,-10000,-10000),window.InputEvent(serverTime,window.INPUT_MOUSE,320,replayY),window.InputEvent(serverTime,window.INPUT_KEY,178,1),window.InputEvent(serverTime,window.INPUT_KEY,178,0)]
      end if
    else if replayMode=="moving" then
      if frames==0 then
        match.setKeyBinding(state,119,"+forward");match.setKeyBinding(state,178,"+attack");match.setKeyBinding(state,32,"+moveup")
        for replayWeaponIndex=1 to 9 match.setKeyBinding(state,48+replayWeaponIndex,"weapon "+str(replayWeaponIndex)) end for
      end if
      replayDx=3;if numeric.trunc32(frames/300)%2>=1 then replayDx=-3 end if
      replayEvents=[window.InputEvent(serverTime,window.INPUT_MOUSE,replayDx,0)]
      if frames%300==0 then replayEvents=replayEvents+[window.InputEvent(serverTime,window.INPUT_KEY,119,1),window.InputEvent(serverTime,window.INPUT_KEY,178,1)] end if
      if frames%300==150 then replayEvents=replayEvents+[window.InputEvent(serverTime,window.INPUT_KEY,119,0),window.InputEvent(serverTime,window.INPUT_KEY,178,0)] end if
      if frames%200==0 then replayEvents=replayEvents+[window.InputEvent(serverTime,window.INPUT_KEY,32,1)] end if
      if frames%200==10 then replayEvents=replayEvents+[window.InputEvent(serverTime,window.INPUT_KEY,32,0)] end if
      if frames%1000==0 then replayWeapon=49+(numeric.trunc32(frames/1000)%9);replayEvents=replayEvents+[window.InputEvent(serverTime,window.INPUT_KEY,replayWeapon,1),window.InputEvent(serverTime,window.INPUT_KEY,replayWeapon,0)] end if
    end if
    if len(replayEvents)>0 and replayMode=="controls" then print "REPLAY input frame="+str(frames)+" catcher="+str(match.keyCatcher(state)) end if
    for each replayEvent in replayEvents replayApplied=applyInputEvent(inputBridge,state,replayEvent);if replayApplied is error then return replayApplied end if end for
"""
REPLAY_PRESENT = """    if created!=void and (created.buttons&1)!=0 then replayAttackCommands=replayAttackCommands+1 end if
    replayPosition=state.context.latestSnapshot.playerState.origin
    if replayPosition!=replayLastPosition then replayPositionChanges=replayPositionChanges+1;replayLastPosition=[replayPosition[0],replayPosition[1],replayPosition[2]] end if
    replayAmmo=state.context.latestSnapshot.playerState.ammo[2];if replayAmmo<replayLastAmmo then replayAmmoDecreases=replayAmmoDecreases+1 end if;replayLastAmmo=replayAmmo
    if frames==16 or frames%500==0 then print "REPLAY presented frame="+str(frames)+" mode="+replayMode+" views="+str(len(preparedViews))+" textures="+str(len(qvmCatalog.textures))+" hudTextures="+str(len(hudCatalog.textures))+" heap_used="+str(heap_bytes_used())+" heap_committed="+str(heap_bytes_committed())+" simulation_ms="+str(simulationMs)+" geometry_ms="+str(geometryMs)+" render_ms="+str(renderMs) end if
    if replayMode=="controls" and frames==16 then
      if not uiFullscreen or len(preparedViews)<=firstUiView then return fail("Controls replay did not submit its original fullscreen3D preview") end if
      replayControl=preparedViews[len(preparedViews)-1];replayControlRect=replayControl.source.refdef
      if replayControl.geometry.modelEntities<1 or replayControlRect.y>=0 then return fail("Controls replay did not render original offscreen player preview") end if
      print "REPLAY Controls3D x="+str(replayControlRect.x)+" y="+str(replayControlRect.y)+" width="+str(replayControlRect.width)+" height="+str(replayControlRect.height)+" models="+str(replayControl.geometry.modelEntities)
    end if
"""

REPLAY_SLOW = """    if elapsedFrameMs>100 then
      print "REPLAY_SLOW frame="+str(frames)+" work="+str(elapsedFrameMs)+" game="+str(afterGame-startedAt)+" cg="+str(afterCgame-afterGame)+" ui="+str(afterSimulation-afterCgame)+" geometry="+str(afterGeometry-afterSimulation)+" hud="+str(afterHud-afterGeometry)+" upload="+str(afterBatch-afterHud)+" draw="+str(audioStartedAt-afterBatch)+" audio="+str(elapsedFrameMs-(audioStartedAt-startedAt))+" textures="+str(len(qvmCatalog.textures))+" hudTextures="+str(len(hudCatalog.textures))+" assets="+str(len(state.context.assets))
    end if
"""


def generate(out: Path) -> Path:
    app = ROOT / "src/mq3/client/qvm_preview_app.ml"
    source = app.read_text(encoding="utf-8")
    before = "    wasMenuActive=menuActive\n"
    after = "    window.present();renderMs=renderMs+window.milliseconds()-afterBatch;frames=frames+1\n"
    if source.count(before) != 1 or source.count(after) != 1:
        raise RuntimeError("Productive input/present boundaries changed; review replay insertion")
    text = source.replace("package mq3.client.qvm_preview_app", "package mq3.tests.controls_render_app")
    text = text.replace(before, REPLAY_INPUT + before).replace(after, after + REPLAY_PRESENT)
    slow = "    if elapsedFrameMs>maximumFrameMs then maximumFrameMs=elapsedFrameMs end if\n"
    if text.count(slow) != 1:
        raise RuntimeError("Productive work-time boundary changed; review slow-frame diagnostics")
    text = text.replace(slow, REPLAY_SLOW + slow)
    loop = "  while not window.shouldClose() and not quitRequested and (maxFrames<0 or frames<maxFrames)\n"
    assert text.count(loop) == 1
    text = text.replace(loop, "  replayPositionChanges=0;replayAttackCommands=0;replayAmmoDecreases=0;replayLastPosition=state.context.latestSnapshot.playerState.origin;replayLastAmmo=state.context.latestSnapshot.playerState.ammo[2]\n" + loop)
    finish = "  loopElapsedMs=window.milliseconds()-realStart\n"
    assert text.count(finish) == 1
    text = text.replace(finish, '  print "REPLAY movement positions="+str(replayPositionChanges)+" attacks="+str(replayAttackCommands)+" ammoDecreases="+str(replayAmmoDecreases)\n' + finish)
    target = out / "modules/mq3/tests/controls_render_app.ml"
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text, encoding="utf-8", newline="\n")
    return target


def archive_path(data_root: Path) -> Path:
    for relative in ("baseq3/pak0.pk3", "pak0.pk3", "Quake3/baseq3/pak0.pk3"):
        path = data_root / relative
        if path.is_file():
            return path.resolve()
    raise RuntimeError("Retail pak0.pk3 missing: " + str(data_root))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--mode", choices=("controls", "moving"), default="controls")
    parser.add_argument("--frames", type=int, default=120)
    parser.add_argument("--max-work-ms", type=float, help="Optional latency acceptance for a moving replay")
    args = parser.parse_args()
    if args.frames < 20:
        raise RuntimeError("Replay needs at least20 frames")
    out = ROOT / "build/reference/controls_render_replay"
    out.mkdir(parents=True, exist_ok=True)
    app = ROOT / "src/mq3/client/qvm_preview_app.ml"
    generated = generate(out)
    app_hash = sha(app)
    qvms = ROOT / "build/reference/qvms"
    if not all((qvms / name).is_file() for name in ("ui.qvm", "qagame.qvm", "cgame.qvm")):
        raise RuntimeError("Build unchanged original QVMs first")
    with native_build_lock(ROOT / "build"):
        build_native(ROOT / "build", msvc_env("x64"))
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    exe = ROOT / "build/controls_render_replay.exe"
    stamp = exe.with_suffix(".inputs.json")
    def build_inputs():
        inputs = minilang_inputs(ROOT / "tests/ingame_controls_render_probe.ml", compiler)
        inputs["generated_app"] = sha(generated)
        inputs["replay_generator"] = sha(Path(__file__))
        inputs["extra_include"] = "build/reference/controls_render_replay/modules"
        return inputs
    with build_file_lock(exe.with_suffix(".build.lock")):
        inputs = build_inputs()
        if not valid_minilang_cache(exe, stamp, inputs):
            run([compiler, ROOT / "tests/ingame_controls_render_probe.ml", exe,
                 "-I", out / "modules", "-I", ROOT / "src", "-I", ROOT / "artifacts/toolchain",
                 "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                 ROOT / "build", log=out / "compile.log", timeout=900)
            if build_inputs() != inputs:
                raise RuntimeError("Replay compiler sources changed during build; rerun on frozen source")
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(exe)}, indent=2) + "\n", encoding="utf-8")
    if sha(app) != app_hash:
        raise RuntimeError("Productive app changed during replay build; rerun on frozen source")
    archive = archive_path(args.data_root.resolve())
    env = os.environ.copy()
    env["MQ3_RENDERER"] = "hardware"
    result = subprocess.run([str(exe), str(archive), str(qvms), args.mode, str(args.frames)],
                            cwd=ROOT / "build", env=env, capture_output=True, text=True, timeout=900)
    log = result.stdout + result.stderr
    (out / (args.mode + ".log")).write_text(log, encoding="utf-8")
    passed = (result.returncode == 0 and "REPLAY presented frame=16" in log and
              re.search(r"QVM preview: .*frames=" + str(args.frames) + r"(?: |$)", log, re.MULTILINE) is not None
              and "Error occured:" not in log)
    maximum = re.search(r"workMax=(\S+)ms", log)
    work_max_ms = float(maximum[1]) if maximum else None
    latency_passed = args.max_work_ms is None or (work_max_ms is not None and work_max_ms <= args.max_work_ms)
    passed = passed and latency_passed
    if args.mode == "controls":
        passed = passed and "REPLAY Controls3D " in log
    if args.mode == "moving":
        movement = re.search(r"REPLAY movement positions=(\d+) attacks=(\d+) ammoDecreases=(\d+)", log)
        passed = passed and movement is not None and all(int(value) > 0 for value in movement.groups())
    report = {"passed": passed, "mode": args.mode, "frames": args.frames,
              "scope": "Exact productive game loop with test-only original event replay, real Retail original UI/Cgame/qagame, geometry/material preparation, native texture upload and hardware rendering.",
              "sources": {"src/mq3/client/qvm_preview_app.ml": app_hash,
                          "generated_app": sha(generated), "test_entry": sha(ROOT / "tests/ingame_controls_render_probe.ml"),
                          "executable": sha(exe), "playable_window.dll": sha(ROOT / "build/playable_window.dll"),
                          "compile_inputs": sha(stamp),
                          "pak0.pk3": sha(archive)},
              "returncode": result.returncode, "log_sha256": sha(out / (args.mode + ".log")),
              "latency_limit_ms": args.max_work_ms, "measured_work_max_ms": work_max_ms,
              "latency_passed": latency_passed}
    (out / (args.mode + ".json")).write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(log)
    if not passed:
        raise RuntimeError("Productive native replay failed; see " + str(out / (args.mode + ".log")))
    print("PASS: " + args.mode + " productive native render replay frames=" + str(args.frames))


if __name__ == "__main__":
    main()
