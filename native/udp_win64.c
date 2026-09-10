/* SPDX-License-Identifier: GPL-2.0-or-later
 * Raw Windows UDP ABI only. Protocol and game policy stay in MiniLang.
 */
#define WIN32_LEAN_AND_MEAN
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdint.h>
#define API __declspec(dllexport)

API int mq3_udp_startup(void) {
    WSADATA data;
    return WSAStartup(MAKEWORD(2,2), &data);
}
API int mq3_udp_cleanup(void) { return WSACleanup() == 0 ? 0 : WSAGetLastError(); }
API uintptr_t mq3_udp_socket(void) {
    SOCKET socketHandle = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    u_long nonblocking = 1;
    if (socketHandle == INVALID_SOCKET) return (uintptr_t)INVALID_SOCKET;
    if (ioctlsocket(socketHandle, FIONBIO, &nonblocking) != 0) {
        closesocket(socketHandle); return (uintptr_t)INVALID_SOCKET;
    }
    return (uintptr_t)socketHandle;
}
API int mq3_udp_bind(uintptr_t raw, uint32_t address, uint32_t port) {
    struct sockaddr_in localAddress;
    localAddress.sin_family = AF_INET;
    localAddress.sin_addr.s_addr = htonl(address);
    localAddress.sin_port = htons(port);
    if (bind((SOCKET)raw, (const struct sockaddr *)&localAddress, sizeof(localAddress)) == SOCKET_ERROR) return WSAGetLastError();
    return 0;
}
static int local_address(uintptr_t raw, struct sockaddr_in *address) {
    int size = sizeof(*address);
    if (getsockname((SOCKET)raw, (struct sockaddr *)address, &size) == SOCKET_ERROR) return WSAGetLastError();
    return 0;
}
API uint32_t mq3_udp_local_address(uintptr_t raw) {
    struct sockaddr_in address;
    if (local_address(raw, &address) != 0) return 0;
    return ntohl(address.sin_addr.s_addr);
}
API int mq3_udp_local_port(uintptr_t raw) {
    struct sockaddr_in address;
    int result = local_address(raw, &address);
    if (result != 0) return -result;
    return ntohs(address.sin_port);
}
API int mq3_udp_send(uintptr_t raw, uint32_t address, uint32_t port, const unsigned char *data, int length) {
    struct sockaddr_in target;
    int result;
    target.sin_family = AF_INET;
    target.sin_addr.s_addr = htonl(address);
    target.sin_port = htons(port);
    result = sendto((SOCKET)raw, (const char *)data, length, 0, (const struct sockaddr *)&target, sizeof(target));
    return result == SOCKET_ERROR ? -WSAGetLastError() : result;
}
API int mq3_udp_recv(uintptr_t raw, unsigned char *data, int capacity, uint32_t *metadata) {
    struct sockaddr_in source;
    int sourceSize = sizeof(source);
    int result = recvfrom((SOCKET)raw, (char *)data, capacity, 0, (struct sockaddr *)&source, &sourceSize);
    if (result == SOCKET_ERROR) {
        int code = WSAGetLastError();
        if (code == WSAEWOULDBLOCK) return -2;
        return -code;
    }
    metadata[0] = ntohl(source.sin_addr.s_addr);
    metadata[1] = ntohs(source.sin_port);
    return result;
}
API int mq3_udp_close(uintptr_t raw) { return closesocket((SOCKET)raw) == 0 ? 0 : WSAGetLastError(); }
