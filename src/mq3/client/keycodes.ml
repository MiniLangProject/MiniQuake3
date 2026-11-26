// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical key ABI from code/q3_ui/keycodes.h. Shared by the original UI host
// and native menu implementation so QVM and Win32 events use identical values.
package mq3.client.keycodes

const K_TAB=9
const K_ENTER=13
const K_ESCAPE=27
const K_SPACE=32
const K_BACKSPACE=127
const K_COMMAND=128
const K_CAPSLOCK=129
const K_POWER=130
const K_PAUSE=131
const K_UPARROW=132
const K_DOWNARROW=133
const K_LEFTARROW=134
const K_RIGHTARROW=135
const K_ALT=136
const K_CTRL=137
const K_SHIFT=138
const K_INS=139
const K_DEL=140
const K_PGDN=141
const K_PGUP=142
const K_HOME=143
const K_END=144
const K_F1=145
const K_F2=146
const K_F3=147
const K_F4=148
const K_F5=149
const K_F6=150
const K_F7=151
const K_F8=152
const K_F9=153
const K_F10=154
const K_F11=155
const K_F12=156
const K_F13=157
const K_F14=158
const K_F15=159
const K_KP_HOME=160
const K_KP_UPARROW=161
const K_KP_PGUP=162
const K_KP_LEFTARROW=163
const K_KP_5=164
const K_KP_RIGHTARROW=165
const K_KP_END=166
const K_KP_DOWNARROW=167
const K_KP_PGDN=168
const K_KP_ENTER=169
const K_KP_INS=170
const K_KP_DEL=171
const K_KP_SLASH=172
const K_KP_MINUS=173
const K_KP_PLUS=174
const K_KP_NUMLOCK=175
const K_KP_STAR=176
const K_KP_EQUALS=177
const K_MOUSE1=178
const K_MOUSE2=179
const K_MOUSE3=180
const K_MOUSE4=181
const K_MOUSE5=182
const K_MWHEELDOWN=183
const K_MWHEELUP=184
const K_JOY1=185
const K_JOY2=186
const K_JOY3=187
const K_JOY4=188
const K_JOY5=189
const K_JOY6=190
const K_JOY7=191
const K_JOY8=192
const K_JOY9=193
const K_JOY10=194
const K_JOY11=195
const K_JOY12=196
const K_JOY13=197
const K_JOY14=198
const K_JOY15=199
const K_JOY16=200
const K_JOY17=201
const K_JOY18=202
const K_JOY19=203
const K_JOY20=204
const K_JOY21=205
const K_JOY22=206
const K_JOY23=207
const K_JOY24=208
const K_JOY25=209
const K_JOY26=210
const K_JOY27=211
const K_JOY28=212
const K_JOY29=213
const K_JOY30=214
const K_JOY31=215
const K_JOY32=216
const K_AUX1=217
const K_AUX2=218
const K_AUX3=219
const K_AUX4=220
const K_AUX5=221
const K_AUX6=222
const K_AUX7=223
const K_AUX8=224
const K_AUX9=225
const K_AUX10=226
const K_AUX11=227
const K_AUX12=228
const K_AUX13=229
const K_AUX14=230
const K_AUX15=231
const K_AUX16=232
const K_LAST_KEY=233
const K_CHAR_FLAG=1024

/// Computes `key>=0 and key<K_LAST_KEY` for keycodes `isKeyNumber`.
/// @param key Key or control identifier used to select the corresponding keycodes entry.
function isKeyNumber(key) return key>=0 and key<K_LAST_KEY end function
/// Computes `(key&K_CHAR_FLAG)!=0` for keycodes `isCharacterEvent`.
/// @param key Key or control identifier used to select the corresponding keycodes entry.
function isCharacterEvent(key) return (key&K_CHAR_FLAG)!=0 end function
/// Computes `key&(~K_CHAR_FLAG)` for keycodes `characterCode`.
/// @param key Key or control identifier used to select the corresponding keycodes entry.
function characterCode(key) return key&(~K_CHAR_FLAG) end function
