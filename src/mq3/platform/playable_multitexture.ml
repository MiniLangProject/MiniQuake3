// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang FFI wrapper for the preview's base-texture/lightmap raster path.
package mq3.platform.playable_multitexture

/// Draws one triangle with separate base-texture and lightmap coordinates.
/// @param baseSlot Texture slot for the base material.
/// @param lightmapSlot Texture slot for the lightmap.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param depth0 Depth for vertex 0.
/// @param u0 U texture coordinate for vertex 0.
/// @param v0 V texture coordinate for vertex 0.
/// @param lu0 U lightmap coordinate for vertex 0.
/// @param lv0 V lightmap coordinate for vertex 0.
/// @param light0 Light intensity for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param depth1 Depth for vertex 1.
/// @param u1 U texture coordinate for vertex 1.
/// @param v1 V texture coordinate for vertex 1.
/// @param lu1 U lightmap coordinate for vertex 1.
/// @param lv1 V lightmap coordinate for vertex 1.
/// @param light1 Light intensity for vertex 1.
/// @param x2 X coordinate for vertex 2.
/// @param y2 Y coordinate for vertex 2.
/// @param depth2 Depth for vertex 2.
/// @param u2 U texture coordinate for vertex 2.
/// @param v2 V texture coordinate for vertex 2.
/// @param lu2 U lightmap coordinate for vertex 2.
/// @param lv2 V lightmap coordinate for vertex 2.
/// @param light2 Light intensity for vertex 2.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
extern function drawNative(baseSlot as i32,lightmapSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,lu0 as double,lv0 as double,light0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,lu1 as double,lv1 as double,light1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,lu2 as double,lv2 as double,light2 as double,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_multitexture" returns void
/// Applies native blending, equal-depth testing, and depth-write settings.
/// @param blendMode Preview blend-mode constant or encoded generic source/destination blend factors.
/// @param depthEqual 0 for the normal depth comparison; 1 for the equal-depth pass.
/// @param depthWrite 1 enables depth writes; 0 disables them.
/// @returns 1 when the raster state is accepted; 0 for invalid settings.
extern function setStateNative(blendMode as i32,depthEqual as i32,depthWrite as i32) from "playable_window.dll" symbol "playable_window_set_raster_state" returns i32
/// Selects the native alpha-test mode used by subsequent primitives.
/// @param mode 0 disables alpha testing; 1 tests >0, 2 tests <128, and 3 tests >=128.
/// @returns 1 when the alpha-test mode is accepted; 0 for an invalid mode.
extern function setAlphaTestNative(mode as i32) from "playable_window.dll" symbol "playable_window_set_alpha_test" returns i32
/// Selects clamp-to-edge versus repeating texture coordinates for native drawing.
/// @param enabled Nonzero enables the requested native feature.
/// @returns 1 when the clamp mode is accepted; 0 for an invalid mode.
extern function setTextureClampNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_texture_clamp" returns i32
/// Enables or disables polygon offset for native depth rendering.
/// @param enabled Nonzero enables the requested native feature.
/// @returns 1 when the polygon-offset request is accepted; 0 for invalid input.
extern function setPolygonOffsetNative(enabled as i32) from "playable_window.dll" symbol "playable_window_set_polygon_offset" returns i32

/// Blend mode that replaces destination color with the source color.
const BLEND_OPAQUE=0
/// Blend mode using source alpha and one minus source alpha as color factors.
const BLEND_ALPHA=1
/// Blend mode that adds source and destination colors.
const BLEND_ADD=2
/// Blend mode that multiplies source and destination colors.
const BLEND_FILTER=3
/// Blend mode using destination color and one minus destination alpha as factors.
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA=4
/// Blend mode combining a dynamic-light contribution with existing surface color.
const BLEND_DYNAMIC_LIGHT=5
/// Blend mode multiplying destination color by one minus the source color for impact marks.
const BLEND_MARK=6
/// Blend mode combining premultiplied source color with destination color scaled by one minus source
/// alpha.
const BLEND_PREMULTIPLIED_ALPHA=7
// Generic OpenGL blend state.  Low nibble is GLS_SRCBLEND_*, high nibble is
// GLS_DSTBLEND_* and bit 8 distinguishes it from the optimized legacy modes.
const BLEND_GL_STATE=256
/// Alpha-test selector that accepts all fragment alpha values.
const ALPHA_TEST_NONE=0
/// Alpha-test selector that accepts alpha values greater than zero.
const ALPHA_TEST_GT0=1
/// Alpha-test selector that accepts byte alpha values below 128.
const ALPHA_TEST_LT128=2
/// Alpha-test selector that accepts byte alpha values of at least 128.
const ALPHA_TEST_GE128=3

/// Converts depth flags to native integers and applies the blend/depth raster state.
/// @param blendMode Value forwarded as `blendMode` to `mq3.platform.playable_multitexture.setStateNative`.
/// @param depthEqual Input tested by `depthEqual`.
/// @param depthWrite Input tested by `depthWrite`.
function setState(blendMode,depthEqual,depthWrite)
  equalValue=0;if depthEqual then equalValue=1 end if
  writeValue=0;if depthWrite then writeValue=1 end if
  if setStateNative(blendMode,equalValue,writeValue)==0 then return error(7488,"invalid preview raster state") end if
  return void
end function

/// Computes `BLEND_GL_STATE|srcFactor|dstFactor` for `mq3.platform.playable_multitexture.glBlend`.
/// @param srcFactor Input used in the result expression `BLEND_GL_STATE|srcFactor|dstFactor`.
/// @param dstFactor Input used in the result expression `BLEND_GL_STATE|srcFactor|dstFactor`.
function glBlend(srcFactor,dstFactor) return BLEND_GL_STATE|srcFactor|dstFactor end function

/// Returns `void` from `mq3.platform.playable_multitexture.setAlphaTest`; earlier branches return `error(7488,"invalid preview alpha-test state")`.
/// @param mode Value forwarded as `mode` to `mq3.platform.playable_multitexture.setAlphaTestNative`.
function setAlphaTest(mode)
  if setAlphaTestNative(mode)==0 then return error(7488,"invalid preview alpha-test state") end if
  return void
end function

/// Returns `void` from `mq3.platform.playable_multitexture.setTextureClamp`; earlier branches return `error(7488,"invalid preview texture clamp state")`.
/// @param enabled Input tested by `enabled`.
function setTextureClamp(enabled)
  value=0;if enabled then value=1 end if
  if setTextureClampNative(value)==0 then return error(7488,"invalid preview texture clamp state") end if
  return void
end function

/// Returns `void` from `mq3.platform.playable_multitexture.setPolygonOffset`; earlier branches return `error(7488,"invalid preview polygon-offset state")`.
/// @param enabled Input tested by `enabled`.
function setPolygonOffset(enabled)
  value=0;if enabled then value=1 end if
  if setPolygonOffsetNative(value)==0 then return error(7488,"invalid preview polygon-offset state") end if
  return void
end function

/// Expands three projected vertices and their base/lightmap UVs into the native multitexture triangle call.
/// @param baseSlot Value forwarded as `baseSlot` to `mq3.platform.playable_multitexture.drawNative`.
/// @param lightmapSlot Value forwarded as `lightmapSlot` to `mq3.platform.playable_multitexture.drawNative`.
/// @param a Record providing `a.x`, `a.y`, `a.depth`.
/// @param baseA Indexed input read at `0`, `1`.
/// @param lightmapA Indexed input read at `0`, `1`.
/// @param lightA Value forwarded as `light0` to `mq3.platform.playable_multitexture.drawNative`.
/// @param b Record providing `b.x`, `b.y`, `b.depth`.
/// @param baseB Indexed input read at `0`, `1`.
/// @param lightmapB Indexed input read at `0`, `1`.
/// @param lightB Value forwarded as `light1` to `mq3.platform.playable_multitexture.drawNative`.
/// @param c Record providing `c.x`, `c.y`, `c.depth`.
/// @param baseC Indexed input read at `0`, `1`.
/// @param lightmapC Indexed input read at `0`, `1`.
/// @param lightC Value forwarded as `light2` to `mq3.platform.playable_multitexture.drawNative`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_multitexture.drawNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_multitexture.drawNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_multitexture.drawNative`.
function draw(baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,b,baseB,lightmapB,lightB,c,baseC,lightmapC,lightC,red,green,blue)
  drawNative(baseSlot,lightmapSlot,a.x,a.y,a.depth,baseA[0],baseA[1],lightmapA[0],lightmapA[1],lightA,b.x,b.y,b.depth,baseB[0],baseB[1],lightmapB[0],lightmapB[1],lightB,c.x,c.y,c.depth,baseC[0],baseC[1],lightmapC[0],lightmapC[1],lightC,red,green,blue)
  return void
end function
