@echo off
setlocal
cd /d "%~dp0"
set "MQ3_QVMS=build\qvms"
if not exist "build\MiniQuake3.exe" (
  python scripts\build.py || exit /b 3
)
if not exist "build\playable_window.dll" (
  python scripts\build.py || exit /b 4
)
if not exist "build\playable_audio.dll" (
  python scripts\build.py || exit /b 5
)
if not exist "build\playable_ambient.dll" (
  python scripts\build.py || exit /b 6
)
if not exist "%MQ3_QVMS%\qagame.qvm" (
  python scripts\build.py || exit /b 7
)
if not exist "%MQ3_QVMS%\cgame.qvm" (
  python scripts\build.py || exit /b 8
)
if not exist "%MQ3_QVMS%\ui.qvm" (
  python scripts\build.py || exit /b 9
)
start "" "build\MiniQuake3.exe"
endlocal
