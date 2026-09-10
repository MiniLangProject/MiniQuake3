/* SPDX-License-Identifier: GPL-2.0-or-later
 * Small queued stereo PCM stream for MiniLang's spatial ambient mixer.
 */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <stdlib.h>
#include <string.h>

#define AMBIENT_API __declspec(dllexport)
#define BUFFER_COUNT 3
#define MAX_BUFFER_BYTES (4096 * 4)

typedef struct ambient_buffer_s {
    WAVEHDR header;
    unsigned char *samples;
} ambient_buffer_t;

static HWAVEOUT outputHandle;
static ambient_buffer_t buffers[BUFFER_COUNT];
static int initialized;

static void release_buffer(ambient_buffer_t *buffer) {
    if (buffer->samples == NULL) return;
    if ((buffer->header.dwFlags & WHDR_PREPARED) != 0 && outputHandle != NULL) {
        waveOutUnprepareHeader(outputHandle, &buffer->header, sizeof(buffer->header));
    }
    free(buffer->samples);buffer->samples=NULL;ZeroMemory(&buffer->header,sizeof(buffer->header));
}

static void reap_finished(void) {
    int index;
    for (index=0;index<BUFFER_COUNT;++index) {
        if (buffers[index].samples!=NULL && (buffers[index].header.dwFlags&WHDR_DONE)!=0) release_buffer(&buffers[index]);
    }
}

static void stop_stream(void) {
    int index;
    if (outputHandle!=NULL) waveOutReset(outputHandle);
    for (index=0;index<BUFFER_COUNT;++index) release_buffer(&buffers[index]);
    if (outputHandle!=NULL) waveOutClose(outputHandle);
    outputHandle=NULL;initialized=0;
}

AMBIENT_API int playable_ambient_init(int sampleRate) {
    WAVEFORMATEX format;MMRESULT result;
    if (sampleRate<4000 || sampleRate>192000) return 0;
    stop_stream();ZeroMemory(&format,sizeof(format));format.wFormatTag=WAVE_FORMAT_PCM;
    format.nChannels=2;format.nSamplesPerSec=(DWORD)sampleRate;format.wBitsPerSample=16;
    format.nBlockAlign=4;format.nAvgBytesPerSec=format.nSamplesPerSec*4;
    result=waveOutOpen(&outputHandle,WAVE_MAPPER,&format,0,0,CALLBACK_NULL);
    if (result!=MMSYSERR_NOERROR) { stop_stream();return 0; }
    initialized=1;return 1;
}

AMBIENT_API int playable_ambient_can_submit(void) {
    int index;if (!initialized) return 0;reap_finished();
    for (index=0;index<BUFFER_COUNT;++index) if (buffers[index].samples==NULL) return 1;
    return 0;
}

AMBIENT_API int playable_ambient_submit(const unsigned char *samples,int byteCount) {
    int index;ambient_buffer_t *buffer=NULL;MMRESULT result;
    if (!initialized || samples==NULL || byteCount<=0 || byteCount>MAX_BUFFER_BYTES || (byteCount&3)!=0) return 0;
    reap_finished();for (index=0;index<BUFFER_COUNT;++index) if (buffers[index].samples==NULL) { buffer=&buffers[index];break; }
    if (buffer==NULL) return 2;
    buffer->samples=(unsigned char *)malloc((size_t)byteCount);if (buffer->samples==NULL) return 0;
    memcpy(buffer->samples,samples,(size_t)byteCount);buffer->header.lpData=(LPSTR)buffer->samples;buffer->header.dwBufferLength=(DWORD)byteCount;
    result=waveOutPrepareHeader(outputHandle,&buffer->header,sizeof(buffer->header));if (result!=MMSYSERR_NOERROR) { release_buffer(buffer);return 0; }
    result=waveOutWrite(outputHandle,&buffer->header,sizeof(buffer->header));if (result!=MMSYSERR_NOERROR) { release_buffer(buffer);return 0; }
    return 1;
}

AMBIENT_API void playable_ambient_stop(void) { stop_stream(); }
AMBIENT_API void playable_ambient_shutdown(void) { stop_stream(); }
