# Windows UDP platform boundary

`native/udp_win64.c` is a small Windows-x64 ABI DLL around Winsock 2.2. It owns
only startup/cleanup, nonblocking UDP socket creation, bind/getsockname,
sendto/recvfrom and close. IPv4 addresses cross the ABI as host-order 32-bit
values and ports as host-order integers; payloads remain unmodified byte spans.

`src/mq3/platform/udp.ml` validates arguments, exposes `Endpoint` and `Datagram`,
maps `WSAEWOULDBLOCK` to a successful no-data result and turns other platform
failures into MiniLang errors. Packet framing, OOB dispatch, Netchan,
challenge/connect behavior and all game state remain outside the DLL.

`python scripts/test_udp_platform.py` creates two nonblocking sockets bound to
`127.0.0.1` with ephemeral ports. Thirteen contracts verify the empty receive,
address/port roundtrip and byte-exact bidirectional transfer of a binary
9-byte payload and a generated 2,048-byte payload.
