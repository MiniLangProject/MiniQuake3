# Network runtime

The network runtime joins the Windows UDP boundary to the protocol-68 client
and server packet handlers.

`mq3.qcommon.network_pump` drains both nonblocking sockets with a fixed
per-frame budget. It alternates the preferred side after every delivered
datagram so sustained traffic on one socket cannot starve the other.
`mq3.server.packet_event` handles OOB routing, qport client lookup, translated
port repair, sequenced Netchan processing and client-message dispatch.
`mq3.server.client_message` parses the three header longs, server-id policy,
reliable acknowledgement, client-command sequence and move opcode.
`mq3.server.client_command_dispatch` routes the eight engine-owned commands
before the game callback and applies the active-game and flood gates to all
unknown commands.
`mq3.server.client_command` validates the reliable sequence, rejects gaps,
applies the one-second flood window and records the command used by Netchan
XOR. `mq3.server.user_move` decodes the keyed usercmd batch, applies pure and
client-state gates and invokes client think. `mq3.server.client_input` gives
all parser stages one shared client state and concrete callbacks.
`mq3.server.network_ingress` joins these packet layers to the bounded UDP pump.
On the other side, `mq3.client.network_ingress` joins the same pump to
`CL_PacketEvent`, client Netchan and `CL_ParseServerMessage`, including the
server-command ring used by the next outgoing packet's XOR key.
`mq3.platform.desktop_frame_host` owns Winsock startup, both UDP sockets,
bounded per-frame draining, monotonic frame time and orderly shutdown.

The localhost handshake contract performs a real socket exchange:

1. Client sends `getchallenge`.
2. Server allocates and returns a challenge.
3. Client sends the quoted, adaptive-Huffman-compressed `connect` userinfo.
4. Server validates protocol, qport and challenge and returns
   `connectResponse`.
5. Client creates its Netchan and sends the first sequenced packet.
6. Server validates the source/qport and recovers the original payload through
   its Netchan XOR decoder.

Run:

```powershell
python scripts/test_network_pump.py
python scripts/test_server_packet_event.py
python scripts/test_localhost_handshake.py
python scripts/test_server_client_message.py
python scripts/test_client_command_dispatch.py
python scripts/test_server_client_command.py
python scripts/test_server_user_move.py
python scripts/test_server_client_input.py
python scripts/test_server_network_ingress.py
python scripts/test_client_network_ingress.py
python scripts/test_desktop_frame_host.py
python scripts/test_engine_loop.py
python scripts/test_server_client_pings.py
python scripts/test_server_timeouts.py
python scripts/test_server_pause.py
python scripts/test_snapshot_schedule.py
python scripts/test_server_frame.py
```

Both sequenced network ingress paths and their desktop frame owner are present.
The server frame calculates pings, expires timed-out/zombie clients, applies
single-player pause state and schedules due snapshots/fragments. The outer
`SV_Frame` now composes these with kill/restart policy, residual time, bot/game
frames, info-config updates and heartbeat in original order.
`mq3.platform.engine_loop` completes the desktop ordering by draining queued
input before `SV_Frame` and then invoking `CL_Frame`; 15 integration contracts
cover budgets, remaining events, time and frame accounting.

## Remote client and reliable commands

`mq3.client.remote_session` composes connectionless negotiation, Netchan,
gamestate/snapshot parsing and usercmd transmission for an external protocol-68
server. The caller owns the socket, clock, assets and game/render lifecycle.
The graphical menu does not yet use this entry point.

The caller accepts a loaded gamestate with `acceptUnpureGamestate` and consumes
reliable commands with `runServerCommands(session, snapshot.serverCommandNum)`
when adopting a snapshot. Packet receipt and command execution have separate
sequence numbers: receipt alone must not execute commands for a future snapshot.
Pending commands and a partially assembled `bcs0`/`bcs1`/`bcs2` string survive a
new gamestate on the same connection. A new connection starts its execution
sequence at zero. A command that has fallen outside the 64-entry receive ring
drops the session instead of silently skipping work.

Built-in command handling updates packed configstrings and the outgoing
`sv_serverid`, clears usercmd history on `map_restart`, and terminates the
session on server disconnect or an unsupported pure-policy change. Identical
configstrings leave storage and configuration callbacks untouched. Applications
can set `serverCommandFn(session, sequence, commandState)` for commands such as
`print` and `chat`; arguments are transient and must be copied if retained.
If a callback stops the session or replaces its gamestate, consumption stops at
that boundary. The caller must recheck state before adopting or rendering the
snapshot after callbacks.

An initial snapshot with wire flag `SNAPFLAG_NOT_ACTIVE` (`2`) cannot activate
the client. `SNAPFLAG_RATE_DELAYED` (`1`) is still an active snapshot; both the
remote session and the native cgame snapshot observer distinguish these bits.
`SNAPFLAG_SERVERCOUNT` (`4`) identifies restart transitions. These values come
from the pinned original `code/game/q_shared.h`.

## Original-server acceptance

Run the compiled component and original-C comparisons on Windows:

```powershell
python scripts/run_protocol68_regression.py
python scripts/build_release.py
```

With caller-supplied retail assets under `build/baseq3`, the separate-process
test is:

```powershell
python scripts/test_original_server_interop.py --data-root build
```

The live test builds the pinned original id Software dedicated server, connects
a MiniLang UDP peer, and checks gamestate, snapshots, input acknowledgement and
reliable chat delivered through the command callback. It then requests a real
`map_restart 0` and independently checks the changed server ID, consumed restart
command, and new snapshots, input acknowledgement and chat after the restart.
Pre-restart counters do not satisfy the post-restart requirements. The test has
bounded startup and peer deadlines and records source/binary hashes and logs
under `build/protocol68-original`.

The `Protocol 68 compatibility` workflow runs regressions and the complete game
build on relevant `main` pushes. The original-server job additionally requires
manual dispatch or `[interop]` in the commit message. Check the individual job
conclusions: a successful workflow with that job skipped is not a new live-server
acceptance.

The supported test scope is loopback protocol 68 with `sv_pure=0` and a headless
MiniLang client. Pure pak verification/download negotiation, graphical remote
connect, the reverse full-game direction and WAN/NAT conditions still need
implementation or separate acceptance. Network microbenchmarks do not measure
gameplay FPS.
