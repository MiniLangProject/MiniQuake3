# Input event boundary

`mq3.platform.input_events` implements the Baseq3 `Sys_QueEvent` ring with 256
entries. A full queue discards the oldest event, zero timestamps use the host
clock, and keyboard, character, mouse, wheel and joystick producers share the
same FIFO. Wheel input expands to the original key-down/key-up impulse pair.

The dispatcher exposes key, character, mouse and joystick callbacks for the
desktop frame host. Two records execute the unchanged `Sys_QueEvent` body and
26 MiniLang contracts cover ordering, overflow, timestamps and dispatch.

Run `python scripts/test_input_event_queue.py`.
