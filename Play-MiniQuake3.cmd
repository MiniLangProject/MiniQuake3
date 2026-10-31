@echo off
setlocal
cd /d "%~dp0"
set "MQ3_PAK=D:\Quake3\baseq3\pak0.pk3"
set "MQ3_QVMS=build\reference\qvms"
if not exist "%MQ3_PAK%" (
  echo Quake III assets were not found at:
  echo   %MQ3_PAK%
  echo.
  echo Edit MQ3_PAK in Play-MiniQuake3.cmd if your installation is elsewhere.
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
  python scripts\build_qvms.py || exit /b 7
)
if not exist "%MQ3_QVMS%\cgame.qvm" (
  python scripts\build_qvms.py || exit /b 8
)
if not exist "%MQ3_QVMS%\ui.qvm" (
  python scripts\build_qvms.py || exit /b 9
)
echo Starting MiniQuake3 with the original qagame, cgame and UI modules...
echo The first asset/QVM load can take a while. The game window opens afterwards.
echo Controls and menus use Quake III bindings; Escape opens the original in-game menu.
"build\MiniQuake3.exe" --play-qvm "%MQ3_PAK%" "maps/q3dm1.bsp" "%MQ3_QVMS%"
if errorlevel 1 pause
endlocal
