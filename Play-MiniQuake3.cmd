@echo off
setlocal
cd /d "%~dp0"
set "MQ3_PAK=D:\Quake3\baseq3\pak0.pk3"
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
echo Starting the first MiniQuake3 playable preview...
echo Enter starts, WASD moves, mouse looks, left mouse fires, Q/E or 1-9 changes weapons, Space jumps.
echo Escape returns to the menu; Escape again quits.
"build\MiniQuake3.exe" --play "%MQ3_PAK%" "maps/q3dm1.bsp"
if errorlevel 1 pause
endlocal
