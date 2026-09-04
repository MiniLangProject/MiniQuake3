/* SPDX-License-Identifier: GPL-2.0-or-later
 * MiniLang ABI conversion only. No Quake algorithms or engine state.
 */
#include <stdint.h>
#include <string.h>
#define API __declspec(dllexport)

API double mq3_f32(double value) { volatile float f = (float)value; return (double)f; }
API uint32_t mq3_float_bits(double value) {
    float f = (float)value;
    uint32_t bits;
    memcpy(&bits, &f, 4);
    return bits;
}
API double mq3_bits_float(uint32_t bits) {
    float f;
    memcpy(&f, &bits, 4);
    return (double)f;
}
