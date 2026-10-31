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
echo Starting the original Quake III main menu...
echo qagame, cgame and map assets load only after you start a match.
echo Controls and menus use the original Quake III bindings.
"build\MiniQuake3.exe" --menu-qvm "%MQ3_PAK%" "maps/q3dm1.bsp" "%MQ3_QVMS%"
if errorlevel 1 pause
endlocal
