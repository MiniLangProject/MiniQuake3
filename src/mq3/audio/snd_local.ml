// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed ABI facade for code/client/snd_local.h.
package mq3.audio.snd_local
/// Maximum number of stereo frames accumulated in one paint buffer.
const PAINTBUFFER_SIZE=4096
/// Number of signed 16-bit mono samples stored in one sound-memory chunk.
const SND_CHUNK_SIZE=1024
/// Number of floating-point values that fit in one sound-memory chunk.
const SND_CHUNK_SIZE_FLOAT=512
/// Number of encoded bytes that fit in one sound-memory chunk.
const SND_CHUNK_SIZE_BYTE=2048
/// Sentinel that starts a channel at the beginning of the next mixing pass.
const START_SAMPLE_IMMEDIATE=2147483647
/// RIFF WAVE format tag for uncompressed integer PCM samples.
const WAV_FORMAT_PCM=1
/// Maximum number of simultaneously allocated sound channels.
const MAX_CHANNELS=96
/// Number of mono sample positions in each raw-stream ring buffer.
const MAX_RAW_SAMPLES=16384
/// Mu-law stream marker introducing a run of zero-valued samples.
const SENTINEL_MULAW_ZERO_RUN=127
/// Mu-law stream marker introducing a run encoded with four-bit values.
const SENTINEL_MULAW_FOUR_BIT_RUN=126
/// Selects byte-oriented storage for the compressed sample stream.
const NXSTREAM_IS_BYTE=true
/// PortableSamplePair record for audio.snd_local, containing `left`, `right`.
struct PortableSamplePair
  /// Accumulated left-channel paint value before clamping and conversion.
  left
  /// Accumulated right-channel paint value before clamping and conversion.
  right
end struct
/// AdpcmState record for audio.snd_local, containing `sample`, `index`.
struct AdpcmState
  /// Previous reconstructed sample used as the ADPCM predictor.
  sample
  /// Index into the ADPCM step-size table.
  index
end struct
/// SndBuffer record for audio.snd_local, containing `sndChunk`, `next`, `size`, `adpcm`.
struct SndBuffer
  /// Sample storage owned by this sound-memory chunk.
  sndChunk
  /// Next chunk in the sound-buffer chain.
  next
  /// Number of meaningful samples or encoded elements stored in the chunk.
  size
  /// ADPCM predictor and step-index state at the start of this chunk.
  adpcm
end struct
/// Sfx record for audio.snd_local, containing `soundData`, `defaultSound`, `inMemory`, `soundCompressed`, `soundCompressionMethod`, `soundLength`, and 3 further fields.
struct Sfx
  /// Head of the sample-buffer chain or loaded sample data for the sound.
  soundData
  /// True when a fallback sound substitutes for an asset that could not be loaded.
  defaultSound
  /// True when the sound sample data is currently resident in memory.
  inMemory
  /// True when sound data is stored using a compressed representation.
  soundCompressed
  /// Compression-method identifier used to decode the sound buffers.
  soundCompressionMethod
  /// Length of the sound in mono sample positions.
  soundLength
  /// Quake asset path identifying the registered sound.
  soundName
  /// Last-use timestamp used when selecting an old sound for eviction.
  lastTimeUsed
  /// Next sound-effect descriptor in the registry hash chain.
  next
end struct
/// Dma record for audio.snd_local, containing `channels`, `samples`, `submission_chunk`, `samplebits`, `speed`, `buffer`.
struct Dma
  /// Number of interleaved output channels.
  channels
  /// Total number of mono sample positions in the DMA ring buffer.
  samples
  /// Minimum number of samples submitted to the audio device at once.
  submission_chunk
  /// Number of bits stored for each PCM sample.
  samplebits
  /// DMA output sample rate in hertz.
  speed
  /// Raw PCM memory presented to the audio device.
  buffer
end struct
/// LoopSound record for audio.snd_local, containing `origin`, `velocity`, `sfx`, `mergeFrame`, `active`, `kill`, and 4 further fields.
struct LoopSound
  /// World-space XYZ position of the sound source.
  origin
  /// World-space velocity of the sound source used for Doppler adjustment.
  velocity
  /// Sound-effect descriptor used by this loop.
  sfx
  /// Frame marker used when combining loops that share the same sound.
  mergeFrame
  /// True while this sound, channel, or music stream participates in playback.
  active
  /// True when the loop should be removed after its current submission.
  kill
  /// True when Doppler resampling is enabled for this source.
  doppler
  /// Current Doppler scale applied to the source sample-advance rate.
  dopplerScale
  /// Previous Doppler scale retained when continuing a loop between frames.
  oldDopplerScale
  /// Frame number associated with the loop and its Doppler state.
  framenum
