#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <windows.h>
#include <GL/gl.h>
#include "win_qgl_helpers_under_test.inc"

int main(void) {
    char blend[64];
    printf("bool=%s,%s,%s\n", BooleanToString(GL_FALSE), BooleanToString(GL_TRUE), BooleanToString(4));
    printf("func=%s,%s,%s\n", FuncToString(GL_ALWAYS), FuncToString(GL_LEQUAL), FuncToString(0xffff));
    printf("prim0=%s\n", PrimToString(GL_TRIANGLES));
    printf("prim1=%s\n", PrimToString(GL_QUADS));
    printf("prim2=%s\n", PrimToString(GL_LINE_LOOP));
    printf("cap=%s,%s,%s\n", CapToString(GL_TEXTURE_2D), CapToString(GL_BLEND), CapToString(GL_VERTEX_ARRAY));
    printf("type=%s,%s,%s\n", TypeToString(GL_UNSIGNED_BYTE), TypeToString(GL_FLOAT), TypeToString(0xffff));
    BlendToName(blend, GL_ONE_MINUS_SRC_ALPHA); printf("blend=%s\n", blend);
    return 0;
}
