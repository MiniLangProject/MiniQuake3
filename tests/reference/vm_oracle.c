/* SPDX-License-Identifier: GPL-2.0-or-later
 * Test-only harness for the unmodified original QVM interpreter.
 */
#include "vm_local.h"
#include <stdint.h>

vm_t *currentVM;
int vm_debugLevel;
void QDECL Com_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Error(int code, const char *fmt, ...) {
    va_list args; va_start(args, fmt); vfprintf(stderr, fmt, args); va_end(args); exit(20 + code);
}
void *Hunk_Alloc(int size, ha_pref pref) { (void)pref; return calloc(1, size); }
void VM_Debug(int level) { (void)level; }
const char *VM_ValueToSymbol(vm_t *vm, int value) { (void)vm; (void)value; return "test"; }

static int QDECL syscall_test(int *args) { return args[0] * 17 + args[1] + args[2]; }

int main(int argc, char **argv) {
    int index;
    FILE *out;
    if (argc < 3 || !(out = fopen(argv[1], "wb"))) return 2;
    for(index=2; index<argc; index++) {
        FILE *input = fopen(argv[index], "rb");
        vmHeader_t *header;
        vm_t vm;
        int length, size, args[10] = {7,11,13,17,19,23,29,31,37,41};
        int result;
        if(getenv("MQ3_VM_COMMAND")) args[0]=atoi(getenv("MQ3_VM_COMMAND"));
        if(!input) return 3;
        fseek(input,0,SEEK_END); length=ftell(input); rewind(input);
        header=(vmHeader_t *)malloc(length);
        if(fread(header,1,length,input)!=(size_t)length) return 4;
        fclose(input); memset(&vm,0,sizeof(vm));
        size=1;
        while(size<header->dataLength+header->litLength+header->bssLength) size<<=1;
        vm.dataBase=(byte *)calloc(1,size);
        vm.dataMask=size-1; vm.programStack=size; vm.stackBottom=size-65536;
        memcpy(vm.dataBase,(byte *)header+header->dataOffset,header->dataLength+header->litLength);
        vm.codeLength=header->codeLength;
        vm.instructionPointers=(int *)calloc(header->instructionCount,4);
        vm.systemCall=syscall_test; currentVM=&vm;
        VM_PrepareInterpreter(&vm,header);
        result=VM_CallInterpreted(&vm,args);
        fwrite(&result,4,1,out);
        fwrite(vm.dataBase,64,1,out);
        free(vm.dataBase); free(vm.codeBase); free(vm.instructionPointers); free(header);
    }
    fclose(out); return 0;
}
