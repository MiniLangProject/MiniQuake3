#include <stdio.h>
#include <string.h>

typedef unsigned char byte;
typedef struct { int left, right; } portable_samplepair_t;
typedef struct adpcm_state { short sample; char index; } adpcm_state_t;
typedef struct sndBuffer_s { short sndChunk[1024]; struct sndBuffer_s *next; int size; adpcm_state_t adpcm; } sndBuffer;
typedef struct { int leftvol, rightvol, doppler; float dopplerScale, oldDopplerScale; } channel_t;
typedef struct { sndBuffer *soundData; } sfx_t;

#define SND_CHUNK_SIZE 1024
#define SND_CHUNK_SIZE_FLOAT (SND_CHUNK_SIZE/2)
#define C0 0.4829629131445341
#define C1 0.8365163037378079
#define C2 0.2241438680420134
#define C3 -0.1294095225512604

static int indexTable[16] = {-1,-1,-1,-1,2,4,6,8,-1,-1,-1,-1,2,4,6,8};
static int stepsizeTable[89] = {7,8,9,10,11,12,13,14,16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,15289,16818,18500,20350,22385,24623,27086,29794,32767};

portable_samplepair_t paintbuffer[64];
int snd_vol = 204;
short sfxScratchBuffer[SND_CHUNK_SIZE * 4];
int sfxScratchIndex = -1;
sfx_t *sfxScratchPointer = NULL;
short mulawToShort[256];

void S_AdpcmDecode(const char indata[], short *outdata, int len, struct adpcm_state *state);
void decodeWavelet(sndBuffer *chunk, short *to);
void S_AdpcmGetSamples(sndBuffer *chunk, short *to) {
    adpcm_state_t state = chunk->adpcm;
    S_AdpcmDecode((const char *)chunk->sndChunk, to, SND_CHUNK_SIZE * 4, &state);
}

#include "audio_snd_compressed_codecs_under_test.inc"
#include "audio_snd_compressed_paint_under_test.inc"

static void resetPaint(void) { memset(paintbuffer, 0, sizeof(paintbuffer)); sfxScratchIndex=-1; sfxScratchPointer=NULL; }
static void printPaint(const char *name, int count) {
    int i; printf("%s", name); for (i=0;i<count;i++) printf(" %d %d",paintbuffer[i].left,paintbuffer[i].right); printf("\n");
}

int main(void) {
    sndBuffer block; sfx_t sfx; channel_t ch; byte *raw; int i;
    memset(&block,0,sizeof(block)); block.next=&block; block.size=2048; block.adpcm.sample=0; block.adpcm.index=0; sfx.soundData=&block;
    raw=(byte *)block.sndChunk; for(i=0;i<2048;i++) raw[i]=(byte)((i*37+18)&255);
    for(i=0;i<256;i++) mulawToShort[i]=MuLawDecode((byte)i);
    ch.leftvol=127; ch.rightvol=73; ch.doppler=0; ch.dopplerScale=1.0f; ch.oldDopplerScale=1.0f;
    resetPaint(); S_PaintChannelFromADPCM(&ch,&sfx,6,3,0); printPaint("adpcm",6);
    resetPaint(); ch.doppler=1; ch.oldDopplerScale=1.5f; S_PaintChannelFromADPCM(&ch,&sfx,5,4,0); printPaint("adpcm_doppler",5);
    resetPaint(); ch.doppler=0; S_PaintChannelFromMuLaw(&ch,&sfx,6,5,0); printPaint("mulaw",6);
    resetPaint(); ch.doppler=1; ch.dopplerScale=1.75f; S_PaintChannelFromMuLaw(&ch,&sfx,6,5,0); printPaint("mulaw_doppler",6);
    resetPaint(); ch.doppler=0; decodeWavelet(&block,sfxScratchBuffer); sfxScratchIndex=0; sfxScratchPointer=&sfx; S_PaintChannelFromWavelet(&ch,&sfx,6,7,0); printPaint("wavelet",6);
    return 0;
}
