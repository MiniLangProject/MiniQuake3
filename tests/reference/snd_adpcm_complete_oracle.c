#include <stdio.h>
#include <stdint.h>
struct adpcm_state { int sample; int index; };
#include "snd_adpcm_complete_under_test.inc"

static void run_case(const char *name, short *samples, int count, int sample, int index) {
  unsigned char output[64] = {0};
  struct adpcm_state state = {sample,index};
  S_AdpcmEncode(samples,(char *)output,count,&state);
  printf("%s %d %d",name,state.sample,state.index);
  for (int i=0;i<(count+1)/2;i++) printf(" %u",output[i]);
  printf("\n");
}
int main(void) {
  short a[]={0,1000,-1000,3000,-3000,32767,-32768,1234,-4567};
  short b[]={32767,32767,0,-32768,-1,1,12000,-12000};
  short c[]={100,101,99,98,102};
  run_case("zero",a,9,0,0);run_case("edge",b,8,-1234,44);run_case("odd",c,5,100,5);
  return 0;
}
