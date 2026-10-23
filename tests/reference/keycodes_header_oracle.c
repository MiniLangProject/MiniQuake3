#include <stdio.h>
#include "../../Quake-III-Arena-original-source/code/q3_ui/keycodes.h"
int main(void) {
  printf("ascii %d %d %d %d %d\n", K_TAB,K_ENTER,K_ESCAPE,K_SPACE,K_BACKSPACE);
  printf("system %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", K_COMMAND,K_CAPSLOCK,K_POWER,K_PAUSE,K_UPARROW,K_DOWNARROW,K_LEFTARROW,K_RIGHTARROW,K_ALT,K_CTRL,K_SHIFT,K_INS,K_DEL,K_PGDN,K_END,K_F15);
  printf("keypad %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", K_KP_HOME,K_KP_UPARROW,K_KP_PGUP,K_KP_LEFTARROW,K_KP_5,K_KP_RIGHTARROW,K_KP_END,K_KP_DOWNARROW,K_KP_PGDN,K_KP_ENTER,K_KP_INS,K_KP_DEL,K_KP_SLASH,K_KP_MINUS,K_KP_PLUS,K_KP_NUMLOCK,K_KP_STAR,K_KP_EQUALS);
  printf("devices %d %d %d %d %d %d %d %d %d %d %d %d %d\n", K_MOUSE1,K_MOUSE5,K_MWHEELDOWN,K_MWHEELUP,K_JOY1,K_JOY16,K_JOY17,K_JOY32,K_AUX1,K_AUX8,K_AUX16,K_LAST_KEY,K_CHAR_FLAG);
  printf("size %u\n", (unsigned)sizeof(keyNum_t));
  return 0;
}
