#include <stdio.h>

#define QM_ACTIVATED 3
#define ID_OK 101
#define QGR_STATUS_NEW 0
#define QGR_STATUS_SPECTATOR 1
#define QGR_STATUS_ACTIVE 2
#define QGR_STATUS_VALIDATING 3
#define QGR_STATUS_PENDING 4
#define QGR_STATUS_LEAVING 5
#define QGR_STATUS_NO_USER 6
#define QGR_STATUS_BAD_PASSWORD 7
#define QGR_STATUS_USER_EXISTS 8
#define QGR_STATUS_NO_MEMBERSHIP 9
#define QGR_STATUS_TIMEOUT 10
#define QGR_STATUS_INVALIDUSER 11
#define QGR_STATUS_ERROR 12

typedef int grank_status_t;
typedef struct { int id; } menucommon_s;

static grank_status_t s_status;
static char sequence[16];
static int sequence_len;

static void append(char value) {
    sequence[sequence_len++] = value;
    sequence[sequence_len] = '\0';
}

static void UI_PopMenu(void) { append('P'); }
static void UI_RankingsMenu(void) { append('R'); }
static void UI_LoginMenu(void) { append('L'); }
static void UI_SignupMenu(void) { append('S'); }

#include "ui_rankstatus_under_test.inc"

static void run(int status, int event) {
    menucommon_s item = { ID_OK };
    s_status = status;
    sequence_len = 0;
    sequence[0] = '\0';
    RankStatus_MenuEvent(&item, event);
    printf("%d %d %s\n", status, event, sequence);
}

int main(void) {
    run(QGR_STATUS_BAD_PASSWORD, 1);
    run(QGR_STATUS_NO_USER, QM_ACTIVATED);
    run(QGR_STATUS_BAD_PASSWORD, QM_ACTIVATED);
    run(QGR_STATUS_USER_EXISTS, QM_ACTIVATED);
    run(QGR_STATUS_ACTIVE, QM_ACTIVATED);
    return 0;
}
