/* Direct be_ai_chat.c setup/message-format oracle. */
#include <stdio.h>
#include <string.h>
#define ESCAPE_CHAR 1
#define CHAT_GENDERLESS 0
#define CHAT_GENDERFEMALE 1
#define CHAT_GENDERMALE 2
typedef struct { int gender,client; char name[32],message[256]; } chatstate_t;
static void set_gender(chatstate_t *s,int gender){switch(gender){case CHAT_GENDERFEMALE:s->gender=1;break;case CHAT_GENDERMALE:s->gender=2;break;default:s->gender=0;break;}}
static void set_name(chatstate_t *s,const char *name,int client){s->client=client;memset(s->name,0,sizeof(s->name));strncpy(s->name,name,sizeof(s->name));s->name[sizeof(s->name)-1]=0;}
static void fixed(chatstate_t *s,const char *v){strcat(s->message,v);} static void variable(chatstate_t *s,int v){sprintf(s->message+strlen(s->message),"%cv%d%c",ESCAPE_CHAR,v,ESCAPE_CHAR);} static void random_ref(chatstate_t *s,const char *v){sprintf(s->message+strlen(s->message),"%cr%s%c",ESCAPE_CHAR,v,ESCAPE_CHAR);}
#define CHECK(x) do { if(!(x)){printf("FAIL %d\n",__LINE__);return 1;} } while(0)
int main(void){chatstate_t s={0};fixed(&s,"Hello ");variable(&s,1);fixed(&s," ");random_ref(&s,"neutral");CHECK(!memcmp(s.message,"Hello \1v1\1 \1rneutral\1",20));set_gender(&s,2);CHECK(s.gender==2);set_gender(&s,99);CHECK(s.gender==0);set_name(&s,"12345678901234567890123456789012345",7);CHECK(strlen(s.name)==31&&s.client==7);puts("PASS: 4 native Baseq3 chat setup scenarios / 8 exact observations");return 0;}
