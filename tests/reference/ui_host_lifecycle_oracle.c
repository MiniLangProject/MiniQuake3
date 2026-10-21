#include <stddef.h>
#include <stdio.h>
#include "q_shared.h"
#include "ui_public.h"

int main(void) {
    printf("%u|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u\n",
        (unsigned)sizeof(uiClientState_t),
        (unsigned)offsetof(uiClientState_t, connState),
        (unsigned)offsetof(uiClientState_t, connectPacketCount),
        (unsigned)offsetof(uiClientState_t, clientNum),
        (unsigned)offsetof(uiClientState_t, servername),
        (unsigned)offsetof(uiClientState_t, updateInfoString),
        (unsigned)offsetof(uiClientState_t, messageString),
        CA_UNINITIALIZED, CA_DISCONNECTED, CA_AUTHORIZING, CA_CONNECTING,
        CA_CHALLENGING, CA_CONNECTED, CA_ACTIVE);
    return 0;
}
