/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for the unchanged DSoundError function from win_snd.c. */
#include <stdio.h>
#define DSERR_BUFFERLOST (-1)
#define DSERR_INVALIDCALL (-2)
#define DSERR_INVALIDPARAM (-3)
#define DSERR_PRIOLEVELNEEDED (-4)
#include "win_snd_under_test.inc"
int main(void) {
  int values[] = {DSERR_BUFFERLOST,DSERR_INVALIDCALL,DSERR_INVALIDPARAM,DSERR_PRIOLEVELNEEDED,17};
  int i;for(i=0;i<5;i++) printf("%s\n",DSoundError(values[i]));
  return 0;
}
