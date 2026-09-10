/* SPDX-License-Identifier: GPL-2.0-or-later
 * Multi-voice WinMM boundary for the interactive MiniQuake3 preview.
 */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define PLAYABLE_AUDIO_API __declspec(dllexport)
#define MAX_VOICES 16

typedef struct playable_voice_s {
    HWAVEOUT handle;
    WAVEHDR header;
    unsigned char *samples;
} playable_voice_t;

static playable_voice_t voices[MAX_VOICES];
static int initialized;

static void close_voice(playable_voice_t *voice, int reset) {
    if (voice->handle != NULL) {
        if (reset) waveOutReset(voice->handle);
        if ((voice->header.dwFlags & WHDR_PREPARED) != 0) {
            waveOutUnprepareHeader(voice->handle, &voice->header, sizeof(voice->header));
        }
        waveOutClose(voice->handle);
    }
    voice->handle = NULL;
    ZeroMemory(&voice->header, sizeof(voice->header));
    free(voice->samples);
    voice->samples = NULL;
}

static void reap_finished(void) {
    int index;
    for (index = 0; index < MAX_VOICES; ++index) {
        if (voices[index].handle != NULL &&
            (voices[index].header.dwFlags & WHDR_DONE) != 0) {
            close_voice(&voices[index], 0);
        }
    }
}

static void stop_output(void) {
    int index;
    for (index = 0; index < MAX_VOICES; ++index) close_voice(&voices[index], 1);
}

static int play_pcm(const unsigned char *samples, int byteCount, int sampleRate,
                    int channels, int bitsPerSample, int loop) {
    WAVEFORMATEX format;
    playable_voice_t *voice = NULL;
    MMRESULT result;
    int bytesPerSample;
    int index;

    if (!initialized || samples == NULL || byteCount <= 0 ||
        sampleRate < 4000 || sampleRate > 192000 ||
        (channels != 1 && channels != 2) ||
        (bitsPerSample != 8 && bitsPerSample != 16)) return 0;
    bytesPerSample = bitsPerSample / 8;
    if (byteCount % (channels * bytesPerSample) != 0) return 0;

    reap_finished();
    for (index = 0; index < MAX_VOICES; ++index) {
        if (voices[index].handle == NULL) { voice = &voices[index]; break; }
    }
    if (voice == NULL) { close_voice(&voices[0], 1); voice = &voices[0]; }

    voice->samples = (unsigned char *)malloc((size_t)byteCount);
    if (voice->samples == NULL) return 0;
    memcpy(voice->samples, samples, (size_t)byteCount);

    ZeroMemory(&format, sizeof(format));
    format.wFormatTag = WAVE_FORMAT_PCM;
    format.nChannels = (WORD)channels;
    format.nSamplesPerSec = (DWORD)sampleRate;
    format.wBitsPerSample = (WORD)bitsPerSample;
    format.nBlockAlign = (WORD)(channels * bytesPerSample);
    format.nAvgBytesPerSec = format.nSamplesPerSec * format.nBlockAlign;

    result = waveOutOpen(&voice->handle, WAVE_MAPPER, &format, 0, 0, CALLBACK_NULL);
    if (result != MMSYSERR_NOERROR) { close_voice(voice, 1); return 0; }
    voice->header.lpData = (LPSTR)voice->samples;
    voice->header.dwBufferLength = (DWORD)byteCount;
    if (loop) {
        voice->header.dwFlags = WHDR_BEGINLOOP | WHDR_ENDLOOP;
        voice->header.dwLoops = 0xFFFFFFFFu;
    }
    result = waveOutPrepareHeader(voice->handle, &voice->header, sizeof(voice->header));
    if (result != MMSYSERR_NOERROR) { close_voice(voice, 1); return 0; }
    result = waveOutWrite(voice->handle, &voice->header, sizeof(voice->header));
    if (result != MMSYSERR_NOERROR) { close_voice(voice, 1); return 0; }
    return 1;
}

PLAYABLE_AUDIO_API int playable_audio_init(void) {
    initialized = 1;
    return 1;
}

PLAYABLE_AUDIO_API int playable_audio_play_pcm(const unsigned char *samples,
                                               int byteCount, int sampleRate,
                                               int channels, int bitsPerSample) {
    return play_pcm(samples, byteCount, sampleRate, channels, bitsPerSample, 0);
}

PLAYABLE_AUDIO_API int playable_audio_play_pcm_loop(const unsigned char *samples,
                                                    int byteCount, int sampleRate,
                                                    int channels, int bitsPerSample) {
    return play_pcm(samples, byteCount, sampleRate, channels, bitsPerSample, 1);
}

PLAYABLE_AUDIO_API void playable_audio_stop(void) { stop_output(); }

PLAYABLE_AUDIO_API void playable_audio_shutdown(void) {
    stop_output();
    initialized = 0;
}
