// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

typedef struct svEntity_s {
  struct svEntity_s *nextEntityInWorldSector;
} svEntity_t;

typedef struct worldSector_s {
  int axis;
  float dist;
  struct worldSector_s *children[2];
  svEntity_t *entities;
} worldSector_t;

#define AREA_NODES 64
worldSector_t sv_worldSectors[AREA_NODES];

void Com_Printf(const char *format, ...) {
  va_list arguments;
  va_start(arguments, format);
  vprintf(format, arguments);
  va_end(arguments);
}

#include "server_world_sectorlist_under_test.inc"

static svEntity_t entities[7];

static void chain(int sector, int first, int count) {
  int index;
  sv_worldSectors[sector].entities = &entities[first];
  for (index = 0; index < count; index++) {
    entities[first + index].nextEntityInWorldSector =
        index + 1 < count ? &entities[first + index + 1] : NULL;
  }
}

int main(void) {
  memset(sv_worldSectors, 0, sizeof(sv_worldSectors));
  memset(entities, 0, sizeof(entities));
  chain(0, 0, 3);
  chain(7, 3, 1);
  chain(30, 4, 2);
  SV_SectorList_f();
  return 0;
}
