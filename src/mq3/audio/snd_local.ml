// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed ABI facade for code/client/snd_local.h.
package mq3.audio.snd_local
const PAINTBUFFER_SIZE=4096
const SND_CHUNK_SIZE=1024
const SND_CHUNK_SIZE_FLOAT=512
const SND_CHUNK_SIZE_BYTE=2048
const START_SAMPLE_IMMEDIATE=2147483647
const WAV_FORMAT_PCM=1
const MAX_CHANNELS=96
const MAX_RAW_SAMPLES=16384
const SENTINEL_MULAW_ZERO_RUN=127
const SENTINEL_MULAW_FOUR_BIT_RUN=126
const NXSTREAM_IS_BYTE=true
struct PortableSamplePair left right end struct
struct AdpcmState sample index end struct
struct SndBuffer sndChunk next size adpcm end struct
struct Sfx soundData defaultSound inMemory soundCompressed soundCompressionMethod soundLength soundName lastTimeUsed next end struct
struct Dma channels samples submission_chunk samplebits speed buffer end struct
struct LoopSound origin velocity sfx mergeFrame active kill doppler dopplerScale oldDopplerScale framenum end struct
struct Channel allocTime startSample entnum entchannel leftvol rightvol master_vol dopplerScale oldDopplerScale origin fixed_origin thesfx doppler end struct
struct WavInfo format rate width channels samples dataofs end struct
function typeNames() return ["portable_samplepair_t","adpcm_state_t","sndBuffer","sfx_t","dma_t","loopSound_t","channel_t","wavinfo_t"] end function
function allRecordFields() return ["left","right","sample","index","sndChunk","next","size","adpcm","soundData","defaultSound","inMemory","soundCompressed","soundCompressionMethod","soundLength","soundName","lastTimeUsed","next","channels","samples","submission_chunk","samplebits","speed","buffer","origin","velocity","sfx","mergeFrame","active","kill","doppler","dopplerScale","oldDopplerScale","framenum","allocTime","startSample","entnum","entchannel","leftvol","rightvol","master_vol","dopplerScale","oldDopplerScale","origin","fixed_origin","thesfx","doppler","format","rate","width","channels","samples","dataofs"] end function
function declarationNames() return ["SNDDMA_Init","SNDDMA_GetDMAPos","SNDDMA_Shutdown","SNDDMA_BeginPainting","SNDDMA_Submit","S_LoadSound","SND_free","SND_malloc","SND_setup","S_PaintChannels","S_memoryLoad","S_GetRawSamplePointer","S_Spatialize","S_AdpcmMemoryNeeded","S_AdpcmEncodeSound","S_AdpcmGetSamples","S_FreeOldestSound","encodeWavelet","decodeWavelet","encodeMuLaw"] end function
function externalNames() return ["s_channels","loop_channels","numLoopChannels","s_paintedtime","s_rawend","listener_forward","listener_right","listener_up","dma","s_rawsamples","s_volume","s_nosound","s_khz","s_show","s_mixahead","s_testsound","s_separation","mulawToShort","sfxScratchBuffer","sfxScratchPointer","sfxScratchIndex"] end function
function chunkCount(samples) if samples<0 then return error(7962,"snd_local.h: negative sample count") end if;if samples==0 then return 0 end if;return (samples+SND_CHUNK_SIZE-1)/SND_CHUNK_SIZE end function
function clampVolume(value) if value<0 then return 0 end if;if value>255 then return 255 end if;return value end function
function rawSampleSlot(sample) if sample<0 then return error(7962,"snd_local.h: negative raw sample") end if;return sample%MAX_RAW_SAMPLES end function
