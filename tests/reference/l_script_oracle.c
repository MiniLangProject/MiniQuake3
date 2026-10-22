/* Executes the unchanged code/botlib/l_script.c scanner with only host stubs. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SCREWUP
#define QDECL
#define MAX_QPATH 64
#define Com_Memset memset
#define Com_Memcpy memcpy
#define Com_sprintf snprintf
int COM_Compress(char *data) { return (int)strlen(data); }
void *GetMemory(unsigned long size) { return malloc((size_t)size); }
void *GetClearedMemory(unsigned long size) { return calloc(1, (size_t)size); }
void FreeMemory(void *ptr) { free(ptr); }
#include "../../Quake-III-Arena-original-source/code/botlib/l_script.c"

static void require(int condition, const char *message) {
    if (!condition) { fprintf(stderr, "FAIL: %s\n", message); exit(1); }
}

int main(void) {
    int count = 0;
    char input[] = "name 0x1a 0b101 077 89 3.25uL //c\n\"one\" \"two\" 'x' >>= $";
    script_t *s = LoadScriptMemory(input, (int)strlen(input), "memory");
    token_t t;
    require(PS_ReadToken(s,&t) && t.type==TT_NAME && !strcmp(t.string,"name") && t.subtype==4,"name"); count++;
    require(PS_ReadToken(s,&t) && t.subtype==(TT_HEX|TT_INTEGER) && t.intvalue==26,"hex"); count++;
    require(PS_ReadToken(s,&t) && t.subtype==(TT_BINARY|TT_INTEGER) && t.intvalue==5,"binary"); count++;
    require(PS_ReadToken(s,&t) && t.subtype==(TT_OCTAL|TT_INTEGER) && t.intvalue==63,"octal"); count++;
    require(PS_ReadToken(s,&t) && t.subtype==(TT_DECIMAL|TT_INTEGER) && t.intvalue==89,"decimal"); count++;
    require(PS_ReadToken(s,&t) && (t.subtype&TT_FLOAT) && t.floatvalue==3.25,"float"); count++;
    require(PS_ReadToken(s,&t) && t.type==TT_NAME && !strcmp(t.string,"uL"),"float suffix remains"); count++;
    require(PS_ReadToken(s,&t) && t.type==TT_STRING && !strcmp(t.string,"\"onetwo\"") && t.linescrossed==1,"joined string"); count++;
    require(PS_ReadToken(s,&t) && t.type==TT_LITERAL && !strcmp(t.string,"'x'") && t.subtype==3,"quoted literal"); count++;
    require(PS_ReadToken(s,&t) && t.subtype==P_RSHIFT_ASSIGN,"punctuation"); count++;
    require(!strcmp(PunctuationFromNum(s,P_DOLLAR),"$") && PS_ReadToken(s,&t) && t.subtype==P_DOLLAR,"punctuation lookup"); count++;
    require(EndOfScript(s),"end"); count++;
    ResetScript(s); require(!EndOfScript(s) && GetScriptFlags(s)==0,"reset"); count++;
    require(PS_CheckTokenString(s,"name") && !PS_CheckTokenString(s,"wrong"),"check string"); count++;
    require(PS_ReadToken(s,&t) && !strcmp(t.string,"0x1a"),"check rewind"); count++;
    PS_UnreadLastToken(s); require(PS_ReadToken(s,&t) && !strcmp(t.string,"0x1a"),"unread last"); count++;
    strcpy(t.string,"custom");t.type=TT_NAME;PS_UnreadToken(s,&t);require(PS_ReadToken(s,&t)&&!strcmp(t.string,"custom"),"unread token");count++;
    ResetScript(s);require(PS_ExpectTokenString(s,"name"),"expect string");count++;
    require(PS_ExpectTokenType(s,TT_NUMBER,TT_HEX|TT_INTEGER,&t)&&t.intvalue==26,"expect type");count++;
    require(PS_CheckTokenType(s,TT_NUMBER,TT_BINARY,&t)&&t.intvalue==5,"check type");count++;
    require(PS_SkipUntilString(s,"$"),"skip until");count++;
    { char q[]="\"hello\"", one[]="'q'";StripDoubleQuotes(q);StripSingleQuotes(one);require(!strcmp(q,"hello")&&!strcmp(one,"q"),"strip quotes");count++; }
    { char signedData[]="- 12 2.5";script_t *v=LoadScriptMemory(signedData,8,"signed");require(ReadSignedInt(v)==-12&&ReadSignedFloat(v)==2.5,"signed");FreeScript(v);count++; }
    { unsigned long iv;long double fv;NumberValue("0b1011",TT_BINARY,&iv,&fv);require(iv==11&&fv==11.0,"number value");count++; }
    { char raw[]="0b11";script_t *v=LoadScriptMemory(raw,4,"legacy flags");SetScriptFlags(v,SCFL_NOBINARYNUMBERS|SCFL_NONUMBERVALUES);require(PS_ReadToken(v,&t)&&t.intvalue==3&&(t.subtype&TT_BINARY),"legacy flags inert");FreeScript(v);count++; }
    { char raw[]="alpha/beta; x";script_t *v=LoadScriptMemory(raw,13,"primitive");SetScriptFlags(v,SCFL_PRIMITIVE);require(PS_ReadToken(v,&t)&&!strcmp(t.string,"alpha/beta"),"primitive");FreeScript(v);count++; }
    { char white[]=" \t/*x*/\nname";script_t *v=LoadScriptMemory(white,13,"white");require(PS_ReadToken(v,&t)&&t.linescrossed==1,"white line");require(PS_NextWhiteSpaceChar(v)==' '&&PS_NextWhiteSpaceChar(v)=='\t',"white iterator");FreeScript(v);count+=2; }
    { char skip[]="a /* b */ target rest";script_t *v=LoadScriptMemory(skip,21,"skip");require(ScriptSkipTo(v,"target")&&PS_ReadToken(v,&t)&&!strcmp(t.string,"target"),"skip to");FreeScript(v);count++; }
    { punctuation_t custom[]={{"@",91,NULL},{"@@",90,NULL},{NULL,0,NULL}};char raw[]="@@ @";script_t *v=LoadScriptMemory(raw,4,"custom");SetScriptPunctuations(v,custom);require(PS_ReadToken(v,&t)&&t.subtype==90&&PS_ReadToken(v,&t)&&t.subtype==91,"custom longest");FreeScript(v);count++; }
    { char raw[]="\"a\\n\"";script_t *v=LoadScriptMemory(raw,5,"flags");SetScriptFlags(v,SCFL_NOSTRINGESCAPECHARS|SCFL_NOSTRINGWHITESPACES);require(PS_ReadToken(v,&t)&&!strcmp(t.string,"\"a\\n\"")&&GetScriptFlags(v)==12,"string flags");FreeScript(v);count++; }
    require(NumLinesCrossed(s)>=0,"lines crossed");count++;
    FreeScript(s);
    printf("PASS: %d unchanged-C l_script observations\n",count);
    return 0;
}
