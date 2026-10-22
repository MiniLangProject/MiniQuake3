#include <stdio.h>
typedef unsigned char byte;
#include "snd_wavelet_encode_under_test.inc"
int main(void) {
  short values[]={-32768,-30000,-1000,-1,0,1,1000,30000,32767};
  for (int i=0;i<9;i++) printf("%d %u\n",values[i],MuLawEncode(values[i]));
  return 0;
}
