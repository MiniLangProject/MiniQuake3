#include <stdio.h>
#define K_CHAR_FLAG 1024
#define EXEC_APPEND 2
typedef int sfxHandle_t;
static int commands;
static void trap_Cmd_ExecuteText(int when,const char *text){(void)when;(void)text;commands++;}
#include "ui_credits_under_test.inc"
int main(void){int keys[]={65,K_CHAR_FLAG|65,13};for(int i=0;i<3;i++){commands=0;UI_CreditMenu_Key(keys[i]);printf("%d:%d\n",keys[i],commands);}return 0;}
