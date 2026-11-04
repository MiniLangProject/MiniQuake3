/* SPDX-License-Identifier: GPL-2.0-or-later
 * Small queued stereo PCM stream for MiniLang's spatial ambient mixer.
 */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <stdint.h>
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

static int pcm_sample(const unsigned char *samples,int sampleBytes,int frame,
                      int channels,int bitsPerSample,int blockAlign) {
    int offset,left,right;
    if (samples==NULL || frame<0 || channels<1 || channels>2 ||
        (bitsPerSample!=8 && bitsPerSample!=16) || blockAlign<=0) return 0;
    offset=frame*blockAlign;
    if (offset<0 || offset+blockAlign>sampleBytes) return 0;
    if (bitsPerSample==8) {
        left=((int)samples[offset]-128)<<8;
        if (channels==1) return left;
        right=((int)samples[offset+1]-128)<<8;
    } else {
        left=(int)(int16_t)((uint16_t)samples[offset]|((uint16_t)samples[offset+1]<<8));
        if (channels==1) return left;
        right=(int)(int16_t)((uint16_t)samples[offset+2]|((uint16_t)samples[offset+3]<<8));
    }
    return (left+right)/2;
}

static void mix_add(int32_t *paint,int index,int sample,int leftVolume,int rightVolume) {
    uint32_t left=(uint32_t)((int64_t)sample*(int64_t)leftVolume>>8);
    uint32_t right=(uint32_t)((int64_t)sample*(int64_t)rightVolume>>8);
    paint[index]=(int32_t)((uint32_t)paint[index]+left);
    paint[index+1]=(int32_t)((uint32_t)paint[index+1]+right);
}

/* Hot S_PaintChannelFrom16 path. The MiniLang side retains channel ownership,
 * spatialisation, loop grouping and cursor state; this boundary only performs
 * the thousands of integer sample operations that otherwise stall a frame. */
AMBIENT_API int playable_ambient_mix_pcm(unsigned char *paintBytes,int paintByteCount,
    const unsigned char *samples,int sampleBytes,int channels,int bitsPerSample,
    int blockAlign,int sourceFrames,int sampleOffset,int count,int bufferOffset,
    int leftVolume,int rightVolume,int soundVolume,int looping,int doppler,
    double dopplerScale,double oldDopplerScale) {
    int32_t *paint=(int32_t *)paintBytes;
    int paintFrames=paintByteCount/8;
    int actual=count,start,i;
    int scaledLeft=leftVolume*soundVolume,scaledRight=rightVolume*soundVolume;
    if (paintBytes==NULL || samples==NULL || paintByteCount<0 || (paintByteCount&7)!=0 ||
        sourceFrames<1 || sampleOffset<0 || count<0 || bufferOffset<0 ||
        bufferOffset+count>paintFrames || dopplerScale<=0.0 || oldDopplerScale<0.0) return -1;
    start=doppler?(int)((double)sampleOffset*oldDopplerScale):sampleOffset;
    if (!looping) {
        if (start>=sourceFrames) return 0;
        if (start+actual>sourceFrames) actual=sourceFrames-start;
    }
    if (!doppler || dopplerScale==1.0) {
        for (i=0;i<actual;++i) {
            int source=start+i;
            if (looping) { source%=sourceFrames;if (source<0) source+=sourceFrames; }
            mix_add(paint,(bufferOffset+i)*2,
                    pcm_sample(samples,sampleBytes,source,channels,bitsPerSample,blockAlign),
                    scaledLeft,scaledRight);
        }
        return actual;
    }
    {
        double offset=(double)start;
        for (i=0;i<actual;++i) {
            int first=(int)offset,last,j;int64_t total=0;double divisor,left,right;
            offset+=dopplerScale;last=(int)offset;
            if (last<=first) last=first+1;
            for (j=first;j<last;++j) {
                int source=j%sourceFrames;if (source<0) source+=sourceFrames;
                total+=pcm_sample(samples,sampleBytes,source,channels,bitsPerSample,blockAlign);
            }
            divisor=256.0*(double)(last-first);
            left=(double)total*(double)scaledLeft/divisor;
            right=(double)total*(double)scaledRight/divisor;
            paint[(bufferOffset+i)*2]=(int32_t)((uint32_t)paint[(bufferOffset+i)*2]+(uint32_t)(int32_t)left);
            paint[(bufferOffset+i)*2+1]=(int32_t)((uint32_t)paint[(bufferOffset+i)*2+1]+(uint32_t)(int32_t)right);
        }
    }
    return actual;
}

AMBIENT_API double playable_ambient_mix_stream(unsigned char *paintBytes,int paintByteCount,
    const unsigned char *samples,int sampleBytes,int channels,int bitsPerSample,
    int blockAlign,int sourceFrames,int sampleRate,int outputRate,double cursor,
    int count,int bufferOffset) {
    int32_t *paint=(int32_t *)paintBytes;int paintFrames=paintByteCount/8;int i;
    double phase=cursor,step;
    if (paintBytes==NULL || samples==NULL || (paintByteCount&7)!=0 || sourceFrames<1 ||
        sampleRate<=0 || outputRate<=0 || cursor<0.0 || count<0 || bufferOffset<0 ||
        bufferOffset+count>paintFrames) return -1.0;
    step=(double)sampleRate/(double)outputRate;
    for (i=0;i<count && phase<(double)sourceFrames;++i) {
        int frame=(int)phase,offset=frame*blockAlign,left,right;
        if (offset<0 || offset+blockAlign>sampleBytes) break;
        if (bitsPerSample==8) {
            left=((int)samples[offset]-128)<<8;
            right=channels==2?((int)samples[offset+1]-128)<<8:left;
        } else if (bitsPerSample==16) {
            left=(int)(int16_t)((uint16_t)samples[offset]|((uint16_t)samples[offset+1]<<8));
            right=channels==2?(int)(int16_t)((uint16_t)samples[offset+2]|((uint16_t)samples[offset+3]<<8)):left;
        } else return -1.0;
        paint[(bufferOffset+i)*2]=(int32_t)((uint32_t)paint[(bufferOffset+i)*2]+(uint32_t)(left*256));
        paint[(bufferOffset+i)*2+1]=(int32_t)((uint32_t)paint[(bufferOffset+i)*2+1]+(uint32_t)(right*256));
        phase+=step;
    }
    return phase;
}

AMBIENT_API int playable_ambient_finish_mix(const unsigned char *paintBytes,int paintByteCount,
    unsigned char *output,int outputBytes,int frames) {
    const int32_t *paint=(const int32_t *)paintBytes;int i,peak=0;
    if (paintBytes==NULL || output==NULL || frames<0 || paintByteCount<frames*8 || outputBytes<frames*4) return -1;
    for (i=0;i<frames*2;++i) {
        int value=paint[i]>>8,absolute;
        if (value>32767) value=32767;else if (value<-32768) value=-32768;
        output[i*2]=(unsigned char)(value&255);output[i*2+1]=(unsigned char)((value>>8)&255);
        absolute=paint[i]>>8;if (absolute<0) absolute=-absolute;if (absolute>peak) peak=absolute;
    }
    return peak;
}

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
