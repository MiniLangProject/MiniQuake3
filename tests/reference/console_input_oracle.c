// Differential harness for unchanged Baseq3 field editing and binding output.
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef int qboolean;
typedef int fileHandle_t;
#define qfalse 0
#define qtrue 1
#define MAX_EDIT_LINE 256
#define MAX_KEYS 256
#define K_SHIFT 138
#define K_CTRL 137
#define K_INS 139
#define K_DEL 140
#define K_RIGHTARROW 135
#define K_LEFTARROW 134
#define K_HOME 143
#define K_END 144
#define K_KP_INS 170
typedef struct { int cursor, scroll, widthInChars; char buffer[MAX_EDIT_LINE]; } field_t;
typedef struct { qboolean down; int repeats; char *binding; } qkey_t;
qkey_t keys[MAX_KEYS];
qboolean key_overstrikeMode;
static char output[4096];
void Field_Clear(field_t *edit) { memset(edit->buffer,0,sizeof(edit->buffer)); edit->cursor=edit->scroll=0; }
void Field_Paste(field_t *edit);
char *Key_KeynumToString(int key);
void FS_Printf(fileHandle_t f,const char *format,...) { va_list ap;(void)f;va_start(ap,format);vsnprintf(output+strlen(output),sizeof(output)-strlen(output),format,ap);va_end(ap); }

#include "console_input_under_test.inc"

void Field_Paste(field_t *edit) { (void)edit; }
char *Key_KeynumToString(int key) { static char one[2];if(key==32)return "SPACE";one[0]=(char)key;one[1]=0;return one; }
static void reset(field_t *f,int width) { memset(f,0,sizeof(*f));f->widthInChars=width;memset(keys,0,sizeof(keys));key_overstrikeMode=qfalse; }
static void dump(const char *label,field_t *f) { const unsigned char *p=(unsigned char*)f->buffer;printf("%s %d %d %d ",label,f->cursor,f->scroll,key_overstrikeMode);while(*p)printf("%02x",*p++);putchar('\n'); }
int main(void) {
 field_t f;reset(&f,3);Field_CharEvent(&f,'a');Field_CharEvent(&f,'b');Field_CharEvent(&f,'c');dump("insert",&f);
 Field_KeyDownEvent(&f,K_LEFTARROW);Field_KeyDownEvent(&f,K_DEL);dump("delete",&f);
 Field_KeyDownEvent(&f,K_INS);Field_CharEvent(&f,'Z');dump("overstrike",&f);
 Field_CharEvent(&f,1);dump("home",&f);Field_CharEvent(&f,5);Field_CharEvent(&f,8);dump("end-back",&f);
 reset(&f,5);strcpy(f.buffer,"abcdef");f.cursor=4;f.scroll=2;Field_KeyDownEvent(&f,K_HOME);Field_KeyDownEvent(&f,K_RIGHTARROW);dump("navigation",&f);
 keys['w'].binding="+forward";keys[32].binding="+moveup";Key_WriteBindings(1);printf("bindings ");for(unsigned char*p=(unsigned char*)output;*p;p++)printf("%02x",*p);putchar('\n');
 return 0;
}
