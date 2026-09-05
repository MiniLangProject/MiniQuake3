// SPDX-License-Identifier: GPL-2.0-or-later
// Same double C runtime functions used by the original native Windows game.
// Engine operations and the placement of binary32 stores stay in MiniLang.
package mq3.compat.transcendental
extern function sin(value as double) from "ucrtbase.dll" returns double
extern function cos(value as double) from "ucrtbase.dll" returns double
extern function sqrt(value as double) from "ucrtbase.dll" returns double
extern function atan2(y as double,x as double) from "ucrtbase.dll" returns double
