/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for unchanged functions extracted from win_gamma.c. */
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

typedef int qboolean;
typedef int BOOL;
typedef void *HDC;
typedef void *HWND;
typedef struct { unsigned int dwOSVersionInfoSize,dwMajorVersion,dwMinorVersion,dwBuildNumber,dwPlatformId; char text[128]; } OSVERSIONINFO;
typedef struct { int integer; } cvar_t;
typedef struct { int deviceSupportsGamma,driverType; } glconfig_t;
typedef struct { HDC hDC; } glwstate_t;
typedef struct { void (*Printf)(int,const char *,...); } refimport_t;

#define qfalse 0
#define qtrue 1
#define GLDRV_STANDALONE 1
#define VER_PLATFORM_WIN32_NT 2
#define PRINT_WARNING 2
#define HIBYTE(x) (((x)>>8)&255)

static unsigned short queryRamp[3][256],setRamp[3][256];
static unsigned short s_oldHardwareGamma[3][256];
static int queryOk=1,setCalls,warnings,w2k;
glconfig_t glConfig;
glwstate_t glw_state;
static cvar_t ignoreValue;
cvar_t *r_ignorehwgamma=&ignoreValue;

static void printStub(int level,const char *format,...) { (void)level;(void)format;warnings++; }
refimport_t ri={printStub};
static int set3dfx(HDC dc,void *ramp) { (void)dc;memcpy(setRamp,ramp,sizeof(setRamp));setCalls++;return 1; }
static int get3dfx(HDC dc,void *ramp) { (void)dc;memcpy(ramp,queryRamp,sizeof(queryRamp));return queryOk; }
int (*qwglSetDeviceGammaRamp3DFX)(HDC,void *)=0;
int (*qwglGetDeviceGammaRamp3DFX)(HDC,void *)=0;
HWND GetDesktopWindow(void) { return (HWND)1; }
HDC GetDC(HWND window) { (void)window;return (HDC)2; }
int ReleaseDC(HWND window,HDC dc) { (void)window;(void)dc;return 1; }
BOOL GetDeviceGammaRamp(HDC dc,void *ramp) { (void)dc;memcpy(ramp,queryRamp,sizeof(queryRamp));return queryOk; }
BOOL SetDeviceGammaRamp(HDC dc,void *ramp) { (void)dc;memcpy(setRamp,ramp,sizeof(setRamp));setCalls++;return 1; }
BOOL GetVersionEx(OSVERSIONINFO *info) { info->dwMajorVersion=w2k?5:10;info->dwPlatformId=VER_PLATFORM_WIN32_NT;return 1; }
void Com_DPrintf(const char *format,...) { (void)format; }
void Com_Printf(const char *format,...) { (void)format; }

#include "win_gamma_under_test.inc"

static void linear(void) { int c,i;for(c=0;c<3;c++)for(i=0;i<256;i++)queryRamp[c][i]=(unsigned short)(i<<8); }
int main(void) {
  unsigned char red[256],green[256],blue[256];int i;
  glw_state.hDC=(HDC)3;linear();WG_CheckHardwareGamma();
  printf("check %d %u %u %d\n",glConfig.deviceSupportsGamma,s_oldHardwareGamma[0][0],s_oldHardwareGamma[2][255],warnings);
  linear();queryRamp[0][255]=queryRamp[1][255]=queryRamp[2][255]=0;warnings=0;WG_CheckHardwareGamma();
  printf("broken %d %d\n",glConfig.deviceSupportsGamma,warnings);
  linear();queryRamp[0][181]=queryRamp[1][181]=queryRamp[2][181]=65535;warnings=0;WG_CheckHardwareGamma();
  printf("suspicious %u %u %u %d\n",s_oldHardwareGamma[0][181],s_oldHardwareGamma[1][254],s_oldHardwareGamma[2][255],warnings);
  linear();WG_CheckHardwareGamma();for(i=0;i<256;i++){red[i]=(unsigned char)(255-i);green[i]=(unsigned char)i;blue[i]=255;}w2k=0;setCalls=0;GLimp_SetGamma(red,green,blue);
  printf("set %u %u %u %u %d\n",setRamp[0][0],setRamp[0][255],setRamp[1][32],setRamp[2][0],setCalls);
  w2k=1;for(i=0;i<256;i++)red[i]=green[i]=blue[i]=255;GLimp_SetGamma(red,green,blue);
  printf("w2k %u %u %u %u\n",setRamp[0][0],setRamp[0][126],setRamp[0][127],setRamp[0][128]);
  linear();WG_CheckHardwareGamma();memset(setRamp,0,sizeof(setRamp));WG_RestoreGamma();
  printf("restore %u %u\n",setRamp[0][0],setRamp[2][255]);
  qwglSetDeviceGammaRamp3DFX=set3dfx;qwglGetDeviceGammaRamp3DFX=get3dfx;linear();WG_CheckHardwareGamma();setCalls=0;GLimp_SetGamma(red,green,blue);
  printf("3dfx %d %d %u\n",glConfig.deviceSupportsGamma,setCalls,setRamp[0][0]);
  return 0;
}
