#include <stdio.h>
#include <stddef.h>
#include <windows.h>

typedef int qboolean;
typedef int sysEventType_t;
typedef struct { int value; } netadr_t;
typedef struct { int value; } msg_t;
typedef struct { int value; } usercmd_t;

#include "glw_win.h"
#include "win_local.h"
#define APSTUDIO_INVOKED
#include "resource.h"

#define FIELD(type, name) printf(#type "." #name "=%u\n", (unsigned)offsetof(type, name))

int main(void) {
    printf("glwstate_t.size=%u\n", (unsigned)sizeof(glwstate_t));
    FIELD(glwstate_t, wndproc); FIELD(glwstate_t, hDC); FIELD(glwstate_t, hGLRC);
    FIELD(glwstate_t, hinstOpenGL); FIELD(glwstate_t, allowdisplaydepthchange);
    FIELD(glwstate_t, pixelFormatSet); FIELD(glwstate_t, desktopBitsPixel);
    FIELD(glwstate_t, desktopWidth); FIELD(glwstate_t, desktopHeight);
    FIELD(glwstate_t, cdsFullscreen); FIELD(glwstate_t, log_fp);
    printf("WinVars_t.size=%u\n", (unsigned)sizeof(WinVars_t));
    FIELD(WinVars_t, reflib_library); FIELD(WinVars_t, reflib_active);
    FIELD(WinVars_t, hWnd); FIELD(WinVars_t, hInstance); FIELD(WinVars_t, activeApp);
    FIELD(WinVars_t, isMinimized); FIELD(WinVars_t, osversion); FIELD(WinVars_t, sysMsgTime);
    printf("versions=%u,%u\n", DIRECTSOUND_VERSION, DIRECTINPUT_VERSION);
    printf("resources=%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
        IDS_STRING1, IDI_ICON1, IDB_BITMAP1, IDB_BITMAP2, IDC_CURSOR1, IDC_CURSOR2,
        IDC_CURSOR3, _APS_NO_MFC, _APS_NEXT_RESOURCE_VALUE, _APS_NEXT_COMMAND_VALUE,
        _APS_NEXT_CONTROL_VALUE, _APS_NEXT_SYMED_VALUE);
    return 0;
}
