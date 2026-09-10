# Client snapshot and cgame time

`mq3.client.cgame_time` ports `CL_AdjustTimeDelta`, `CL_FirstSnapshot` and
`CL_SetCGameTime`. It owns the transition from primed to active play, derives
the client clock from snapshots and realtime, clamps `timeNudge`, preserves
monotonic server time, marks extrapolation and performs reset, fast and slow
delta corrections only on new snapshots.

The same state machine handles single-player pause, demo first-frame skipping,
frozen demos, timedemo 20 Hz stepping and reading demo messages until their
snapshot time advances beyond the render time. Host callbacks isolate command
buffering, profiling, the millisecond clock and demo reads.

Run `python scripts/test_cgame_time.py`. Four constants are compiled from the
original headers and 26 contracts cover the state transitions and failure
boundaries.
