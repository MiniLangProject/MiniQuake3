/* Direct be_ai_weight.c FuzzyWeight_r differential scenarios. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define WT_BALANCE 1
typedef struct sep_s { int index,value,type; float weight,minweight,maxweight; struct sep_s *child,*next; } sep_t;
static float fuzzy(int *inventory,sep_t *fs){float scale,w1,w2;if(inventory[fs->index]<fs->value)return fs->child?fuzzy(inventory,fs->child):fs->weight;else if(fs->next){if(inventory[fs->index]<fs->next->value){w1=fs->child?fuzzy(inventory,fs->child):fs->weight;w2=fs->next->child?fuzzy(inventory,fs->next->child):fs->next->weight;scale=(float)(inventory[fs->index]-fs->value)/(float)(fs->next->value-fs->value);return scale*w1+(1-scale)*w2;}return fuzzy(inventory,fs->next);}return fs->weight;}
/* ReadWeightConfig's released weightFileList / bot_reloadcharacters policy. */
typedef struct config_s { int serial; char filename[64]; } config_t;
static config_t *files[128];
static int reload_characters,serial;
static config_t *read_config(const char *filename){int avail=-1,i;if(!reload_characters){for(i=0;i<128;i++){if(!files[i]){if(avail<0)avail=i;continue;}if(!strcmp(filename,files[i]->filename))return files[i];}if(avail<0)return NULL;}config_t *value=(config_t *)calloc(1,sizeof(*value));value->serial=++serial;strncpy(value->filename,filename,sizeof(value->filename)-1);if(!reload_characters)files[avail]=value;return value;}
static void free_config(config_t *value){if(reload_characters)free(value);}
int main(void){int inv[8]={0};sep_t b={2,20,0,40,40,40,0,0},a={2,10,WT_BALANCE,20,15,25,0,&b};int bad=0;inv[2]=5;bad+=fuzzy(inv,&a)!=20;inv[2]=10;bad+=fuzzy(inv,&a)!=40;inv[2]=15;bad+=fuzzy(inv,&a)!=30;inv[2]=20;bad+=fuzzy(inv,&a)!=40;inv[2]=30;bad+=fuzzy(inv,&a)!=40;
  config_t *cached_a=read_config("bots/sarge_i.c"),*cached_b=read_config("bots/sarge_i.c");bad+=cached_a!=cached_b;reload_characters=1;config_t *fresh_a=read_config("bots/sarge_i.c"),*fresh_b=read_config("bots/sarge_i.c");bad+=fresh_a==fresh_b;bad+=fresh_a==cached_a||fresh_b==cached_a;free_config(fresh_a);free_config(fresh_b);reload_characters=0;bad+=read_config("bots/sarge_i.c")!=cached_a;
  for(int i=1;i<128;i++){char name[64];sprintf(name,"profile%d.c",i);bad+=read_config(name)==NULL;}bad+=serial!=130;bad+=read_config("overflow.c")!=NULL;reload_characters=1;config_t *overflow=read_config("overflow.c");bad+=overflow==NULL;free_config(overflow);
  if(bad){printf("FAIL: %d\n",bad);return 1;}puts("PASS: 12 native fuzzy-weight observations");return 0;}
