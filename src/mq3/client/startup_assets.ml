// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.client.startup_assets

import mq3.format.pk3 as pk3
import mq3.platform.win_main_runtime as winMain
import std.fs as fs

/// The selected retail PK3 stack and the directory from which it was mounted.
struct RetailData
  /// Opened retail archive, including any updates in the selected directory.
  archive
  /// Directory containing the mounted PK3 files.
  directory
end struct

/// Mount the first readable standard PK3 stack in the supplied directory order.
/// Returns RetailData or void if no candidate can be mounted.
/// @param directories Ordered list of directories to check for pak0.pk3.
function openFirstArchive(directories)
  for each directory in directories
    archive=try(pk3.openStandard(directory))
    if not (archive is error) then return RetailData(archive,directory) end if
  end for
  return void
end function

/// Look for retail PK3s in the standard CD layouts, including the Quake3 directory on the Windows CD.
/// Returns RetailData or void if no disc contains a readable stack.
/// @param roots Optical volume roots in search order.
function openCdArchive(roots)
  for each root in roots
    data=openFirstArchive([fs.joinPath(root,"Quake3/baseq3"),fs.joinPath(root,"baseq3"),
      fs.joinPath(root,"Setup/Data/baseq3"),root])
    if data!=void then return data end if
  end for
  return void
end function

/// Mount retail PK3s beside the EXE, in its baseq3 subdirectory, or on an inserted optical disc.
/// Returns RetailData or void if no readable stack can be found.
/// @param executableRoot Directory containing MiniQuake3.exe.
function openRetailArchive(executableRoot)
  data=openFirstArchive([executableRoot,fs.joinPath(executableRoot,"baseq3")])
  if data!=void then return data end if
  return openCdArchive(winMain.retailCdRoots())
end function

/// Display a blocking Windows startup-error dialog.
/// @param owner Window handle, with zero for startup before any window exists.
/// @param message Error text to display.
/// @param title Dialog title.
/// @param style Win32 MessageBox flags.
/// @returns The selected button identifier or zero if the dialog cannot be displayed.
extern function messageBoxNative(owner as ptr,message as wstr,title as wstr,style as u32) from "user32.dll" symbol "MessageBoxW" returns i32

/// Tell the player where to supply pak0.pk3 after all startup locations fail.
function showMissingPaks()
  messageBoxNative(0,"Quake III Arena game data could not be opened.\n\n"+
    "Put pak0.pk3 and any update PK3 files next to MiniQuake3.exe or in its baseq3 folder, "+
    "or insert the original Quake III Arena CD.","MiniQuake3",0x10)
end function
