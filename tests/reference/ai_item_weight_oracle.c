/* Direct be_ai_weight.c FuzzyWeight_r differential scenarios. */
#include <stdio.h>
#define WT_BALANCE 1
typedef struct sep_s { int index,value,type; float weight,minweight,maxweight; struct sep_s *child,*next; } sep_t;
static float fuzzy(int *inventory,sep_t *fs){float scale,w1,w2;if(inventory[fs->index]<fs->value)return fs->child?fuzzy(inventory,fs->child):fs->weight;else if(fs->next){if(inventory[fs->index]<fs->next->value){w1=fs->child?fuzzy(inventory,fs->child):fs->weight;w2=fs->next->child?fuzzy(inventory,fs->next->child):fs->next->weight;scale=(float)(inventory[fs->index]-fs->value)/(float)(fs->next->value-fs->value);return scale*w1+(1-scale)*w2;}return fuzzy(inventory,fs->next);}return fs->weight;}
int main(void){int inv[8]={0};sep_t b={2,20,0,40,40,40,0,0},a={2,10,WT_BALANCE,20,15,25,0,&b};int bad=0;inv[2]=5;bad+=fuzzy(inv,&a)!=20;inv[2]=10;bad+=fuzzy(inv,&a)!=40;inv[2]=15;bad+=fuzzy(inv,&a)!=30;inv[2]=20;bad+=fuzzy(inv,&a)!=40;inv[2]=30;bad+=fuzzy(inv,&a)!=40;if(bad){printf("FAIL: %d\n",bad);return 1;}puts("PASS: 5 native fuzzy-weight observations");return 0;}
