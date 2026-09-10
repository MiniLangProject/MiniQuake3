# Audio foundation

`mq3.audio.mixer_transfer` ports the device-independent transfer stage from
`snd_mix.c`. It converts 24.8 paint values with the original arithmetic shift
and signed-16 clipping, produces signed 16-bit or biased unsigned 8-bit samples,
handles mono and interleaved stereo, and wraps through the DMA ring buffer.

Run `python scripts/test_audio_mixer_transfer.py`. Seven exact unchanged-C
records and 20 contracts cover clipping, formats, channel selection and wrap.

`mq3.audio.channel_paint` ports the scalar `S_PaintChannelFrom16` path. Seven
exact C records and 32 contracts cover stereo accumulation, 1,024-sample chunk
and ring transitions, `oldDopplerScale` offsets and Doppler interval resampling.
Run `python scripts/test_audio_channel_paint.py`.

`mq3.audio.spatial_mixer` and `mq3.client.playable_spatial_ambient` provide the
first complete streaming path for map ambience. Looped `target_speaker`
entities retain their world origins, Baseq3's full-volume distance and 0.0008
attenuation are applied relative to the live listener, and the result is
panned into stereo. Identical phase-aligned speakers share one decoded WAV
sample stream before their gains are summed. The mixer accepts the retail
8/16-bit mono/stereo PCM set, resamples to the device rate, keeps loop phase
between chunks and limits the combined signal.

`native/playable_ambient_win32.c` submits triple-buffered signed 16-bit stereo
chunks asynchronously through WinMM. Run
`python scripts/test_spatial_ambient.py --pak D:/Quake3/baseq3/pak0.pk3` for 42
mixer/runtime contracts and the eight-speaker q3dm1 probe, and
`python scripts/playable_ambient_build_test.py` for the `/W4 /WX` native
lifecycle and MiniLang FFI boundary.
