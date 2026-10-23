/* SPDX-License-Identifier: GPL-2.0-or-later
 * Raw Windows UDP ABI only. Protocol and game policy stay in MiniLang.
 */
#define WIN32_LEAN_AND_MEAN
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0600
#endif
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#define API __declspec(dllexport)

API int mq3_udp_startup(void) {
    WSADATA data;
    return WSAStartup(MAKEWORD(2,2), &data);
}
API int mq3_udp_cleanup(void) { return WSACleanup() == 0 ? 0 : WSAGetLastError(); }
API int mq3_udp_last_error(void) { return WSAGetLastError(); }
API int mq3_udp_error_name(int code, char *output, int capacity) {
    const char *name = "NO ERROR";
#define MQ3_WSA_NAME(value) case value: name = #value; break
    switch (code) {
        MQ3_WSA_NAME(WSAEINTR); MQ3_WSA_NAME(WSAEBADF); MQ3_WSA_NAME(WSAEACCES);
        MQ3_WSA_NAME(WSAEDISCON); MQ3_WSA_NAME(WSAEFAULT); MQ3_WSA_NAME(WSAEINVAL);
        MQ3_WSA_NAME(WSAEMFILE); MQ3_WSA_NAME(WSAEWOULDBLOCK); MQ3_WSA_NAME(WSAEINPROGRESS);
        MQ3_WSA_NAME(WSAEALREADY); MQ3_WSA_NAME(WSAENOTSOCK); MQ3_WSA_NAME(WSAEDESTADDRREQ);
        MQ3_WSA_NAME(WSAEMSGSIZE); MQ3_WSA_NAME(WSAEPROTOTYPE); MQ3_WSA_NAME(WSAENOPROTOOPT);
        MQ3_WSA_NAME(WSAEPROTONOSUPPORT); MQ3_WSA_NAME(WSAESOCKTNOSUPPORT); MQ3_WSA_NAME(WSAEOPNOTSUPP);
        MQ3_WSA_NAME(WSAEPFNOSUPPORT); MQ3_WSA_NAME(WSAEAFNOSUPPORT); MQ3_WSA_NAME(WSAEADDRINUSE);
        MQ3_WSA_NAME(WSAEADDRNOTAVAIL); MQ3_WSA_NAME(WSAENETDOWN); MQ3_WSA_NAME(WSAENETUNREACH);
        MQ3_WSA_NAME(WSAENETRESET); MQ3_WSA_NAME(WSAECONNABORTED); MQ3_WSA_NAME(WSAECONNRESET);
        MQ3_WSA_NAME(WSAENOBUFS); MQ3_WSA_NAME(WSAEISCONN); MQ3_WSA_NAME(WSAENOTCONN);
        MQ3_WSA_NAME(WSAESHUTDOWN); MQ3_WSA_NAME(WSAETOOMANYREFS); MQ3_WSA_NAME(WSAETIMEDOUT);
        MQ3_WSA_NAME(WSAECONNREFUSED); MQ3_WSA_NAME(WSAELOOP); MQ3_WSA_NAME(WSAENAMETOOLONG);
        MQ3_WSA_NAME(WSAEHOSTDOWN); MQ3_WSA_NAME(WSASYSNOTREADY); MQ3_WSA_NAME(WSAVERNOTSUPPORTED);
        MQ3_WSA_NAME(WSANOTINITIALISED); MQ3_WSA_NAME(WSAHOST_NOT_FOUND); MQ3_WSA_NAME(WSATRY_AGAIN);
        MQ3_WSA_NAME(WSANO_RECOVERY); MQ3_WSA_NAME(WSANO_DATA);
        default: break;
    }
#undef MQ3_WSA_NAME
    if (output == NULL || capacity <= 0) return WSAEINVAL;
    if (snprintf(output, (size_t)capacity, "%s", name) < 0) return WSAEINVAL;
    output[capacity - 1] = '\0';
    return 0;
}
API uintptr_t mq3_udp_socket(void) {
    SOCKET socketHandle = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    u_long nonblocking = 1;
    if (socketHandle == INVALID_SOCKET) return (uintptr_t)INVALID_SOCKET;
    if (ioctlsocket(socketHandle, FIONBIO, &nonblocking) != 0) {
        closesocket(socketHandle); return (uintptr_t)INVALID_SOCKET;
    }
    return (uintptr_t)socketHandle;
}
API int mq3_udp_set_broadcast(uintptr_t raw, int enabled) {
    BOOL value = enabled ? TRUE : FALSE;
    if (setsockopt((SOCKET)raw, SOL_SOCKET, SO_BROADCAST,
                   (const char *)&value, sizeof(value)) == SOCKET_ERROR) {
        return WSAGetLastError();
    }
    return 0;
}
API int mq3_udp_resolve_ipv4(const wchar_t *name, uint32_t *address) {
    ADDRINFOW hints;
    PADDRINFOW result = NULL;
    PADDRINFOW current;
    int code;
    if (name == NULL || name[0] == L'\0' || address == NULL) return WSAEINVAL;
    ZeroMemory(&hints, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_DGRAM;
    hints.ai_protocol = IPPROTO_UDP;
    code = GetAddrInfoW(name, NULL, &hints, &result);
    if (code != 0) return code;
    for (current = result; current != NULL; current = current->ai_next) {
        if (current->ai_family == AF_INET &&
            current->ai_addrlen >= (int)sizeof(struct sockaddr_in)) {
            const struct sockaddr_in *resolved =
                (const struct sockaddr_in *)current->ai_addr;
            *address = ntohl(resolved->sin_addr.s_addr);
            FreeAddrInfoW(result);
            return 0;
        }
    }
    FreeAddrInfoW(result);
    return WSAHOST_NOT_FOUND;
}
API int mq3_udp_bind(uintptr_t raw, uint32_t address, uint32_t port) {
    struct sockaddr_in localAddress;
    localAddress.sin_family = AF_INET;
    localAddress.sin_addr.s_addr = htonl(address);
    localAddress.sin_port = htons((u_short)port);
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
    target.sin_port = htons((u_short)port);
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
static int send_all(SOCKET socketHandle, const unsigned char *data, int length) {
    int sent = 0;
    while (sent < length) {
        int result = send(socketHandle, (const char *)data + sent, length - sent, 0);
        if (result == SOCKET_ERROR) return WSAGetLastError();
        if (result == 0) return WSAECONNRESET;
        sent += result;
    }
    return 0;
}
static int recv_all(SOCKET socketHandle, unsigned char *data, int length) {
    int received = 0;
    while (received < length) {
        int result = recv(socketHandle, (char *)data + received, length - received, 0);
        if (result == SOCKET_ERROR) return WSAGetLastError();
        if (result == 0) return WSAECONNRESET;
        received += result;
    }
    return 0;
}
static int narrow_ascii(const wchar_t *text, unsigned char *output, int capacity) {
    int count;
    if (text == NULL || output == NULL || capacity < 1) return -1;
    count = WideCharToMultiByte(CP_UTF8, 0, text, -1, (char *)output, capacity, NULL, NULL);
    if (count < 1 || count > capacity) return -1;
    return count - 1;
}
API uintptr_t mq3_udp_socks5_open(const wchar_t *server, uint32_t serverPort,
                                  const wchar_t *username, const wchar_t *password,
                                  uint32_t udpPort, uint32_t *relay) {
    ADDRINFOW hints;
    PADDRINFOW result = NULL;
    PADDRINFOW current;
    SOCKET control = INVALID_SOCKET;
    unsigned char request[520];
    unsigned char response[10];
    unsigned char user[256];
    unsigned char pass[256];
    int userLength;
    int passLength;
    int code;
    wchar_t portText[16];
    if (server == NULL || server[0] == L'\0' || relay == NULL || serverPort > 65535 || udpPort > 65535) {
        WSASetLastError(WSAEINVAL); return (uintptr_t)INVALID_SOCKET;
    }
    _snwprintf_s(portText, sizeof(portText) / sizeof(portText[0]), _TRUNCATE, L"%u", (unsigned)serverPort);
    ZeroMemory(&hints, sizeof(hints)); hints.ai_family = AF_INET; hints.ai_socktype = SOCK_STREAM; hints.ai_protocol = IPPROTO_TCP;
    code = GetAddrInfoW(server, portText, &hints, &result);
    if (code != 0) { WSASetLastError(code); return (uintptr_t)INVALID_SOCKET; }
    for (current = result; current != NULL; current = current->ai_next) {
        control = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        if (control == INVALID_SOCKET) break;
        if (connect(control, current->ai_addr, (int)current->ai_addrlen) == 0) break;
        closesocket(control); control = INVALID_SOCKET;
    }
    FreeAddrInfoW(result);
    if (control == INVALID_SOCKET) return (uintptr_t)INVALID_SOCKET;
    userLength = narrow_ascii(username == NULL ? L"" : username, user, (int)sizeof(user));
    passLength = narrow_ascii(password == NULL ? L"" : password, pass, (int)sizeof(pass));
    if (userLength < 0 || passLength < 0 || userLength > 255 || passLength > 255) { code = WSAEINVAL; goto fail; }
    request[0] = 5; request[1] = (userLength || passLength) ? 2 : 1; request[2] = 0;
    if (request[1] == 2) request[3] = 2;
    code = send_all(control, request, request[1] + 2); if (code) goto fail;
    code = recv_all(control, response, 2); if (code) goto fail;
    if (response[0] != 5 || (response[1] != 0 && response[1] != 2)) { code = WSAEACCES; goto fail; }
    if (response[1] == 2) {
        request[0] = 1; request[1] = (unsigned char)userLength; memcpy(request + 2, user, (size_t)userLength);
        request[2 + userLength] = (unsigned char)passLength; memcpy(request + 3 + userLength, pass, (size_t)passLength);
        code = send_all(control, request, 3 + userLength + passLength); if (code) goto fail;
        code = recv_all(control, response, 2); if (code) goto fail;
        if (response[0] != 1 || response[1] != 0) { code = WSAEACCES; goto fail; }
    }
    request[0]=5;request[1]=3;request[2]=0;request[3]=1;request[4]=0;request[5]=0;request[6]=0;request[7]=0;
    request[8]=(unsigned char)((udpPort>>8)&255);request[9]=(unsigned char)(udpPort&255);
    code=send_all(control,request,10);if(code)goto fail;code=recv_all(control,response,10);if(code)goto fail;
    if(response[0]!=5||response[1]!=0||response[3]!=1){code=WSAEACCES;goto fail;}
    relay[0]=((uint32_t)response[4]<<24)|((uint32_t)response[5]<<16)|((uint32_t)response[6]<<8)|response[7];
    relay[1]=((uint32_t)response[8]<<8)|response[9];
    return (uintptr_t)control;
fail:
    closesocket(control);WSASetLastError(code);return (uintptr_t)INVALID_SOCKET;
}
API int mq3_udp_wait_readable(uintptr_t raw, int milliseconds) {
    fd_set readers;
    struct timeval timeout;
    int result;
    if (milliseconds < 0) return WSAEINVAL;
    FD_ZERO(&readers);
    FD_SET((SOCKET)raw, &readers);
    timeout.tv_sec = milliseconds / 1000;
    timeout.tv_usec = (milliseconds % 1000) * 1000;
    result = select(0, &readers, NULL, NULL, &timeout);
    return result == SOCKET_ERROR ? -WSAGetLastError() : result;
}
API int mq3_udp_local_ipv4_count(uint32_t *addresses, int capacity) {
    char hostname[256];
    struct addrinfo hints;
    struct addrinfo *result = NULL;
    struct addrinfo *current;
    int count = 0;
    int code;
    if (addresses == NULL || capacity < 0) return -WSAEINVAL;
    if (gethostname(hostname, (int)sizeof(hostname)) == SOCKET_ERROR) return -WSAGetLastError();
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_DGRAM;
    code = getaddrinfo(hostname, NULL, &hints, &result);
    if (code != 0) return -code;
    for (current = result; current != NULL && count < capacity; current = current->ai_next) {
        const struct sockaddr_in *value;
        int duplicate = 0;
        int index;
        if (current->ai_family != AF_INET || current->ai_addrlen < (int)sizeof(struct sockaddr_in)) continue;
        value = (const struct sockaddr_in *)current->ai_addr;
        for (index = 0; index < count; ++index) {
            if (addresses[index] == ntohl(value->sin_addr.s_addr)) { duplicate = 1; break; }
        }
        if (!duplicate) addresses[count++] = ntohl(value->sin_addr.s_addr);
    }
    freeaddrinfo(result);
    return count;
}
