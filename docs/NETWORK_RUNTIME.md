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
