/* Host for unchanged, platform-independent qcommon/vm.c helpers. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#define QDECL
#define MAX_TOKEN_CHARS 1024
typedef unsigned char byte;
typedef intptr_t vmptr_t;
typedef struct vmSymbol_s { struct vmSymbol_s *next; int symValue; int profileCount; char symName[64]; } vmSymbol_t;
typedef struct vm_s {
    vmSymbol_t *symbols; byte *codeBase; int codeLength; int *instructionPointers;
    byte *dataBase; int dataMask; void *entryPoint;
} vm_t;
vm_t *currentVM;int vm_debugLevel;
static void Com_sprintf(char *output,int size,const char *format,...) { va_list args;va_start(args,format);_vsnprintf(output,(size_t)size,format,args);va_end(args);output[size-1]=0; }
#include "vm_complete_under_test.inc"

int main(void) {
    vmSymbol_t first={0,10,30,"first"},second={0,20,10,"second"};vm_t vm={0};
    byte code[32],data[32];int pointers[32]={0};vmSymbol_t *order[2];void *p;
    char sym0[64],sym1[64],sym2[64],sym3[64];
    first.next=&second;vm.symbols=&first;
    printf("hex|%d|%d|%d|%d\n",ParseHex(""),ParseHex("1aF"),ParseHex("zz1-2"),ParseHex("FFFFFFFF"));
    strcpy(sym0,VM_ValueToSymbol(&vm,10));strcpy(sym1,VM_ValueToSymbol(&vm,15));
    strcpy(sym2,VM_ValueToSymbol(&vm,20));strcpy(sym3,VM_ValueToSymbol(&vm,25));
    printf("sym|%s|%s|%s|%s\n",sym0,sym1,sym2,sym3);
    printf("func|%s|%s|lookup=%d|missing=%d\n",VM_ValueToFunctionSymbol(&vm,15)->symName,VM_ValueToFunctionSymbol(&vm,25)->symName,VM_SymbolToValue(&vm,"second"),VM_SymbolToValue(&vm,"SECOND"));
    vm.symbols=0;printf("nosym|%s|%d\n",VM_ValueToSymbol(&vm,7),VM_ValueToFunctionSymbol(&vm,7)->symValue);
    vm.symbols=&first;vm.codeBase=code;vm.codeLength=15;vm.instructionPointers=pointers;
    pointers[0]=(int)(intptr_t)(code+0);pointers[1]=(int)(intptr_t)(code+5);pointers[2]=(int)(intptr_t)(code+10);
    first.symValue=0;strcpy(first.symName,"start");second.symValue=1;strcpy(second.symName,"middle");
    printf("compiled|%s|%s|%s\n",VM_SymbolForCompiledPointer(&vm,code-1),VM_SymbolForCompiledPointer(&vm,code+6),VM_SymbolForCompiledPointer(&vm,code+15));
    vm.dataBase=data;vm.dataMask=15;vm.entryPoint=0;currentVM=&vm;
    p=VM_ArgPtr(0);printf("arg0|%d\n",p==0);p=VM_ArgPtr(35);printf("arg|%d\n",(int)((byte*)p-data));
    p=VM_ExplicitArgPtr(&vm,34);printf("explicit|%d\n",(int)((byte*)p-data));currentVM=0;printf("nocurrent|%d\n",VM_ArgPtr(3)==0);
    currentVM=&vm;vm.entryPoint=(void*)1;p=VM_ArgPtr(35);printf("nativearg|%d\n",(int)((byte*)p-data));
    printf("vm2c|%d\n",(int)(intptr_t)VM_VM2C((vmptr_t)1234,999));VM_Debug(7);printf("debug|%d\n",vm_debugLevel);
    order[0]=&first;order[1]=&second;first.profileCount=30;second.profileCount=10;
    printf("profilecmp|%d|%d|%d\n",VM_ProfileSort(&order[0],&order[1]),VM_ProfileSort(&order[1],&order[0]),VM_ProfileSort(&order[0],&order[0]));
    return 0;
}
