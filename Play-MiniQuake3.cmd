@echo off
setlocal
cd /d "%~dp0"
set "MQ3_PAK=build\baseq3\pak0.pk3"
set "MQ3_QVMS=build\qvms"
if not exist "%MQ3_PAK%" (
  echo MiniQuake3 needs the original Quake III pak files beside the EXE:
  echo   %~dp0build\baseq3\pak0.pk3
  echo.
  echo Copy pak0.pk3 and any installed pak1.pk3 ... pak8.pk3 into that folder.
  pause
  exit /b 2
)
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
