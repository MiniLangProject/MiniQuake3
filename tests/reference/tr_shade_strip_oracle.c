/* Focused host for the unchanged Baseq3 R_DrawStripElements body. */
#include <assert.h>
#include <stdio.h>
#define APIENTRY
#define GL_TRIANGLE_STRIP 5
typedef int GLint;
typedef int glIndex_t;
typedef int qboolean;
#define qfalse 0
#define qtrue 1
static struct { int numVertexes; } tess = { 64 };
static int c_vertexes;
static int c_begins;
static int stream[128];
static int stream_count;
static void qglBegin(int mode) { (void)mode; stream[stream_count++] = -1; }
static void qglEnd(void) { stream[stream_count++] = -2; }
static void element(GLint index) { stream[stream_count++] = index; }
#include "tr_shade_strip_under_test.inc"

static void run(const char *name, const glIndex_t *indexes, int count) {
  int i;
  int old_begins = c_begins, old_vertexes = c_vertexes;
  stream_count = 0;
  R_DrawStripElements(count, indexes, element);
  printf("%s|%d,%d|", name, c_begins-old_begins, c_vertexes-old_vertexes);
  for (i=0; i<stream_count; ++i) printf("%s%d", i ? "," : "", stream[i]);
  putchar('\n');
}
int main(void) {
  static const glIndex_t empty[] = {0};
  static const glIndex_t tri[] = {0,1,2};
  static const glIndex_t odd[] = {0,1,2,2,1,3};
  static const glIndex_t even[] = {0,1,2,2,1,3,2,3,4};
  static const glIndex_t split[] = {0,1,2,4,5,6};
  run("empty",empty,0);run("tri",tri,3);run("odd",odd,6);run("even",even,9);run("split",split,6);
  return 0;
}
