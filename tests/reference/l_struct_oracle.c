#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stddef.h>

#define qtrue 1
#define qfalse 0
typedef int qboolean;
#define TT_STRING 1
#define TT_LITERAL 2
#define TT_NUMBER 3
#define TT_NAME 4
#define TT_PUNCTUATION 5
#define TT_FLOAT 0x0800
#define TT_INTEGER 0x1000
#define MAX_STRINGFIELD 80
#define FT_CHAR 1
#define FT_INT 2
#define FT_FLOAT 3
#define FT_STRING 4
#define FT_STRUCT 6
#define FT_TYPE 0x00ff
#define FT_ARRAY 0x0100
#define FT_BOUNDED 0x0200
#define FT_UNSIGNED 0x0400
#define Maximum(x,y) ((x)>(y)?(x):(y))
#define Minimum(x,y) ((x)<(y)?(x):(y))

typedef struct token_s { int type,subtype; long int intvalue; double floatvalue; char string[1024]; } token_t;
typedef struct source_s { token_t tokens[128]; int count,pos,last,errors; } source_t;
struct structdef_s;
typedef struct fielddef_s { char *name; int offset,type,maxarray; float floatmin,floatmax; struct structdef_s *substruct; } fielddef_t;
typedef struct structdef_s { int size; fielddef_t *fields; } structdef_t;

static token_t tok(int type,int subtype,const char *text,long integer,double floating) {
 token_t value; memset(&value,0,sizeof(value)); value.type=type; value.subtype=subtype; value.intvalue=integer; value.floatvalue=floating; strcpy(value.string,text); return value;
}
static void add(source_t *source,token_t value) { source->tokens[source->count++]=value; }
int PC_ExpectAnyToken(source_t *source,token_t *token) { if(source->pos>=source->count)return 0;source->last=source->pos;*token=source->tokens[source->pos++];return 1; }
void PC_UnreadLastToken(source_t *source) { source->pos=source->last; }
int PC_ExpectTokenType(source_t *source,int type,int subtype,token_t *token) { (void)subtype;if(!PC_ExpectAnyToken(source,token))return 0;if(token->type!=type){source->errors++;return 0;}return 1; }
int PC_ExpectTokenString(source_t *source,const char *text) { token_t token;if(!PC_ExpectAnyToken(source,&token))return 0;if(strcmp(token.string,text)){source->errors++;return 0;}return 1; }
int PC_CheckTokenString(source_t *source,const char *text) { token_t token;if(!PC_ExpectAnyToken(source,&token))return 0;if(!strcmp(token.string,text))return 1;PC_UnreadLastToken(source);return 0; }
void SourceError(source_t *source,const char *format,...) { (void)format;source->errors++; }
void StripSingleQuotes(char *text) { (void)text; }
void StripDoubleQuotes(char *text) { (void)text; }

#include "l_struct_under_test.inc"

typedef struct record_s { char letter; int count; float ratio; char title[MAX_STRINGFIELD]; int values[3]; } record_t;
static fielddef_t fields[]={
 {"letter",offsetof(record_t,letter),FT_CHAR,0,0,0,NULL},
 {"count",offsetof(record_t,count),FT_INT,0,0,0,NULL},
 {"ratio",offsetof(record_t,ratio),FT_FLOAT|FT_BOUNDED,0,-2.0f,2.0f,NULL},
 {"title",offsetof(record_t,title),FT_STRING,0,0,0,NULL},
 {"values",offsetof(record_t,values),FT_INT|FT_ARRAY,3,0,0,NULL},
 {NULL,0,0,0,0,0,NULL}
};
static structdef_t recorddef={sizeof(record_t),fields};

static void escaped(const char *label,const char *text) {
 printf("%s|",label);while(*text){unsigned char c=(unsigned char)*text++;if(c=='\r')printf("\\r");else if(c=='\n')printf("\\n");else if(c=='\t')printf("\\t");else putchar(c);}putchar('\n');
}
static void file_text(FILE *file,char *buffer,size_t size) { long length;fflush(file);length=ftell(file);rewind(file);if(length<0)length=0;if((size_t)length>=size)length=(long)size-1;fread(buffer,1,(size_t)length,file);buffer[length]=0; }
int main(void) {
 source_t source;record_t record;FILE *file;char output[4096];fielddef_t unsignedField={"u",0,FT_INT|FT_UNSIGNED,0,0,0,NULL};int number=0,result;
 memset(&source,0,sizeof(source));memset(&record,0,sizeof(record));
 add(&source,tok(TT_PUNCTUATION,0,"{",0,0));add(&source,tok(TT_NAME,0,"letter",0,0));add(&source,tok(TT_LITERAL,0,"Z",0,0));
 add(&source,tok(TT_NAME,0,"count",0,0));add(&source,tok(TT_PUNCTUATION,0,"-",0,0));add(&source,tok(TT_NUMBER,TT_INTEGER,"12",12,12));
 add(&source,tok(TT_NAME,0,"ratio",0,0));add(&source,tok(TT_NUMBER,TT_FLOAT,"1.5",1,1.5));
 add(&source,tok(TT_NAME,0,"title",0,0));add(&source,tok(TT_STRING,0,"arena",0,0));
 add(&source,tok(TT_NAME,0,"values",0,0));add(&source,tok(TT_PUNCTUATION,0,"{",0,0));
 add(&source,tok(TT_NUMBER,TT_INTEGER,"1",1,1));add(&source,tok(TT_PUNCTUATION,0,",",0,0));add(&source,tok(TT_NUMBER,TT_INTEGER,"2",2,2));add(&source,tok(TT_PUNCTUATION,0,",",0,0));add(&source,tok(TT_NUMBER,TT_INTEGER,"3",3,3));add(&source,tok(TT_PUNCTUATION,0,"}",0,0));add(&source,tok(TT_PUNCTUATION,0,"}",0,0));
 printf("find|%s|%s\n",FindField(fields,"count")->name,FindField(fields,"Count")?"bad":"none");
 result=ReadStructure(&source,&recorddef,(char*)&record);printf("read|%d|%d\n",result,source.errors);
 printf("values|%d|%d|%.6g|%s|%d,%d,%d\n",record.letter,record.count,record.ratio,record.title,record.values[0],record.values[1],record.values[2]);
 file=tmpfile();WriteFloat(file,1.5f);fputc('|',file);WriteFloat(file,2.0f);fputc('|',file);WriteFloat(file,-0.125f);file_text(file,output,sizeof(output));fclose(file);escaped("floats",output);
 file=tmpfile();WriteStructure(file,&recorddef,(char*)&record);file_text(file,output,sizeof(output));fclose(file);escaped("write",output);
 memset(&source,0,sizeof(source));add(&source,tok(TT_PUNCTUATION,0,"-",0,0));add(&source,tok(TT_NUMBER,TT_INTEGER,"1",1,1));result=ReadNumber(&source,&unsignedField,&number);printf("unsigned|%d|%d|%d\n",result,source.errors,number);
 return 0;
}
