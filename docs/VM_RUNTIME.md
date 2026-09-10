# QVM runtime lifecycle

`mq3.vm.runtime` supplies the engine ownership layer around the exact QVM
interpreter. It keeps the original three named VM slots used by qagame, cgame
and UI, reuses names case-insensitively, loads `vm/<name>.qvm`, maintains the
current/previous call context and supports restart, individual free and full
shutdown.

Restart reloads initialized data and clears BSS by constructing a fresh
interpreter state while retaining the slot and syscall boundary. A generation
counter makes stale lifecycle assumptions observable.

Run:

```powershell
python scripts/test_vm.py
python scripts/test_vm_runtime.py
python scripts/test_vm_syscall_common.py
python scripts/test_vm_syscall_qagame.py
python scripts/test_vm_syscall_qagame_world.py
python scripts/test_game_vm_lifecycle.py
python scripts/test_cgame_vm_lifecycle.py
python scripts/test_vm_syscall_cgame.py
python scripts/test_ui_vm_lifecycle.py
python scripts/test_vm_syscall_ui.py
```

The interpreter remains covered by 404 direct Baseq3 differential cases. The
lifecycle layer adds 17 contracts for the three-slot limit, calls, reuse,
restart, errors, cleanup and ordered diagnostics.

The shared syscall boundary supplies print/error/time, Cvars, command arguments,
console commands and file I/O. The qagame dispatcher adds 18 server traps for
game-data location, clients, configstrings, userinfo/serverinfo, brush models,
PVS/portals, entity linking, bot slots and entity tokens. The server-side module
lifecycle preserves the Baseq3 `GAME_INIT`/restart/shutdown order and exposes all
eleven `gameExport_t` entry points. Together these additions pass 18 direct
public-ABI records or values and 86 behavioral contracts.

The cgame ownership layer now follows `CL_InitCGame` through console close,
serverinfo map selection, pure-server interpretation mode, `CG_INIT`, loading to
primed transition, renderer registration finalization and memory touching. It
also exposes all nine cgame exports and the original key-catcher cleanup during
shutdown. Twelve direct header values and 20 lifecycle contracts pass.

The cgame syscall dispatcher adds 19 client-engine traps for commands, world and
renderer registration, GL configuration, gamestate, snapshots, reliable server
commands and usercmd handling. Four direct Baseq3 x86 layout records and 37
behavioral and bounds contracts pass.

The qagame dispatcher also delegates the binary world boundary for box and
capsule traces, point contents, entity box queries and contacts, and usercmds.
It serializes the exact 56-byte `trace_t` and 24-byte `usercmd_t` layouts. Five
direct Baseq3 binary-ABI records and 37 bounds and behavior contracts pass.

The UI ownership layer negotiates API versions 4 and 6, forces compiled QVMs on
pure servers, forwards the connection-state flag to `UI_INIT`, exposes all ten
UI exports and clears `KEYCATCH_UI` during shutdown. Fourteen direct header
values and 22 lifecycle contracts pass.

The UI syscall dispatcher adds 39 original traps for renderer registration and
2D drawing, keys and bindings, clipboard, exact GL/client-state structures,
configstrings, memory reporting and the LAN ping/server-browser core. Seven
direct ABI records and 58 behavior and bounds contracts pass.

The UI media extension adds 16 traps for sound and background music, exact
36-byte `qtime_t`, cinematics, shader remapping, 16-byte CD keys, file seeking
and the PunkBuster compatibility no-op. Five direct ABI records and 42 contracts
pass, and the main UI dispatcher delegates their original opcodes to it.
