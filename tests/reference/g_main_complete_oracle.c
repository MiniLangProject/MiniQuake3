/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdio.h>
#include <stdint.h>
#define GAME_INIT 0
#define GAME_SHUTDOWN 1
#define GAME_CLIENT_CONNECT 2
#define GAME_CLIENT_BEGIN 3
#define GAME_CLIENT_USERINFO_CHANGED 4
#define GAME_CLIENT_DISCONNECT 5
#define GAME_CLIENT_COMMAND 6
#define GAME_CLIENT_THINK 7
#define GAME_RUN_FRAME 8
#define GAME_CONSOLE_COMMAND 9
#define BOTAI_START_FRAME 10
static int called=-1,a0=-1,a1=-1,a2=-1;
static void G_InitGame(int a,int b,int c){called=GAME_INIT;a0=a;a1=b;a2=c;}
static void G_ShutdownGame(int a){called=GAME_SHUTDOWN;a0=a;}
static char *ClientConnect(int a,int b,int c){called=GAME_CLIENT_CONNECT;a0=a;a1=b;a2=c;return (char *)(intptr_t)42;}
static void ClientBegin(int a){called=GAME_CLIENT_BEGIN;a0=a;}
static void ClientUserinfoChanged(int a){called=GAME_CLIENT_USERINFO_CHANGED;a0=a;}
static void ClientDisconnect(int a){called=GAME_CLIENT_DISCONNECT;a0=a;}
static void ClientCommand(int a){called=GAME_CLIENT_COMMAND;a0=a;}
static void ClientThink(int a){called=GAME_CLIENT_THINK;a0=a;}
static void G_RunFrame(int a){called=GAME_RUN_FRAME;a0=a;}
static int ConsoleCommand(void){called=GAME_CONSOLE_COMMAND;return 43;}
static int BotAIStartFrame(int a){called=BOTAI_START_FRAME;a0=a;return 44;}
#include "g_main_under_test.inc"
int main(void){
  int command;
  for(command=0;command<=11;command++){
    int value;
    called=-1;a0=-1;a1=-1;a2=-1;
    value=vmMain(command,100+command,200+command,300+command,0,0,0,0,0,0,0,0,0);
    printf("%d|%d|%d|%d|%d|%d\n",command,value,called,a0,a1,a2);
  }
  return 0;
}
