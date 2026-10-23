/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * This oracle includes the unmodified public and private QCommon headers. */
#include "q_shared.h"
#include "qcommon.h"
#include "cm_local.h"
#include "cm_patch.h"
#include "unzip.h"
#include <stddef.h>
#include <stdio.h>

#define S(t) printf("sizeof:%s=%u\n", #t, (unsigned)sizeof(t))
#define O(t, f) printf("offsetof:%s.%s=%u\n", #t, #f, (unsigned)offsetof(t, f))

int main(void) {
  printf("collision:%d,%d,%d,%.3f,%d,%d,%d,%d,%.3f,%.3f,%d,%d,%d,%d,%d,%.3f,%d,%.3f\n",
    MAX_SUBMODELS, BOX_MODEL_HANDLE, CAPSULE_MODEL_HANDLE, SURFACE_CLIP_EPSILON,
    MAX_FACETS, MAX_PATCH_PLANES, MAX_GRID_SIZE, SUBDIVIDE_DISTANCE,
    PLANE_TRI_EPSILON, WRAP_POINT_EPSILON, MAX_POINTS_ON_WINDING, SIDE_FRONT,
    SIDE_BACK, SIDE_ON, SIDE_CROSS, CLIP_EPSILON, MAX_MAP_BOUNDS, ON_EPSILON);
  printf("qcommon:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
    PACKET_BACKUP, PACKET_MASK, MAX_PACKET_USERCMDS, PORT_ANY,
    MAX_RELIABLE_COMMANDS, MAX_MSGLEN, MAX_DOWNLOAD_WINDOW,
    MAX_DOWNLOAD_BLKSIZE, PROTOCOL_VERSION, PORT_MASTER, PORT_UPDATE,
    PORT_AUTHORIZE, PORT_SERVER, NUM_SERVER_PORTS, FS_GENERAL_REF, FS_UI_REF,
    FS_CGAME_REF, FS_QAGAME_REF, NUM_ID_PAKS, MAX_FILE_HANDLES, MAX_EDIT_LINE,
    CPUID_GENERIC, CPUID_AXP, CPUID_INTEL_UNSUPPORTED, CPUID_INTEL_PENTIUM,
    CPUID_INTEL_MMX, CPUID_INTEL_KATMAI, CPUID_AMD_3DNOW, MAXPRINTMSG,
    HMAX, NYT, INTERNAL_NODE, SV_ENCODE_START, SV_DECODE_START);
  printf("protocol:%s,%s,%s,%s\n", UPDATE_SERVER_NAME, MASTER_SERVER_NAME,
    AUTHORIZE_SERVER_NAME, BASEGAME);
  printf("unzip:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n", UNZ_OK,
    UNZ_END_OF_LIST_OF_FILE, UNZ_EOF, UNZ_PARAMERROR, UNZ_BADZIPFILE,
    UNZ_INTERNALERROR, UNZ_CRCERROR, UNZ_CASESENSITIVE,
    UNZ_NOTCASESENSITIVE, UNZ_OSDEFAULTCASE);
  printf("enums:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
    NA_BOT, NA_BAD, NA_LOOPBACK, NA_BROADCAST, NA_IP, NA_IPX,
    NA_BROADCAST_IPX, NS_CLIENT, NS_SERVER, TAG_FREE, TAG_GENERAL,
    TAG_BOTLIB, TAG_RENDERER, TAG_SMALL, TAG_STATIC, MAX_JOYSTICK_AXIS);
  printf("vm:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
    VMI_NATIVE, VMI_BYTECODE, VMI_COMPILED, TRAP_MEMSET, TRAP_MEMCPY,
    TRAP_STRNCPY, TRAP_SIN, TRAP_COS, TRAP_ATAN2, TRAP_SQRT,
    TRAP_MATRIXMULTIPLY, TRAP_ANGLEVECTORS, TRAP_PERPENDICULARVECTOR,
    TRAP_FLOOR, TRAP_CEIL, TRAP_TESTPRINTINT, TRAP_TESTPRINTFLOAT);
  printf("events:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
    AXIS_SIDE, AXIS_FORWARD, AXIS_UP, AXIS_ROLL, AXIS_YAW, AXIS_PITCH,
    SE_NONE, SE_KEY, SE_CHAR, SE_MOUSE, SE_JOYSTICK_AXIS, SE_CONSOLE,
    SE_PACKET);
  S(msg_t); S(netadr_t); S(netchan_t); S(sysEvent_t); S(cNode_t); S(cLeaf_t);
  S(cmodel_t); S(cbrushside_t); S(cbrush_t); S(cPatch_t); S(cArea_t);
  S(sphere_t); S(traceWork_t); S(leafList_t); S(patchPlane_t); S(facet_t);
  S(patchCollide_t); S(cGrid_t); S(winding_t); S(tm_unz); S(unz_global_info);
  S(unz_file_info); S(z_stream); S(file_in_zip_read_info_s); S(unz_s);
  O(msg_t, bit); O(netadr_t, port); O(netchan_t, fragmentBuffer);
  O(netchan_t, unsentBuffer); O(traceWork_t, trace); O(traceWork_t, sphere);
  O(facet_t, borderNoAdjust); O(cGrid_t, points); O(unz_file_info, tmu_date);
  O(z_stream, adler); O(unz_s, pfile_in_zip_read); O(unz_s, tmpFile);
  return 0;
}
