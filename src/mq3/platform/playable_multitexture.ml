// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang FFI wrapper for the preview's base-texture/lightmap raster path.
package mq3.platform.playable_multitexture

extern function drawNative(baseSlot as i32,lightmapSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,lu0 as double,lv0 as double,light0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,lu1 as double,lv1 as double,light1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,lu2 as double,lv2 as double,light2 as double,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_multitexture" returns void
extern function setStateNative(blendMode as i32,depthEqual as i32,depthWrite as i32) from "playable_window.dll" symbol "playable_window_set_raster_state" returns i32
extern function setAlphaTestNative(mode as i32) from "playable_window.dll" symbol "playable_window_set_alpha_test" returns i32

const BLEND_OPAQUE=0
const BLEND_ALPHA=1
const BLEND_ADD=2
const BLEND_FILTER=3
const ALPHA_TEST_NONE=0
const ALPHA_TEST_GT0=1
const ALPHA_TEST_LT128=2
const ALPHA_TEST_GE128=3

function setState(blendMode,depthEqual,depthWrite)
  equalValue=0;if depthEqual then equalValue=1 end if
  writeValue=0;if depthWrite then writeValue=1 end if
  if setStateNative(blendMode,equalValue,writeValue)==0 then return error(7488,"invalid preview raster state") end if
  return void
end function

function setAlphaTest(mode)
  if setAlphaTestNative(mode)==0 then return error(7488,"invalid preview alpha-test state") end if
  return void
end function

function draw(baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,b,baseB,lightmapB,lightB,c,baseC,lightmapC,lightC,red,green,blue)
  drawNative(baseSlot,lightmapSlot,a.x,a.y,a.depth,baseA[0],baseA[1],lightmapA[0],lightmapA[1],lightA,b.x,b.y,b.depth,baseB[0],baseB[1],lightmapB[0],lightmapB[1],lightB,c.x,c.y,c.depth,baseC[0],baseC[1],lightmapC[0],lightmapC[1],lightC,red,green,blue)
  return void
end function
