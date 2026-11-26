// SPDX-License-Identifier: GPL-2.0-or-later
// Same double C runtime functions used by the original native Windows game.
// Engine operations and the placement of binary32 stores stay in MiniLang.
package mq3.compat.transcendental
/// Compute the sine of an angle in radians.
/// @param value Angle in radians.
/// @returns The sine value.
extern function sin(value as double) from "ucrtbase.dll" returns double
/// Compute the cosine of an angle in radians.
/// @param value Angle in radians.
/// @returns The cosine value.
extern function cos(value as double) from "ucrtbase.dll" returns double
/// Compute a double-precision square root through the C runtime.
/// @param value Floating-point operand.
/// @returns The square-root result, with C-runtime domain handling for negative inputs.
extern function sqrt(value as double) from "ucrtbase.dll" returns double
/// Compute the quadrant-aware angle of the vector (x, y), in radians.
/// @param y Y coordinate of the direction.
/// @param x X coordinate of the direction.
/// @returns The principal angle in radians, with the quadrant determined by both arguments.
extern function atan2(y as double,x as double) from "ucrtbase.dll" returns double
