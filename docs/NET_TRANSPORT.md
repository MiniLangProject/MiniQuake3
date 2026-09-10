# UDP network transport

`mq3.qcommon.net_transport` connects the protocol-level Netchan code to the
Windows UDP boundary. It converts protocol IPv4 addresses to native endpoints,
installs a `sendPacketFn` on a Netchan runtime, receives nonblocking
datagrams, and builds Baseq3 connectionless packets.

`outOfBandPrint` emits the four `0xff` marker bytes followed by the text
payload. `outOfBandData` preserves the marker and eight-byte `connect `
prefix, then applies the adaptive packet codec at offset 12 exactly as
`NET_OutOfBandData` does.

Run:

```powershell
python scripts/test_udp_platform.py
python scripts/test_huffman_message.py
python scripts/test_net_transport.py
```

The three gates cover the native socket ABI with two real localhost sockets,
the packet codec against unchanged Baseq3 C, and the complete MiniLang
transport bridge. The next engine-level step is a frame pump that drains both
client and server sockets and dispatches each packet to their packet-event
handlers.