end struct
/// Channel record for audio.snd_local, containing `allocTime`, `startSample`, `entnum`, `entchannel`, `leftvol`, `rightvol`, and 7 further fields.
struct Channel
  /// Timestamp at which the playback channel was allocated.
  allocTime
  /// Absolute starting sample, or the immediate-start sentinel before the next mix.
  startSample
  /// Game-entity number used to spatialize or replace the channel.
  entnum
  /// Entity-channel identifier used when replacing an existing sound.
  entchannel
  /// Left-channel volume after spatialization, in the range zero through 255.
  leftvol
  /// Right-channel volume after spatialization, in the range zero through 255.
  rightvol
  /// Channel volume before spatialization, in the range zero through 255.
  master_vol
  /// Current Doppler scale applied to the source sample-advance rate.
  dopplerScale
  /// Previous Doppler scale retained when continuing a loop between frames.
  oldDopplerScale
  /// World-space XYZ position of the sound source.
  origin
  /// True when playback uses the stored origin instead of the current entity origin.
  fixed_origin
  /// Sound-effect descriptor supplying this channel's samples.
  thesfx
  /// True when Doppler resampling is enabled for this source.
  doppler
end struct
/// WavInfo record for audio.snd_local, containing `format`, `rate`, `width`, `channels`, `samples`, `dataofs`.
struct WavInfo
  /// RIFF WAVE format tag; uncompressed integer PCM uses tag one.
  format
  /// Source sample rate in hertz.
  rate
  /// Bytes used to store one sample in one source channel.
  width
  /// Number of interleaved source channels.
  channels
  /// Number of mono samples described by the WAVE data.
  samples
  /// Byte offset of the PCM payload from the start of the WAVE file.
  dataofs
end struct
/// List the 8 names in audio.snd_local.typeNames, beginning with `portable_samplepair_t`, `adpcm_state_t`, `sndBuffer`, `sfx_t`.
function typeNames() return ["portable_samplepair_t","adpcm_state_t","sndBuffer","sfx_t","dma_t","loopSound_t","channel_t","wavinfo_t"] end function
/// List the 52 names in audio.snd_local.allRecordFields, beginning with `left`, `right`, `sample`, `index`.
function allRecordFields() return ["left","right","sample","index","sndChunk","next","size","adpcm","soundData","defaultSound","inMemory","soundCompressed","soundCompressionMethod","soundLength","soundName","lastTimeUsed","next","channels","samples","submission_chunk","samplebits","speed","buffer","origin","velocity","sfx","mergeFrame","active","kill","doppler","dopplerScale","oldDopplerScale","framenum","allocTime","startSample","entnum","entchannel","leftvol","rightvol","master_vol","dopplerScale","oldDopplerScale","origin","fixed_origin","thesfx","doppler","format","rate","width","channels","samples","dataofs"] end function
/// List the 20 names in audio.snd_local.declarationNames, beginning with `SNDDMA_Init`, `SNDDMA_GetDMAPos`, `SNDDMA_Shutdown`, `SNDDMA_BeginPainting`.
function declarationNames() return ["SNDDMA_Init","SNDDMA_GetDMAPos","SNDDMA_Shutdown","SNDDMA_BeginPainting","SNDDMA_Submit","S_LoadSound","SND_free","SND_malloc","SND_setup","S_PaintChannels","S_memoryLoad","S_GetRawSamplePointer","S_Spatialize","S_AdpcmMemoryNeeded","S_AdpcmEncodeSound","S_AdpcmGetSamples","S_FreeOldestSound","encodeWavelet","decodeWavelet","encodeMuLaw"] end function
/// List the 21 names in audio.snd_local.externalNames, beginning with `s_channels`, `loop_channels`, `numLoopChannels`, `s_paintedtime`.
function externalNames() return ["s_channels","loop_channels","numLoopChannels","s_paintedtime","s_rawend","listener_forward","listener_right","listener_up","dma","s_rawsamples","s_volume","s_nosound","s_khz","s_show","s_mixahead","s_testsound","s_separation","mulawToShort","sfxScratchBuffer","sfxScratchPointer","sfxScratchIndex"] end function
/// Compute chunk count in audio.snd_local; the normal completion returns `(((samples + SND_CHUNK_SIZE) - 1) / SND_CHUNK_SIZE)`.
///
/// Validation failures include `snd_local.h: negative sample count`.
/// @param samples Samples used in `(samples < 0)` and `(samples == 0)`.
function chunkCount(samples) if samples<0 then return error(7962,"snd_local.h: negative sample count") end if;if samples==0 then return 0 end if;return (samples+SND_CHUNK_SIZE-1)/SND_CHUNK_SIZE end function
/// Clamp volume in audio.snd_local; the normal completion returns `value`.
/// @param value Value used in `(value < 0)` and `(value > 255)`.
function clampVolume(value) if value<0 then return 0 end if;if value>255 then return 255 end if;return value end function
/// Compute raw sample slot in audio.snd_local; the normal completion returns `(sample % MAX_RAW_SAMPLES)`.
///
/// Validation failures include `snd_local.h: negative raw sample`.
/// @param sample Sample used in `(sample < 0)` and `(sample % MAX_RAW_SAMPLES)`.
function rawSampleSlot(sample) if sample<0 then return error(7962,"snd_local.h: negative raw sample") end if;return sample%MAX_RAW_SAMPLES end function
