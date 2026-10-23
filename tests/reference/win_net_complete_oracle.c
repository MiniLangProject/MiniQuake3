/* Unchanged selected win_net.c bodies are appended by the parity gate. */
#define WIN32_LEAN_AND_MEAN
#include <winsock2.h>
#include <ws2tcpip.h>
#include <wsipx.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef int qboolean;
#define qtrue 1
#define qfalse 0
enum { NA_BOT, NA_BAD, NA_LOOPBACK, NA_BROADCAST, NA_IP, NA_IPX, NA_BROADCAST_IPX };
typedef struct { int type; byte ip[4]; byte ipx[10]; unsigned short port; } netadr_t;
#define MAX_IPS 16
static int numIP;
static byte localIP[MAX_IPS][4];
#include "win_net_complete_under_test.inc"

static netadr_t ip(int a, int b, int c, int d, int port) {
    netadr_t value;
    memset(&value, 0, sizeof(value));
    value.type = NA_IP;
    value.ip[0]=(byte)a; value.ip[1]=(byte)b; value.ip[2]=(byte)c; value.ip[3]=(byte)d;
    value.port=htons((unsigned short)port);
    return value;
}
static void errors(void) {
    const int codes[] = { WSAEINTR, WSAEWOULDBLOCK, WSAECONNABORTED, WSAECONNRESET,
                          WSAEADDRINUSE, WSAHOST_NOT_FOUND, 12345 };
    unsigned i;
    printf("E");
    for (i=0;i<sizeof(codes)/sizeof(codes[0]);++i) {
        WSASetLastError(codes[i]); printf("|%s", NET_ErrorString());
    }
    putchar('\n');
}
static void addresses(void) {
    netadr_t source=ip(1,2,3,4,27960), round;
    struct sockaddr storage;
    NetadrToSockadr(&source,&storage); memset(&round,0,sizeof(round)); SockadrToNetadr(&storage,&round);
    printf("A|%d|%u.%u.%u.%u|%u\n",round.type,round.ip[0],round.ip[1],round.ip[2],round.ip[3],ntohs(round.port));
    memset(&source,0,sizeof(source)); source.type=NA_BROADCAST;source.port=htons(27961);NetadrToSockadr(&source,&storage);
    printf("B|%d|%08x|%u\n",storage.sa_family,(unsigned)ntohl(((struct sockaddr_in *)&storage)->sin_addr.s_addr),ntohs(((struct sockaddr_in *)&storage)->sin_port));
}
static void lan(void) {
    netadr_t loop={NA_LOOPBACK}, ipx={NA_IPX}, bad={NA_BAD};
    numIP=3;
    localIP[0][0]=10;localIP[0][1]=9;localIP[0][2]=8;localIP[0][3]=7;
    localIP[1][0]=172;localIP[1][1]=20;localIP[1][2]=1;localIP[1][3]=2;
    localIP[2][0]=192;localIP[2][1]=168;localIP[2][2]=7;localIP[2][3]=9;
    printf("L|%d%d%d%d%d%d%d%d\n",Sys_IsLANAddress(loop),Sys_IsLANAddress(ipx),Sys_IsLANAddress(bad),
      Sys_IsLANAddress(ip(127,0,0,1,1)),Sys_IsLANAddress(ip(10,22,1,1,1)),
      Sys_IsLANAddress(ip(172,30,4,5,1)),Sys_IsLANAddress(ip(192,168,99,1,1)),Sys_IsLANAddress(ip(8,8,8,8,1)));
}
int main(void) { WSADATA data;if(WSAStartup(MAKEWORD(2,2),&data))return 2;errors();addresses();lan();WSACleanup();return 0; }
