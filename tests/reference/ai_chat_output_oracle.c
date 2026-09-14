/* Released be_ai_chat.c behavior oracle for traps 513..516. */
#include <stdio.h>
#include <string.h>

typedef struct message_s { const char *text; float time; } message_t;
static message_t *choose(message_t *m,int count,float now,float random_value) {
  int i,n,available=0; message_t *best=0; float besttime=0;
  for(i=0;i<count;i++) if(m[i].time<=now) available++;
  if(available<=0){for(i=0;i<count;i++)if(!besttime||m[i].time<besttime){best=&m[i];besttime=m[i].time;}return best;}
  n=(int)(random_value*available);for(i=0;i<count;i++){if(m[i].time>now)continue;if(--n<0){m[i].time=now+20;return &m[i];}}
  return 0;
}
static message_t *choose_reply(message_t *m,int count,float now,float random_value) {
  int i,n,available=0;for(i=0;i<count;i++)if(m[i].time<=now)available++;
  n=(int)(random_value*available);for(i=0;i<count;i++){if(--n<0)return &m[i];if(m[i].time>now)continue;}return 0;
}
static int lower_float_priority_wins(void){float priority[]={5.9f,5.1f};int i,best=-1,selected=-1;for(i=0;i<2;i++)if(priority[i]>best){selected=i;best=(int)priority[i];}return selected==1&&best==5;}
static void remove_tildes(char *s){size_t i;for(i=0;s[i];i++)if(s[i]=='~')memmove(&s[i],&s[i+1],strlen(&s[i+1])+1);}
static void enter(char *out,size_t cap,int clientto,int sendto,char *message){remove_tildes(message);if(sendto==1)snprintf(out,cap,"say_team %s",message);else if(sendto==2)snprintf(out,cap,"tell %d %s",clientto,message);else snprintf(out,cap,"say %s",message);message[0]=0;}
int main(void){
  int checks=0;char out[256],msg[64];message_t a[]={{"head",200},{"middle",50},{"tail",300}};message_t zero[]={{"zero",0},{"ten",10},{"twenty",20}};message_t reply[]={{"recent",200},{"available",50}};message_t *m;
  m=choose(a,3,100,0.0f);checks+=(m==&a[1]);checks+=(a[1].time==120);
  m=choose(a,3,10,0.9f);checks+=(m==&a[1]);checks+=(a[1].time==120); /* oldest, no timestamp update */
  m=choose(zero,3,-1,0.0f);checks+=(m==&zero[1]);checks+=(zero[1].time==10); /* !besttime quirk */
  m=choose_reply(reply,2,100,0.0f);checks+=(m==&reply[0]);checks+=(m->time==200); /* --num precedes recent test */
  checks+=lower_float_priority_wins();
  strcpy_s(msg,sizeof(msg),"a~~b~c");enter(out,sizeof(out),0,1,msg);checks+=!strcmp(out,"say_team a~bc");checks+=(msg[0]==0);
  strcpy_s(msg,sizeof(msg),"hello");enter(out,sizeof(out),7,2,msg);checks+=!strcmp(out,"tell 7 hello");checks+=(msg[0]==0);
  strcpy_s(msg,sizeof(msg),"all");enter(out,sizeof(out),0,0,msg);checks+=!strcmp(out,"say all");checks+=(msg[0]==0);
  printf("PASS: %d native chat-output observations\n",checks);return checks==15?0:1;
}
