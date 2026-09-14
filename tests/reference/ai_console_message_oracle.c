/* Direct be_ai_chat.c console-message lifecycle and QVM-layout oracle. */
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#define MAX_MESSAGE_SIZE 256
#define DEFAULT_MAX_MESSAGES 1024

typedef struct qvm_console_s {
    int32_t handle;
    float time;
    int32_t type;
    char message[MAX_MESSAGE_SIZE];
    uint32_t prev, next;
} qvm_console_t;

typedef struct node_s {
    int handle, type;
    float time;
    char message[MAX_MESSAGE_SIZE];
    struct node_s *prev, *next;
} node_t;

typedef struct { int handle, count; node_t *first, *last; } chat_t;
static node_t *heap, *freehead;
static int heap_capacity;

/* InitConsoleMessageHeap with the max_messages LibVar value supplied. */
static int init_heap(int max_messages) {
    int i;
    node_t *replacement;
    if (max_messages <= 0) return 0;
    replacement = (node_t *)calloc((size_t)max_messages, sizeof(*replacement));
    if (!replacement) return 0;
    free(heap);
    heap = replacement;
    heap_capacity = max_messages;
    for (i = 0; i < max_messages; ++i) {
        heap[i].prev = i ? &heap[i - 1] : NULL;
        heap[i].next = i + 1 < max_messages ? &heap[i + 1] : NULL;
    }
    freehead = heap;
    return 1;
}

static int free_count(void) {
    int count = 0;
    node_t *node;
    for (node = freehead; node; node = node->next) ++count;
    return count;
}

static void queue(chat_t *chat, int type, const char *text, float time) {
    node_t *message = freehead;
    if (!message) return;
    freehead = message->next;
    if (freehead) freehead->prev = NULL;
    if (++chat->handle <= 0 || chat->handle > 8192) chat->handle = 1;
    message->handle = chat->handle;
    message->time = time;
    message->type = type;
    strncpy(message->message, text, MAX_MESSAGE_SIZE);
    message->next = NULL;
    message->prev = chat->last;
    if (chat->last) chat->last->next = message;
    else chat->first = message;
    chat->last = message;
    ++chat->count;
}

static void remove_message(chat_t *chat, int handle) {
    node_t *message;
    for (message = chat->first; message; message = message->next) {
        if (message->handle != handle) continue;
        if (message->next) message->next->prev = message->prev;
        else chat->last = message->prev;
        if (message->prev) message->prev->next = message->next;
        else chat->first = message->next;
        if (freehead) freehead->prev = message;
        message->prev = NULL;
        message->next = freehead;
        freehead = message;
        --chat->count;
        break;
    }
}

#define CHECK(x) do { if (!(x)) { printf("FAIL %d\n", __LINE__); return 1; } } while (0)

int main(void) {
    chat_t chat = {0};
    CHECK(init_heap(DEFAULT_MAX_MESSAGES));
    CHECK(heap_capacity == 1024 && free_count() == 1024);

    queue(&chat, 0, "alpha", 12.5f);
    queue(&chat, 1, "bravo", 13.0f);
    CHECK(chat.count == 2 && chat.first->handle == 1 && chat.last->handle == 2);
    remove_message(&chat, 1);
    CHECK(chat.count == 1 && chat.first->handle == 2 && chat.first->time == 13.0f);
    chat.handle = 8192;
    queue(&chat, 7, "wrap", 14.0f);
    CHECK(chat.last->handle == 1 && chat.last->type == 7);
    CHECK(sizeof(qvm_console_t) == 276 && offsetof(qvm_console_t, message) == 12 && offsetof(qvm_console_t, prev) == 268);

    memset(&chat, 0, sizeof(chat));
    CHECK(init_heap(3));
    queue(&chat, 0, "one", 1.0f);
    queue(&chat, 0, "two", 2.0f);
    queue(&chat, 0, "three", 3.0f);
    queue(&chat, 0, "full", 4.0f);
    CHECK(chat.count == 3 && freehead == NULL);

    memset(&chat, 0, sizeof(chat));
    CHECK(init_heap(1));
    queue(&chat, 0, "one", 1.0f);
    queue(&chat, 0, "full", 2.0f);
    CHECK(chat.count == 1 && freehead == NULL);
    CHECK(!init_heap(0) && heap_capacity == 1);

    free(heap);
    puts("PASS: 6 native Baseq3 console-message scenarios / 15 exact observations");
    return 0;
}
