"""Render the original map loading layout on the Windows Retail path."""
import argparse
import io
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time

from PIL import Image, ImageChops, ImageStat
from toolchain import ROOT


def link_asset(source, target):
    try:
        os.link(source, target)
    except OSError:
        shutil.copyfile(source, target)


def loading_frame_matches(rgb, reference):
    if rgb.size != reference.size:
        return False
    background = (0, 240, 640, 480)
    delta = ImageChops.difference(rgb.crop(background).resize((32, 12)),
                                  reference.crop(background).resize((32, 12)))
    if max(ImageStat.Stat(delta).mean) > 10:
        return False
    # Allow small differences in GPU texture filtering. Require overlapping
    # white lettering, including the dynamic map name, type and limit.
    for y in (16, 64, 96, 148, 175, 202):
        box = (65, y, 575, y + 20)
        expected = reference.crop(box).convert("L").point(lambda p: 255 if p > 220 else 0)
        observed = rgb.crop(box).convert("L").point(lambda p: 255 if p > 220 else 0)
        union = ImageChops.lighter(expected, observed).histogram()[255]
        intersection = ImageChops.darker(expected, observed).histogram()[255]
        if union == 0 or intersection < 0.85 * union:
            return False
    return True


def desktop_transition(binary, archive, folder, reference):
    from test_default_exe_startup import window_title

    # Use the original desktop spmap command while keeping the player's config
    # and savegames out of the test. Only link files that the game reads.
    with tempfile.TemporaryDirectory(dir=folder) as temp:
        install = Path(temp)
        base = install / "baseq3"
        base.mkdir()
        link_asset(archive, base / archive.name)
        shutil.copytree(ROOT / "build/qvms", install / "qvms")
        for dll in (ROOT / "build").glob("*.dll"):
            link_asset(dll, install / dll.name)
        game = install / "MiniQuake3.exe"
        link_asset(binary, game)
        (base / "autoexec.cfg").write_text(
            "set r_fullscreen 0\nset r_mode 3\nset fraglimit 10\nspmap q3dm1\n",
            encoding="ascii")
        capture = install / "frame.bmp"
        env = dict(os.environ, MQ3_RENDERER="hardware", MQ3_CAPTURE=str(capture))
        matched = played = False
        last_frame = None
        with (folder / "desktop.log").open("w", encoding="utf-8") as log:
            process = subprocess.Popen([game], cwd=install, env=env,
                                       stdout=log, stderr=subprocess.STDOUT)
            try:
                deadline = time.monotonic() + 90
                while process.poll() is None and time.monotonic() < deadline:
                    title = window_title(process.pid)
                    if title.endswith("Original QVM q3dm1"):
                        played = True
                        break
                    if title.endswith("Loading q3dm1") and not matched:
                        try:
                            with Image.open(io.BytesIO(capture.read_bytes())) as frame:
                                rgb = frame.convert("RGB")
                        except (OSError, ValueError):
                            time.sleep(0.02)
                            continue
                        last_frame = rgb
                        # Match the actual framebuffer against both the Retail
                        # background and all six independently verified rows.
                        if loading_frame_matches(rgb, reference):
                            rgb.save(folder / "desktop-q3dm1-loading.png")
                            matched = True
                    time.sleep(0.02)
            finally:
                if process.poll() is None:
                    process.terminate()
                process.wait(timeout=10)
        if not matched or not played:
            if last_frame is not None:
                last_frame.save(folder / "desktop-observed.png")
            raise RuntimeError(f"Desktop spmap transition: matching frame={matched}, entered q3dm1={played}; see {folder / 'desktop.log'}")
        print("PASS: Windows EXE displayed the matching loading frame and entered q3dm1")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--desktop-exe", type=Path, help="also exercise the packaged Windows game")
    args = parser.parse_args()
    archive = args.data_root.resolve() / "baseq3" / "pak0.pk3"
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/map_loading_retail_probe.ml", "--output", "map_loading_retail_probe.exe"],
                   cwd=ROOT, check=True)
    folder = ROOT / "build/reference/map_loading"
    folder.mkdir(parents=True, exist_ok=True)
    early = None
    for name, arguments in (("q3dm1-loading", []), ("q3dm1-loading-icons", ["icons"])):
        target = folder / (name + ".bmp")
        target.unlink(missing_ok=True)
        env = dict(os.environ, MQ3_RENDERER="hardware", MQ3_CAPTURE=str(target))
        subprocess.run([ROOT / "build/map_loading_retail_probe.exe", archive, *arguments],
                       env=env, cwd=ROOT / "build", check=True, timeout=90)
        with Image.open(target) as image:
            rgb = image.convert("RGB")
        if rgb.size != (640, 480) or len(rgb.getcolors(640 * 480)) < 500:
            raise RuntimeError(f"Missing Retail levelshot in {target}")
        # Check actual glyph pixels at every original row, including the map
        # message and rules, independently of the recorded DrawStretchPics.
        for y in (16, 64, 96, 148, 175, 202):
            pixels = rgb.crop((150, y, 490, y + 20))
            if sum(count for count, pixel in pixels.getcolors(340 * 20) if min(pixel) > 220) < 75:
                raise RuntimeError(f"Missing visible text row {y} in {target}")
        if early is None:
            early = rgb
        else:
            for box in ((16, 284, 80, 348), (94, 284, 158, 348),
                        (16, 360, 48, 392), (64, 360, 96, 392)):
                difference = ImageChops.difference(early.crop(box), rgb.crop(box))
                if difference.convert("L").point(lambda value: 255 if value > 16 else 0).histogram()[255] < 100:
                    raise RuntimeError(f"Loading icon did not appear at {box}")
        rgb.save(target.with_suffix(".png"))
    if args.desktop_exe:
        desktop_transition(args.desktop_exe.resolve(), archive, folder, early)
    print("PASS: hardware loading frames with Retail map, font, detail and icons")


if __name__ == "__main__":
    main()
