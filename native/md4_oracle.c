#define __VECTORC
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "../Quake-III-Arena-original-source/code/qcommon/md4.c"

int main(int argc, char **argv) {
    FILE *file;
    long size;
    unsigned char *data;
    int32_t key;
    if (argc != 3 || fopen_s(&file, argv[1], "rb") != 0) return 2;
    fseek(file, 0, SEEK_END); size = ftell(file); rewind(file);
    data = (unsigned char *)malloc(size ? (size_t)size : 1);
    if (size && fread(data, 1, (size_t)size, file) != (size_t)size) return 3;
    fclose(file); key = (int32_t)_strtoi64(argv[2], NULL, 0);
    printf("%d %d\n", (int32_t)Com_BlockChecksum(data, (int)size),
           (int32_t)Com_BlockChecksumKey(data, (int)size, key));
    free(data); return 0;
}
