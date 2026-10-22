/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for unchanged Conbuf_AppendText extracted from win_syscon.c. */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
typedef intptr_t LPARAM;typedef void *HWND;
#define EM_SETSEL 1
#define EM_LINESCROLL 2
#define EM_SCROLLCARET 3
#define EM_REPLACESEL 4
typedef struct { HWND hwndBuffer; } WinConData;
static WinConData s_wcd;
static unsigned char captured[65536];static int capturedLen;
static long SendMessage(HWND window,int message,long a,LPARAM b){(void)window;(void)a;if(message==EM_SETSEL)capturedLen=0;if(message==EM_REPLACESEL){const char *text=(const char*)b;int length=(int)strlen(text);memcpy(captured+capturedLen,text,(size_t)length);capturedLen+=length;}return 0;}
static int Q_IsColorString(const char *text){return text[0]=='^'&&text[1]&&text[1]!='^';}
#include "win_syscon_under_test.inc"
static void dump(void){int i,limit=capturedLen<24?capturedLen:24;printf("%d",capturedLen);for(i=0;i<limit;i++)printf(" %u",captured[i]);printf("\n");capturedLen=0;}
int main(void){char large[16410];int i;Conbuf_AppendText("abc\n^1red\rx\n\ry");dump();Conbuf_AppendText("^^caret\n\rZ");dump();for(i=0;i<16409;i++)large[i]=(char)('a'+i%26);large[16409]=0;Conbuf_AppendText(large);dump();return 0;}
