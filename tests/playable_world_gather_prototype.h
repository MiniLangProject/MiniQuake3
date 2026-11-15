/* SPDX-License-Identifier: GPL-2.0-or-later
 * The test DLL aliases the shipping gather primitive; comparison stays test-only. */
#ifndef MQ3_TEST_WORLD_GATHER_H
#define MQ3_TEST_WORLD_GATHER_H
#include <stdint.h>
#include <string.h>
#define PLAYABLE_API __declspec(dllexport)
#define playable_window_gather_world_records mq3_test_gather_world
#include "../native/playable_world_gather.h"
#undef playable_window_gather_world_records
#define GATHER_API __declspec(dllexport)
#define GATHER_MAX_RECORDS PLAYABLE_GATHER_MAX_RECORDS
#define GATHER_RECORD_BYTES PLAYABLE_GATHER_RECORD_BYTES
GATHER_API int mq3_test_world_records_equal(const unsigned char *left,int leftBytes,int leftCount,
        const unsigned char *right,int rightBytes,int rightCount) {
    if(leftCount<0 || rightCount!=leftCount || leftCount>GATHER_MAX_RECORDS || leftBytes<0 || rightBytes<0 ||
            leftCount>leftBytes/GATHER_RECORD_BYTES || rightCount>rightBytes/GATHER_RECORD_BYTES ||
            (!left && leftCount) || (!right && rightCount)) return 0;
    return !leftCount || !memcmp(left,right,(size_t)leftCount*GATHER_RECORD_BYTES);
}
#endif
