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
Run `python scripts/test_audio_channel_paint.py`. Spatial channel selection,
streaming and the Windows audio device remain open.
