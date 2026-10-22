/* Focused host for unchanged Baseq3 cl_ui.c FloatAsInt. */
#include <stdio.h>
#include <stdint.h>
#include "cl_ui_under_test.inc"
static void sample(uint32_t bits) { union { uint32_t u;float f; } value;value.u=bits;printf("%u|%d\n",bits,FloatAsInt(value.f)); }
int main(void) { sample(0);sample(0x80000000u);sample(0x3f800000u);sample(0xc0200000u);sample(0x7f800000u);sample(0x7fc12345u);return 0; }
