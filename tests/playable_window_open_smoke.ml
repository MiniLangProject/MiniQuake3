// SPDX-License-Identifier: GPL-2.0-or-later
// Productive MiniLang-to-Win32 startup smoke test.
import mq3.platform.playable_window as window

window.open(320,240)
shown=window.showLoading(50,"Verifying rendered pixels")
if not shown then window.shutdown();error(7481,"Win32 window closed during startup smoke") end if
if window.presentedNonBlack()<100 then window.shutdown();error(7481,"Win32 window presented a blank frame") end if
print("PASS: MiniLang Win32 playable window opened")
window.shutdown()
