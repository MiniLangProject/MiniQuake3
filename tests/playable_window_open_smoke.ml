// SPDX-License-Identifier: GPL-2.0-or-later
// Productive MiniLang-to-Win32 startup smoke test.
import mq3.platform.playable_window as window

window.open(320,240)
print("PASS: MiniLang Win32 playable window opened")
window.shutdown()
