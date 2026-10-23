#include <stdio.h>
typedef unsigned char byte;
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define K_BACKSPACE 127
#define K_CAPSLOCK 129
#define K_PAUSE 131
#define K_UPARROW 132
#define K_DOWNARROW 133
#define K_LEFTARROW 134
#define K_RIGHTARROW 135
#define K_ALT 136
#define K_CTRL 137
#define K_SHIFT 138
#define K_INS 139
#define K_DEL 140
#define K_PGDN 141
#define K_PGUP 142
#define K_HOME 143
#define K_END 144
#define K_F1 145
#define K_F2 146
#define K_F3 147
#define K_F4 148
#define K_F5 149
#define K_F6 150
#define K_F7 151
#define K_F8 152
#define K_F9 153
#define K_F10 154
#define K_F11 155
#define K_F12 156
#define K_KP_HOME 160
#define K_KP_UPARROW 161
#define K_KP_PGUP 162
#define K_KP_LEFTARROW 163
#define K_KP_5 164
#define K_KP_RIGHTARROW 165
#define K_KP_END 166
#define K_KP_DOWNARROW 167
#define K_KP_PGDN 168
#define K_KP_ENTER 169
#define K_KP_INS 170
#define K_KP_DEL 171
#define K_KP_SLASH 172
#define K_KP_MINUS 173
#define K_KP_PLUS 174
#define K_KP_NUMLOCK 175
#define K_KP_STAR 176
#include "win_wndproc_mapkey_under_test.inc"
int main(void) {
    static const int values[] = { 0x00100000,0x01480000,0x00480000,0x011c0000,0x01350000,0x01450000,0x003b0000,0x00580000,0x00800000 };
    unsigned i; for (i=0;i<sizeof(values)/sizeof(values[0]);++i) printf("%08x|%d\n",values[i],MapKey(values[i]));
    return 0;
}
