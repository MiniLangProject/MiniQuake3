#include <stdio.h>
#include <string.h>
#include "q_shared.h"
#include "cg_public.h"
#include "keycodes.h"

#define MAX_KEYS 256
typedef struct { int down; const char *binding; } key_t;
static key_t keys[MAX_KEYS];
static int catcher;

static int Key_IsDown(int keynum) {
  if (keynum < 0 || keynum >= MAX_KEYS) return 0;
  return keys[keynum].down;
}
static int Key_GetCatcher(void) { return catcher; }
static void Key_SetCatcher(int value) { catcher = value; }
static int Key_GetKey(const char *binding) {
  int i;
  if (!binding) return -1;
  for (i = 0; i < MAX_KEYS; i++) {
    if (keys[i].binding && !_stricmp(binding, keys[i].binding)) return i;
  }
  return -1;
}

static const char *key_name(int key) {
  static char text[5];
  static char numbered[8];
  static const char *keypad[] = {"KP_HOME","KP_UPARROW","KP_PGUP","KP_LEFTARROW","KP_5","KP_RIGHTARROW","KP_END","KP_DOWNARROW","KP_PGDN","KP_ENTER","KP_INS","KP_DEL","KP_SLASH","KP_MINUS","KP_PLUS","KP_NUMLOCK","KP_STAR","KP_EQUALS"};
  if (key == -1) return "<KEY NOT FOUND>";
  if (key < 0 || key > 255) return "<OUT OF RANGE>";
  if (key > 32 && key < 127 && key != '"' && key != ';') { text[0]=(char)key;text[1]=0;return text; }
  switch (key) {
    case K_TAB:return "TAB";case K_ENTER:return "ENTER";case K_ESCAPE:return "ESCAPE";case K_SPACE:return "SPACE";case K_BACKSPACE:return "BACKSPACE";
    case K_UPARROW:return "UPARROW";case K_DOWNARROW:return "DOWNARROW";case K_LEFTARROW:return "LEFTARROW";case K_RIGHTARROW:return "RIGHTARROW";
    case K_ALT:return "ALT";case K_CTRL:return "CTRL";case K_SHIFT:return "SHIFT";case K_COMMAND:return "COMMAND";case K_CAPSLOCK:return "CAPSLOCK";case K_PAUSE:return "PAUSE";
    case K_INS:return "INS";case K_DEL:return "DEL";case K_PGDN:return "PGDN";case K_PGUP:return "PGUP";case K_HOME:return "HOME";case K_END:return "END";
    case K_MWHEELUP:return "MWHEELUP";case K_MWHEELDOWN:return "MWHEELDOWN";case ';':return "SEMICOLON";
  }
  if (key>=K_F1 && key<=K_F12) {_snprintf_s(numbered,sizeof(numbered),_TRUNCATE,"F%d",key-K_F1+1);return numbered;}
  if (key>=K_KP_HOME && key<=K_KP_EQUALS) return keypad[key-K_KP_HOME];
  if (key>=K_MOUSE1 && key<=K_MOUSE5) {_snprintf_s(numbered,sizeof(numbered),_TRUNCATE,"MOUSE%d",key-K_MOUSE1+1);return numbered;}
  if (key>=K_JOY1 && key<=K_JOY32) {_snprintf_s(numbered,sizeof(numbered),_TRUNCATE,"JOY%d",key-K_JOY1+1);return numbered;}
  if (key>=K_AUX1 && key<=K_AUX16) {_snprintf_s(numbered,sizeof(numbered),_TRUNCATE,"AUX%d",key-K_AUX1+1);return numbered;}
  _snprintf_s(text,sizeof(text),_TRUNCATE,"0x%02x",key);return text;
}

static int key_number(const char *text) {
  int key;
  if (!text || !text[0]) return -1;
  if (!text[1]) return (unsigned char)text[0];
  if (strlen(text)==4 && text[0]=='0' && text[1]=='x') {
    int a=text[2],b=text[3];a=a>='0'&&a<='9'?a-'0':a>='a'&&a<='f'?a-'a'+10:0;b=b>='0'&&b<='9'?b-'0':b>='a'&&b<='f'?b-'a'+10:0;return a*16+b;
  }
  for (key=0;key<256;key++) if (!_stricmp(text,key_name(key))) return key;
  return -1;
}

int main(void) {
  printf("abi|%d|%d|%d|%d|%d\n", CG_KEY_ISDOWN, CG_KEY_GETCATCHER,
    CG_KEY_SETCATCHER, CG_KEY_GETKEY, MAX_KEYS);
  keys[13].down = 1;
  printf("down|%d|%d|%d\n", Key_IsDown(13), Key_IsDown(12), Key_IsDown(256));
  printf("catcher|%d|0|", Key_GetCatcher()); Key_SetCatcher(5);
  printf("%d\n", Key_GetCatcher());
  keys[178].binding = "+attack"; keys[32].binding = "+moveup";
  printf("binding|%d|%d\n", Key_GetKey("+ATTACK"), Key_GetKey("missing"));
  keys[15].binding = "+attack";
  printf("first|%d\n", Key_GetKey("+ATTACK"));
  keys[200].binding = "";
  printf("empty|%d\n", Key_GetKey(""));
  for (int key=-2; key<=256; ++key) {
    char name[64];strcpy_s(name,sizeof(name),key_name(key));
    printf("name|%d|%s|%d\n",key,name,key_number(name));
  }
  printf("parse|%d|%d|%d|%d\n",key_number("mouse5"),key_number("0x9d"),key_number("0xZZ"),key_number(""));
  return 0;
}
