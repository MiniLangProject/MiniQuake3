// SPDX-License-Identifier: GPL-2.0-or-later
// Thin MiniLang boundary for the dependency-free Win32 preview window.
package mq3.platform.playable_window
import mq3.compat.numeric as numeric
import std.ds.list as lists

/// Creates the preview surface, starts its Win32 UI thread, and attempts OpenGL initialization.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @returns 1 when a window exists or creation succeeds; 0 on window/surface setup failure.
extern function create(width as i32,height as i32) from "playable_window.dll" symbol "playable_window_create" returns i32
/// Changes the live Win32 display mode and writes the resulting width, height, and fullscreen flag.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @param fullscreen Nonzero requests fullscreen mode; zero selects windowed mode.
/// @param frequency Requested display refresh frequency in hertz; zero keeps the default.
/// @param output Writable storage for three 32-bit integers: width, height, fullscreen.
/// @param capacity Number of 32-bit output elements; must be at least 3.
/// @returns 1 when the mode changes; 0 for invalid dimensions, missing window/output, or a failed request.
extern function setModeNative(width as i32,height as i32,fullscreen as i32,frequency as i32,output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_set_mode" returns i32
/// Configures the OpenGL driver, pixel format, and presentation settings before window creation.
/// @param driver Pointer to the UTF-8 OpenGL driver name; paired with driverLength.
/// @param driverLength Length of the UTF-8 driver-name buffer in bytes.
/// @param colorBits Requested color-buffer precision in bits.
/// @param depthBits Requested depth-buffer precision in bits.
/// @param stencilBits Requested stencil-buffer precision in bits.
/// @param stereo Nonzero enables the stereo pixel-format request.
/// @param fullscreen Nonzero requests fullscreen mode; zero selects windowed mode.
/// @param frequency Requested display refresh frequency in hertz; zero keeps the default.
/// @param swapInterval Swap interval passed to the OpenGL presentation layer.
/// @returns 1 when all three configuration steps succeed; 0 if any step rejects the request.
extern function glConfigureNative(driver as ptr,driverLength as i32,colorBits as i32,depthBits as i32,stencilBits as i32,stereo as i32,fullscreen as i32,frequency as i32,swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure" returns i32
/// Stores a UTF-8 OpenGL driver name before a native window exists.
/// @param driver Pointer to the UTF-8 OpenGL driver name; paired with driverLength.
/// @param driverLength Length of the UTF-8 driver-name buffer in bytes.
/// @returns 1 when the driver request is stored; 0 for invalid text or an already-created window.
extern function glConfigureDriverNative(driver as ptr,driverLength as i32) from "playable_window.dll" symbol "playable_window_gl_configure_driver" returns i32
/// Stores requested OpenGL color/depth/stencil precision and stereo mode before window creation.
/// @param colorBits Requested color-buffer precision in bits.
/// @param depthBits Requested depth-buffer precision in bits.
/// @param stencilBits Requested stencil-buffer precision in bits.
/// @param stereo Nonzero enables the stereo pixel-format request.
/// @returns 1 when accepted; 0 for negative precision values or an already-created window.
extern function glConfigurePixelFormatNative(colorBits as i32,depthBits as i32,stencilBits as i32,stereo as i32) from "playable_window.dll" symbol "playable_window_gl_configure_pixel_format" returns i32
/// Stores fullscreen, refresh-frequency, and swap-interval preferences before window creation.
/// @param fullscreen Nonzero requests fullscreen mode; zero selects windowed mode.
/// @param frequency Requested display refresh frequency in hertz; zero keeps the default.
/// @param swapInterval Swap interval passed to the OpenGL presentation layer.
/// @returns 1 when accepted; 0 for a negative frequency or an already-created window.
extern function glConfigureDisplayNative(fullscreen as i32,frequency as i32,swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure_display" returns i32
/// Reports whether the preview has an active OpenGL context.
/// @returns The native OpenGL-active flag.
extern function glAvailableNative() from "playable_window.dll" symbol "playable_window_gl_available" returns i32
/// Returns the selected Win32 OpenGL pixel-format identifier.
/// @returns The current pixel-format identifier.
extern function glPixelFormatNative() from "playable_window.dll" symbol "playable_window_gl_pixel_format" returns i32
/// Reports the selected native color-buffer precision.
/// @returns The color precision in bits.
extern function glColorBitsNative() from "playable_window.dll" symbol "playable_window_gl_color_bits" returns i32
/// Reports the selected native depth-buffer precision.
/// @returns The depth precision in bits.
extern function glDepthBitsNative() from "playable_window.dll" symbol "playable_window_gl_depth_bits" returns i32
/// Reports the selected native stencil-buffer precision.
/// @returns The stencil precision in bits.
extern function glStencilBitsNative() from "playable_window.dll" symbol "playable_window_gl_stencil_bits" returns i32
/// Reports the stored native stereo pixel-format setting.
/// @returns Nonzero when stereo is requested.
extern function glStereoNative() from "playable_window.dll" symbol "playable_window_gl_stereo" returns i32
/// Reports the stored native fullscreen setting.
/// @returns Nonzero when fullscreen is requested.
extern function glFullscreenNative() from "playable_window.dll" symbol "playable_window_gl_fullscreen" returns i32
/// Copies a selected OpenGL vendor, renderer, version, or extension string into a NUL-terminated buffer.
/// @param which String selector: 0 vendor, 1 renderer, 2 version, or 3 extensions.
/// @param output Writable UTF-8 buffer that receives a trailing NUL.
/// @param capacity Output capacity in bytes, including the trailing NUL.
/// @returns Bytes copied excluding the terminator, or -1 for an invalid selector/output buffer.
extern function glInfoNative(which as i32,output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_gl_info" returns i32
/// Tests an exact extension-name token in the active OpenGL extension string.
/// @param name Pointer to the extension-name bytes; no embedded terminator is required.
/// @param length Extension-name length in bytes; must be 1..255.
/// @returns 1 for an exact token match; 0 for no match, invalid name, or inactive OpenGL.
extern function glHasExtensionNative(name as ptr,length as i32) from "playable_window.dll" symbol "playable_window_gl_has_extension" returns i32
/// Stores the swap interval and applies it through the available WGL extension.
/// @param interval Requested OpenGL swap interval.
/// @returns Nonzero on success; without the extension only interval zero succeeds.
extern function glSwapIntervalNative(interval as i32) from "playable_window.dll" symbol "playable_window_gl_set_swap_interval" returns i32
/// Expands three 256-entry byte ramps to Win32 gamma ramps and applies them to the display.
/// @param red Pointer to at least 256 red-channel gamma bytes.
/// @param green Pointer to at least 256 green-channel gamma bytes.
/// @param blue Pointer to at least 256 blue-channel gamma bytes.
/// @param count Number of entries available in each ramp; at least 256.
/// @returns 1 when the gamma ramp is applied; 0 when unsupported, invalid, or rejected by Windows.
extern function glSetGammaNative(red as ptr,green as ptr,blue as ptr,count as i32) from "playable_window.dll" symbol "playable_window_gl_set_gamma" returns i32
/// Restores the saved display gamma ramp after a native gamma change.
extern function glRestoreGammaNative() from "playable_window.dll" symbol "playable_window_gl_restore_gamma" returns void
/// Restores or minimizes the preview window and updates native input activation.
/// @param active Nonzero activates the native window/input state; zero deactivates it.
extern function glActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_gl_activate" returns void
/// Presents the completed native OpenGL frame through its configured drawing backend.
extern function glEndFrameNative() from "playable_window.dll" symbol "playable_window_gl_end_frame" returns void
/// Copies a bounded byte comment to the Windows debug-output stream.
/// @param comment Read-only bytes passed to OutputDebugStringA.
/// @param length Comment byte length; the native boundary truncates to 1023 bytes.
extern function glLogCommentNative(comment as ptr,length as i32) from "playable_window.dll" symbol "playable_window_gl_log_comment" returns void
/// Preserves the polling entry point while the dedicated native UI thread pumps window messages.
extern function pollNative() from "playable_window.dll" symbol "playable_window_poll" returns void
/// Reads the native window-close request without consuming it.
/// @returns Nonzero when closing has been requested.
extern function shouldCloseNative() from "playable_window.dll" symbol "playable_window_should_close" returns i32
/// Converts a bounded UTF-8 title to UTF-16 and applies it to the live preview window.
/// @param title Pointer to the UTF-8 window title, without embedded NUL bytes.
/// @param length UTF-8 title length in bytes; must be 1..255.
/// @returns Nonzero when SetWindowTextW succeeds; 0 for invalid text or a missing window.
extern function setTitleNative(title as ptr,length as i32) from "playable_window.dll" symbol "playable_window_set_title_utf8" returns i32
/// Queries an asynchronous Win32 virtual key while the preview window has foreground focus.
/// @param key Key code queried by the native input boundary.
/// @returns Nonzero while the key is down; 0 for invalid keys or lack of focus.
extern function keyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_key_down" returns i32
/// Reads the native input subsystem's tracked key-down state.
/// @param key Key code queried by the native input boundary.
/// @returns Nonzero while the requested tracked key is down.
extern function inputKeyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_input_key_down" returns i32
/// Removes the next native input event and writes its four integer fields to the output buffer.
/// @param output Writable storage for four 32-bit event fields.
/// @param capacity Output capacity in bytes; at least 16 bytes are needed for one event.
/// @returns 1 when an event is written; 0 if none is available or the buffer is invalid.
extern function nextInputEventNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_next_input_event" returns i32
/// Atomically reads and clears accumulated horizontal mouse motion.
/// @returns The horizontal motion accumulated since the previous call.
extern function mouseXNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dx" returns i32
/// Atomically reads and clears accumulated vertical mouse motion.
/// @returns The vertical motion accumulated since the previous call.
extern function mouseYNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dy" returns i32
/// Reads the native preview clock used to timestamp input and frames.
/// @returns Current native time in milliseconds.
extern function millisecondsNative() from "playable_window.dll" symbol "playable_window_milliseconds" returns i32
/// Reports whether the hardware rendering path is active.
/// @returns The hardware-renderer flag.
extern function hardwareRendererNative() from "playable_window.dll" symbol "playable_window_hardware_renderer" returns i32
/// Reads the native hardware triangle counter.
/// @returns The current hardware triangle count.
extern function hardwareTrianglesNative() from "playable_window.dll" symbol "playable_window_hardware_triangles" returns u32
/// Reads the native hardware draw-call counter.
/// @returns The current hardware draw-call count.
extern function hardwareDrawCallsNative() from "playable_window.dll" symbol "playable_window_hardware_draw_calls" returns u32
/// Writes one position/texture/lightmap vertex into a packed triangle record.
/// @param data Writable packed vertex/triangle storage.
/// @param count Available destination bytes, despite the MiniLang parameter name count.
/// @param offset Destination byte offset of the eight-float vertex; 32 writable bytes are required.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param z Z component of the position.
/// @param u U texture coordinate of the vertex.
/// @param v V texture coordinate of the vertex.
/// @param lu U lightmap coordinate of the vertex.
/// @param lv V lightmap coordinate of the vertex.
/// @param light Light intensity of the vertex.
/// @returns 1 when written; 0 for invalid record bounds or vertex input.
extern function writeBatchVertexNative(data as ptr,count as i32,offset as i32,x as double,y as double,z as double,u as double,v as double,lu as double,lv as double,light as double) from "playable_window.dll" symbol "playable_window_write_batch_vertex" returns i32
/// Writes a complete textured, lit triangle into the native packed-record buffer.
/// @param data Writable 128-byte triangle-record array.
/// @param count Destination-buffer capacity in bytes, despite the parameter name count.
/// @param triangle Zero-based triangle record index.
/// @param baseSlot Texture slot for the base material.
/// @param lightmapSlot Texture slot for the lightmap.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param z0 Z coordinate for vertex 0.
/// @param u0 U texture coordinate for vertex 0.
/// @param v0 V texture coordinate for vertex 0.
/// @param lu0 U lightmap coordinate for vertex 0.
/// @param lv0 V lightmap coordinate for vertex 0.
/// @param light0 Light intensity for vertex 0.
/// @param r0 Red component for vertex 0.
/// @param g0 Green component for vertex 0.
/// @param b0 Blue component for vertex 0.
/// @param a0 Alpha component for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param z1 Z coordinate for vertex 1.
/// @param u1 U texture coordinate for vertex 1.
/// @param v1 V texture coordinate for vertex 1.
/// @param lu1 U lightmap coordinate for vertex 1.
/// @param lv1 V lightmap coordinate for vertex 1.
/// @param light1 Light intensity for vertex 1.
/// @param r1 Red component for vertex 1.
/// @param g1 Green component for vertex 1.
/// @param b1 Blue component for vertex 1.
/// @param a1 Alpha component for vertex 1.
/// @param x2 X coordinate for vertex 2.
/// @param y2 Y coordinate for vertex 2.
/// @param z2 Z coordinate for vertex 2.
/// @param u2 U texture coordinate for vertex 2.
/// @param v2 V texture coordinate for vertex 2.
/// @param lu2 U lightmap coordinate for vertex 2.
/// @param lv2 V lightmap coordinate for vertex 2.
/// @param light2 Light intensity for vertex 2.
/// @param r2 Red component for vertex 2.
/// @param g2 Green component for vertex 2.
/// @param b2 Blue component for vertex 2.
/// @param a2 Alpha component for vertex 2.
/// @returns 1 when written; 0 for invalid record bounds or triangle input.
extern function writePositionTriangleNative(data as ptr,count as i32,triangle as i32,baseSlot as i32,lightmapSlot as i32,red as i32,green as i32,blue as i32,
    x0 as double,y0 as double,z0 as double,u0 as double,v0 as double,lu0 as double,lv0 as double,light0 as double,r0 as i64,g0 as i64,b0 as i64,a0 as i64,
    x1 as double,y1 as double,z1 as double,u1 as double,v1 as double,lu1 as double,lv1 as double,light1 as double,r1 as i64,g1 as i64,b1 as i64,a1 as i64,
    x2 as double,y2 as double,z2 as double,u2 as double,v2 as double,lu2 as double,lv2 as double,light2 as double,r2 as i64,g2 as i64,b2 as i64,a2 as i64) from "playable_window.dll" symbol "playable_window_write_position_triangle" returns i32
/// Updates a shader-stage vertex position, texture coordinates, and color in a packed triangle.
/// @param data Writable 128-byte triangle-record array.
/// @param count Destination-buffer capacity in bytes, despite the parameter name count.
/// @param triangle Zero-based triangle record index.
/// @param vertex Vertex index within the triangle.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param z Z component of the position.
/// @param u U texture coordinate of the vertex.
/// @param v V texture coordinate of the vertex.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
/// @param alpha Alpha channel intensity supplied to the drawing operation.
/// @returns 1 when the update succeeds; 0 for an invalid destination or vertex.
extern function updateStageVertexNative(data as ptr,count as i32,triangle as i32,vertex as i32,x as double,y as double,z as double,u as double,v as double,red as i32,green as i32,blue as i32,alpha as i32) from "playable_window.dll" symbol "playable_window_update_stage_vertex" returns i32
/// Updates per-vertex specular alpha in packed triangles using stored normals and the eye position.
/// @param data Writable 128-byte triangle records whose vertex colors/light values are updated.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param normals Read-only 36-byte records containing three float32 normals per triangle.
/// @param normalBytes Size of the packed normal buffer in bytes.
/// @param triangles Number of triangles associated with the face or processed range.
/// @param eyeX X component of the view position.
/// @param eyeY Y component of the view position.
/// @param eyeZ Z component of the view position.
/// @returns 1 when the specular update succeeds; 0 for inconsistent native buffers.
extern function updateSpecularPassNative(data as ptr,byteCount as i32,normals as ptr,normalBytes as i32,triangles as i32,eyeX as double,eyeY as double,eyeZ as double) from "playable_window.dll" symbol "playable_window_update_specular_pass" returns i32
/// Atomically consumes the pending native video-restart request.
/// @returns The previous request flag; the stored flag is reset to zero.
extern function takeVideoRestartNative() from "playable_window.dll" symbol "playable_window_take_video_restart" returns i32
/// Copies focus, minimization, position, fullscreen, and activation information into a native integer record.
/// @param output Writable storage for seven 32-bit window-state fields.
/// @param capacity Number of 32-bit output fields; at least seven are required.
/// @returns 1 when the state record is written; 0 for an invalid output buffer.
extern function windowStateNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_window_state" returns i32
/// Copies the current Windows user name as UTF-8 into caller-owned storage.
/// @param output Writable NUL-terminated UTF-8 destination.
/// @param capacity Destination capacity in bytes, including its terminator.
/// @returns UTF-8 length from the native conversion helper, or 0 when the name cannot be obtained.
extern function currentUserNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_current_user" returns i32
/// Copies the process working directory as UTF-8 into caller-owned storage.
/// @param output Writable NUL-terminated UTF-8 destination.
/// @param capacity Destination capacity in bytes, including its terminator.
/// @returns UTF-8 length from the native conversion helper, or 0 when the directory cannot be obtained.
extern function currentDirectoryNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_current_directory" returns i32
/// Copies the executable's parent directory as UTF-8 into caller-owned storage.
/// @param output Writable NUL-terminated UTF-8 destination.
/// @param capacity Destination capacity in bytes, including its terminator.
/// @returns UTF-8 length from the native conversion helper, or 0 when the path cannot be obtained.
extern function executableDirectoryNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_executable_directory" returns i32
/// Maps available CPU features to the legacy Quake processor identifier.
/// @returns The legacy processor ID selected from the detected features, or 0 for the fallback.
extern function processorIdNative() from "playable_window.dll" symbol "playable_system_processor_id" returns i32
/// Initializes native keyboard/mouse input and starts configured joystick/MIDI devices.
/// @returns The native MIDI-startup status returned after input setup.
extern function inputInitNative() from "playable_window.dll" symbol "playable_window_input_init" returns i32
/// Enables or disables native input capture and activation.
/// @param active Nonzero activates the native window/input state; zero deactivates it.
extern function inputActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_input_activate" returns void
/// Polls native per-frame joystick/input state.
extern function inputFrameNative() from "playable_window.dll" symbol "playable_window_input_frame" returns void
/// Clears tracked native key/button states and pending motion.
extern function inputClearNative() from "playable_window.dll" symbol "playable_window_input_clear_states" returns void
/// Stores joystick enable/dead-zone/trackball settings and restarts joystick discovery.
/// @param enabled Nonzero enables the requested native feature.
/// @param threshold Joystick axis dead-zone threshold.
/// @param ballScale Scale applied to joystick trackball motion.
/// @returns The native joystick-startup status.
extern function joystickConfigureNative(enabled as i32,threshold as double,ballScale as double) from "playable_window.dll" symbol "playable_window_input_configure_joystick" returns i32
/// Stores MIDI enable/device/channel settings and restarts MIDI input.
/// @param enabled Nonzero enables the requested native feature.
/// @param device MIDI input device index.
/// @param channel MIDI input channel selector.
/// @returns The native MIDI-startup status.
extern function midiConfigureNative(enabled as i32,device as i32,channel as i32) from "playable_window.dll" symbol "playable_window_input_configure_midi" returns i32
/// Tests whether an enabled joystick is available to native input.
/// @returns Nonzero only when joystick input is enabled and a device is available.
extern function joystickAvailableNative() from "playable_window.dll" symbol "playable_window_input_joystick_available" returns i32
/// Queries the number of WinMM MIDI input devices.
/// @returns The device count returned by midiInGetNumDevs.
extern function midiDeviceCountNative() from "playable_window.dll" symbol "playable_window_input_midi_device_count" returns i32
/// Starts a native frame using the supplied RGB clear color.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
extern function beginNative(red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_begin_frame" returns void
/// Draws a screen-space RGB line into the preview surface.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
extern function lineNative(x0 as i32,y0 as i32,x1 as i32,y1 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_line" returns void
/// Presents the native preview surface.
extern function presentNative() from "playable_window.dll" symbol "playable_window_present" returns void
/// Counts non-black pixels in the last presented native image.
/// @returns The detected non-black pixel count, or 0 when no image can be inspected.
extern function presentedNonBlackNative() from "playable_window.dll" symbol "playable_window_presented_non_black" returns i32
/// Destroys the preview window and releases native rendering/input resources.
extern function shutdownNative() from "playable_window.dll" symbol "playable_window_shutdown" returns void
/// Clears native depth storage to the supplied depth value.
/// @param depth Depth value used to reset native depth storage.
extern function clearDepthNative(depth as double) from "playable_window.dll" symbol "playable_window_clear_depth" returns void
/// Reads a screen pixel's depth and converts stored depth to a camera-space distance.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @returns The distance; FLT_MAX for untouched/far depth, or -1.0 for invalid coordinates/state.
extern function sampleDepthNative(x as i32,y as i32) from "playable_window.dll" symbol "playable_window_sample_depth" returns double
/// Configures the native depth scale and near clipping distance.
/// @param scale Finite depth scale greater than zero and at most one.
/// @param nearDistance Positive near clipping distance used for perspective depth conversion.
/// @returns 1 for an accepted range; 0 for invalid depth parameters.
extern function setDepthRangeNative(scale as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_set_depth_range" returns i32
/// Clears stencil coverage inside the specified viewport rectangle.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @returns 1 when the clear request is accepted; 0 for invalid state or bounds.
extern function clearStencilNative(x as i32,y as i32,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_clear_stencil" returns i32
/// Selects the native stencil-shadow rendering pass.
/// @param pass Stencil-pass selector used by the native shadow pipeline.
/// @returns 1 for an accepted pass selector; 0 for an invalid selector.
extern function setStencilPassNative(pass as i32) from "playable_window.dll" symbol "playable_window_set_stencil_pass" returns i32
/// Applies shadow darkening to pixels selected by the completed stencil pass.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @returns The number of affected pixels; -1 for invalid input, or 0 when no pixels are affected.
extern function finishStencilShadowNative(x as i32,y as i32,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_finish_stencil_shadow" returns i32
/// Copies RGBA pixels into a native texture slot with mipmapping enabled.
/// @param slot Texture slot selected by the native renderer.
/// @param rgba Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @returns 1 when upload succeeds; 0 for invalid input or allocation/upload failure.
extern function uploadTextureNative(slot as i32,rgba as ptr,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_upload_texture" returns i32
/// Uploads RGBA pixels to a native slot with explicit mipmap selection.
/// @param slot Texture slot selected by the native renderer.
/// @param rgba Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @param mipmapped Nonzero requests a mipmapped texture.
/// @returns 1 when upload succeeds; 0 for invalid input or allocation/upload failure.
extern function uploadTextureMipmappedNative(slot as i32,rgba as ptr,width as i32,height as i32,mipmapped as i32) from "playable_window.dll" symbol "playable_window_upload_texture_mipmapped" returns i32
/// Uploads an RGBA material texture with optional mipmaps and configured picmip reduction.
/// @param slot Texture slot selected by the native renderer.
/// @param rgba Read-only RGBA8 pixels, width * height * 4 bytes before any picmip reduction.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @param mipmapped Nonzero requests a mipmapped texture.
/// @param allowPicmip Nonzero permits the configured texture-picmip reduction.
/// @returns 1 when upload succeeds; 0 for invalid input or allocation/upload failure.
extern function uploadMaterialTextureNative(slot as i32,rgba as ptr,width as i32,height as i32,mipmapped as i32,allowPicmip as i32) from "playable_window.dll" symbol "playable_window_upload_material_texture" returns i32
/// Stores texture-picmip reduction and native filtering settings.
/// @param picmip Requested power-of-two texture size reduction.
/// @param mode Filter index 0..5 corresponding to the GL_NEAREST/GL_LINEAR and mipmap combinations.
extern function setTextureSettingsNative(picmip as i32,mode as i32) from "playable_window.dll" symbol "playable_window_set_texture_settings" returns void
/// Releases the pixels and native renderer resources associated with a texture slot.
/// @param slot Texture slot selected by the native renderer.
extern function releaseTextureNative(slot as i32) from "playable_window.dll" symbol "playable_window_release_texture" returns void
/// Draws one textured triangle with per-vertex depth and lighting.
/// @param textureSlot Texture slot selected for this primitive.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param depth0 Depth for vertex 0.
/// @param u0 U texture coordinate for vertex 0.
/// @param v0 V texture coordinate for vertex 0.
/// @param light0 Light intensity for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param depth1 Depth for vertex 1.
/// @param u1 U texture coordinate for vertex 1.
/// @param v1 V texture coordinate for vertex 1.
/// @param light1 Light intensity for vertex 1.
/// @param x2 X coordinate for vertex 2.
/// @param y2 Y coordinate for vertex 2.
/// @param depth2 Depth for vertex 2.
/// @param u2 U texture coordinate for vertex 2.
/// @param v2 V texture coordinate for vertex 2.
/// @param light2 Light intensity for vertex 2.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
extern function triangleNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,light0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,light1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,light2 as double,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle" returns void
/// Draws one textured triangle with per-vertex RGBA modulation.
/// @param textureSlot Texture slot selected for this primitive.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param depth0 Depth for vertex 0.
/// @param u0 U texture coordinate for vertex 0.
/// @param v0 V texture coordinate for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param depth1 Depth for vertex 1.
/// @param u1 U texture coordinate for vertex 1.
/// @param v1 V texture coordinate for vertex 1.
/// @param x2 X coordinate for vertex 2.
/// @param y2 Y coordinate for vertex 2.
/// @param depth2 Depth for vertex 2.
/// @param u2 U texture coordinate for vertex 2.
/// @param v2 V texture coordinate for vertex 2.
/// @param red0 Red component for vertex 0.
/// @param green0 Green component for vertex 0.
/// @param blue0 Blue component for vertex 0.
/// @param alpha0 Alpha component for vertex 0.
/// @param red1 Red component for vertex 1.
/// @param green1 Green component for vertex 1.
/// @param blue1 Blue component for vertex 1.
/// @param alpha1 Alpha component for vertex 1.
/// @param red2 Red component for vertex 2.
/// @param green2 Green component for vertex 2.
/// @param blue2 Blue component for vertex 2.
/// @param alpha2 Alpha component for vertex 2.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
extern function triangleColoredNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,red0 as i32,green0 as i32,blue0 as i32,alpha0 as i32,red1 as i32,green1 as i32,blue1 as i32,alpha1 as i32,red2 as i32,green2 as i32,blue2 as i32,alpha2 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_colored" returns void
/// Draws a bounded array of packed screen-space triangle records.
/// @param records Read-only packed triangle array with 128-byte records.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param triangleCount Number of packed triangle records to process.
/// @returns The submitted triangle count; 0 for invalid input or an empty batch.
extern function triangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_batch" returns i32
/// Writes a screen-space quad as two packed triangle records.
/// @param records Writable packed triangle array; two consecutive 128-byte records are replaced.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param triangleIndex Zero-based destination triangle index.
/// @param textureSlot Texture slot selected for this primitive.
/// @param x0 X coordinate for vertex 0.
/// @param y0 Y coordinate for vertex 0.
/// @param d0 Depth for vertex 0.
/// @param u0 U texture coordinate for vertex 0.
/// @param v0 V texture coordinate for vertex 0.
/// @param x1 X coordinate for vertex 1.
/// @param y1 Y coordinate for vertex 1.
/// @param d1 Depth for vertex 1.
/// @param u1 U texture coordinate for vertex 1.
/// @param v1 V texture coordinate for vertex 1.
/// @param x2 X coordinate for vertex 2.
/// @param y2 Y coordinate for vertex 2.
/// @param d2 Depth for vertex 2.
/// @param u2 U texture coordinate for vertex 2.
/// @param v2 V texture coordinate for vertex 2.
/// @param x3 X coordinate for vertex 3.
/// @param y3 Y coordinate for vertex 3.
/// @param d3 Depth for vertex 3.
/// @param u3 U texture coordinate for vertex 3.
/// @param v3 V texture coordinate for vertex 3.
/// @param red Red channel intensity supplied to the drawing operation.
/// @param green Green channel intensity supplied to the drawing operation.
/// @param blue Blue channel intensity supplied to the drawing operation.
/// @param alpha Alpha channel intensity supplied to the drawing operation.
/// @returns 2 when both triangle records are written; 0 for invalid destination/input.
extern function writeScreenQuadNative(records as ptr,byteCount as i32,triangleIndex as i32,textureSlot as i32,x0 as double,y0 as double,d0 as double,u0 as double,v0 as double,x1 as double,y1 as double,d1 as double,u1 as double,v1 as double,x2 as double,y2 as double,d2 as double,u2 as double,v2 as double,x3 as double,y3 as double,d3 as double,u3 as double,v3 as double,red as i32,green as i32,blue as i32,alpha as i32) from "playable_window.dll" symbol "playable_window_write_screen_quad" returns i32
/// Transforms and draws packed world-space triangles using the supplied camera basis.
/// @param records Read-only packed triangle array with 128-byte records.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param triangleCount Number of packed triangle records to process.
/// @param positionX X component of the camera position.
/// @param positionY Y component of the camera position.
/// @param positionZ Z component of the camera position.
/// @param rightX X component of the camera right axis.
/// @param rightY Y component of the camera right axis.
/// @param rightZ Z component of the camera right axis.
/// @param upX X component of the camera up axis.
/// @param upY Y component of the camera up axis.
/// @param upZ Z component of the camera up axis.
/// @param forwardX X component of the camera forward axis.
/// @param forwardY Y component of the camera forward axis.
/// @param forwardZ Z component of the camera forward axis.
/// @param halfWidth Half of the render-surface width in pixels.
/// @param halfHeight Half of the render-surface height in pixels.
/// @param focal Perspective focal length in pixels.
/// @param nearDistance Near clipping distance in camera-space units.
/// @returns The submitted triangle count or native hardware result; 0 for invalid input.
extern function worldTriangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,halfWidth as double,halfHeight as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch" returns i32
/// Transforms world-space triangles and draws them within an explicit viewport.
/// @param records Read-only packed triangle array with 128-byte records.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param triangleCount Number of packed triangle records to process.
/// @param viewportX Viewport x in pixels.
/// @param viewportY Viewport y in pixels.
/// @param viewportWidth Viewport width in pixels.
/// @param viewportHeight Viewport height in pixels.
/// @param positionX X component of the camera position.
/// @param positionY Y component of the camera position.
/// @param positionZ Z component of the camera position.
/// @param rightX X component of the camera right axis.
/// @param rightY Y component of the camera right axis.
/// @param rightZ Z component of the camera right axis.
/// @param upX X component of the camera up axis.
/// @param upY Y component of the camera up axis.
/// @param upZ Z component of the camera up axis.
/// @param forwardX X component of the camera forward axis.
/// @param forwardY Y component of the camera forward axis.
/// @param forwardZ Z component of the camera forward axis.
/// @param focal Perspective focal length in pixels.
/// @param nearDistance Near clipping distance in camera-space units.
/// @returns The native draw result, normally the submitted triangle count; 0 for invalid input.
extern function worldTriangleBatchViewportNative(records as ptr,byteCount as i32,triangleCount as i32,viewportX as i32,viewportY as i32,viewportWidth as i32,viewportHeight as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch_viewport" returns i32

// Matches PLAYABLE_TEXTURE_SLOTS in native/playable_win32.c.
const NATIVE_TEXTURE_SLOTS=4096
/// Windows virtual-key code for Escape.
const VK_ESCAPE=27
/// Windows virtual-key code for left mouse button.
const VK_LBUTTON=1
/// Windows virtual-key code for right mouse button.
const VK_RBUTTON=2
/// Windows virtual-key code for middle mouse button.
const VK_MBUTTON=4
/// Windows virtual-key code for first extended mouse button.
const VK_XBUTTON1=5
/// Windows virtual-key code for second extended mouse button.
const VK_XBUTTON2=6
/// Engine input key code for mouse button 1.
const K_MOUSE1=178
/// Engine input key code for mouse button 2.
const K_MOUSE2=179
/// Engine input key code for mouse button 3.
const K_MOUSE3=180
/// Engine input key code for mouse button 4.
const K_MOUSE4=181
/// Engine input key code for mouse button 5.
const K_MOUSE5=182
/// Engine input key code for the downward mouse-wheel step.
const K_MWHEELDOWN=183
/// Engine input key code for the upward mouse-wheel step.
const K_MWHEELUP=184
/// Windows virtual-key code for Enter.
const VK_RETURN=13
/// Windows virtual-key code for Space.
const VK_SPACE=32
/// Windows virtual-key code for up arrow.
const VK_UP=38
/// Windows virtual-key code for down arrow.
const VK_DOWN=40
/// Windows virtual-key code for A.
const VK_A=65
/// Windows virtual-key code for D.
const VK_D=68
/// Windows virtual-key code for E.
const VK_E=69
/// Windows virtual-key code for Q.
const VK_Q=81
/// Windows virtual-key code for S.
const VK_S=83
/// Windows virtual-key code for W.
const VK_W=87
/// Windows virtual-key code for Shift.
const VK_SHIFT=16
/// Windows virtual-key code for 1.
const VK_1=49
/// Windows virtual-key code for 2.
const VK_2=50
/// Windows virtual-key code for 3.
const VK_3=51
/// Windows virtual-key code for 4.
const VK_4=52
/// Windows virtual-key code for 5.
const VK_5=53
/// Windows virtual-key code for 6.
const VK_6=54
/// Windows virtual-key code for 7.
const VK_7=55
/// Windows virtual-key code for 8.
const VK_8=56
/// Windows virtual-key code for 9.
const VK_9=57
/// Native input record type carrying a key code and pressed state.
const INPUT_KEY=1
/// Native input record type carrying a text-input character.
const INPUT_CHAR=2
/// Native input record type carrying relative mouse movement.
const INPUT_MOUSE=3
/// Byte size of one packed triangle record consumed by the native drawing backend.
const TRIANGLE_BATCH_RECORD_BYTES=128
/// Maximum number of packed triangle records accepted by one native batch.
const TRIANGLE_BATCH_MAX_COUNT=65536

/// Data record for `mq3.platform.playable_window.TriangleBatch`; groups `data`, `capacity`, `count`.
struct TriangleBatch
  /// Packed triangle records passed directly to the native graphics backend.
  data
  /// Maximum number of packed triangle records that fit in the batch buffer.
  capacity
  /// Number of initialized triangle records in the native batch buffer.
  count
end struct
/// Data record for `mq3.platform.playable_window.Viewport`; groups `x`, `y`, `width`, `height`.
struct Viewport
  /// Horizontal position of the view or drawing rectangle, in pixels.
  x
  /// Vertical position of the view or drawing rectangle, in pixels.
  y
  /// Width in pixels of the native drawing viewport.
  width
  /// Height in pixels of the native drawing viewport.
  height
end struct
/// Data record for `mq3.platform.playable_window.LoadingPoint`; groups `x`, `y`.
struct LoadingPoint
  /// Horizontal screen-space coordinate of the projected or drawn point.
  x
  /// Vertical screen-space coordinate of the projected or drawn point.
  y
end struct
/// Data record for `mq3.platform.playable_window.InputEvent`; groups `time`, `type`, `value`, `value2`.
struct InputEvent
  /// Timestamp in milliseconds attached to a native window input record.
  time
  /// System-event category selecting how the accompanying values are interpreted.
  type
  /// Primary event value: a key or character code, horizontal motion, or joystick-axis selector.
  value
  /// Secondary event value: key press state, vertical motion, or joystick-axis magnitude.
  value2
end struct
/// Data record for `mq3.platform.playable_window.WindowState`; groups `active`, `minimized`, `x`, `y`, `fullscreen`, `altTabDisabled`, and 1 further field.
struct WindowState
  /// Whether this object is currently active and accepts processing.
  active
  /// Whether the application window is minimized.
  minimized
  /// Horizontal position of the native window, in desktop coordinates.
  x
  /// Vertical position of the native window, in desktop coordinates.
  y
  /// Whether the selected video mode occupies the full display.
  fullscreen
  /// Whether task switching is disabled while the window is active.
  altTabDisabled
  /// Generation incremented whenever window activation changes sound playback.
  soundActivationSerial
end struct
/// Data record for `mq3.platform.playable_window.DisplayMode`; groups `width`, `height`, `fullscreen`.
struct DisplayMode
  /// Width in pixels of the enumerated native display mode.
  width
  /// Height in pixels of the enumerated native display mode.
  height
  /// Whether the selected video mode occupies the full display.
  fullscreen
end struct

/// Builds `mq3.platform.playable_window.DisplayMode` for `mq3.platform.playable_window.setMode`.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.setModeNative`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.setModeNative`.
/// @param fullscreen Input tested by `fullscreen`.
/// @param frequency Value forwarded as `frequency` to `mq3.platform.playable_window.setModeNative`.
function setMode(width,height,fullscreen,frequency)
  output=bytes(12,0);flag=0;if fullscreen then flag=1 end if
  if setModeNative(width,height,flag,frequency,output,3)==0 then return error(7480,"could not change Win32 display mode") end if
  return DisplayMode(numeric.readI32(output,0),numeric.readI32(output,4),numeric.readI32(output,8)!=0)
end function

/// Creates the preview window, requires OpenGL and native input to initialize, and activates input.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.create`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.create`.
function open(width,height)
  if width<160 or height<120 then return error(7480,"preview window is too small") end if
  if create(width,height)==0 then return error(7481,"could not create preview window") end if
  if glAvailableNative()==0 then shutdownNative();return error(7481,"could not initialize Win32 OpenGL") end if
  if inputInitNative()==0 then shutdownNative();return error(7481,"could not initialize native input") end if
  inputActivateNative(1)
  return true
end function
/// Validates and applies driver/pixel-format/display preferences before opening the preview window.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.create`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.create`.
/// @param driverName Argument 1 supplied to `bytes`.
/// @param colorBits Value forwarded as `colorBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`.
/// @param depthBits Value forwarded as `depthBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`.
/// @param stencilBits Value forwarded as `stencilBits` to `mq3.platform.playable_window.glConfigurePixelFormatNative`.
/// @param stereo Input tested by `stereo`.
/// @param fullscreen Input tested by `fullscreen`.
/// @param frequency Value forwarded as `frequency` to `mq3.platform.playable_window.glConfigureDisplayNative`.
/// @param swapInterval Value forwarded as `swapInterval` to `mq3.platform.playable_window.glConfigureDisplayNative`.
function openConfigured(width,height,driverName,colorBits,depthBits,stencilBits,stereo,fullscreen,frequency,swapInterval)
  if width<160 or height<120 or typeof(driverName)!="string" then return error(7480,"invalid configured preview mode") end if
  driver=bytes(driverName);if len(driver)<1 or len(driver)>=260 then return error(7480,"invalid OpenGL driver name") end if
  stereoValue=0;if stereo then stereoValue=1 end if;fullscreenValue=0;if fullscreen then fullscreenValue=1 end if
  configured=glConfigureDriverNative(nativeBytesPtr(driver),len(driver))
  if configured!=0 then configured=glConfigurePixelFormatNative(colorBits,depthBits,stencilBits,stereoValue) end if
  if configured!=0 then configured=glConfigureDisplayNative(fullscreenValue,frequency,swapInterval) end if
  if configured==0 or create(width,height)==0 then return error(7481,"could not create configured Win32 OpenGL window") end if
  if glAvailableNative()==0 then shutdownNative();return error(7481,"could not initialize configured Win32 OpenGL") end if
  if inputInitNative()==0 then shutdownNative();return error(7481,"could not initialize native input") end if
  inputActivateNative(1);return true
end function
/// Computes `glAvailableNative()!=0` for `mq3.platform.playable_window.glAvailable`.
function glAvailable() return glAvailableNative()!=0 end function
/// Returns `[glPixelFormatNative(),glColorBitsNative(),glDepthBitsNative(),glStencilBitsNative(),glStereoNative()!=0,glFullscreenNative()!=0]` for `mq3.platform.playable_window.glConfiguration`.
function glConfiguration() return [glPixelFormatNative(),glColorBitsNative(),glDepthBitsNative(),glStencilBitsNative(),glStereoNative()!=0,glFullscreenNative()!=0] end function
/// Returns `decode(slice(data,0,length))` from `mq3.platform.playable_window.glInfo`; earlier branches return `error(7493,"invalid OpenGL information selector")`.
/// @param which Value forwarded as `which` to `mq3.platform.playable_window.glInfoNative`.
function glInfo(which)
  data=bytes(4096,0);length=glInfoNative(which,data,len(data));if length<0 then return error(7493,"invalid OpenGL information selector") end if
  return decode(slice(data,0,length))
end function
/// Returns `glHasExtensionNative(nativeBytesPtr(data),len(data))!=0` from `mq3.platform.playable_window.glHasExtension`; earlier branches return `false`.
/// @param name Argument 1 supplied to `bytes`.
function glHasExtension(name) data=bytes(name);if len(data)<1 then return false end if;return glHasExtensionNative(nativeBytesPtr(data),len(data))!=0 end function
/// Computes `glSwapIntervalNative(interval)!=0` for `mq3.platform.playable_window.glSetSwapInterval`.
/// @param interval Value forwarded as `interval` to `mq3.platform.playable_window.glSwapIntervalNative`.
function glSetSwapInterval(interval) return glSwapIntervalNative(interval)!=0 end function
/// Computes `glSetGamma` from `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0` using `mq3.platform.playable_window.glSetGammaNative`.
/// @param red Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`.
/// @param green Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`.
/// @param blue Input used in the result expression `glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0`.
function glSetGamma(red,green,blue)
  if typeof(red)!="bytes" or typeof(green)!="bytes" or typeof(blue)!="bytes" or len(red)<256 or len(green)<256 or len(blue)<256 then return error(7494,"gamma ramps must contain 256 bytes per channel") end if
  return glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0
end function
/// Returns `void` from `mq3.platform.playable_window.glRestoreGamma`.
function glRestoreGamma() glRestoreGammaNative();return void end function
/// Returns `void` from `mq3.platform.playable_window.glActivate`.
/// @param active Input tested by `active`.
function glActivate(active) value=0;if active then value=1 end if;glActivateNative(value);return void end function
/// Returns `void` from `mq3.platform.playable_window.glLogComment`.
/// @param comment Argument 1 supplied to `bytes`.
function glLogComment(comment) data=bytes(comment);if len(data)>0 then glLogCommentNative(nativeBytesPtr(data),len(data)) end if;return void end function
/// Returns `void` from `mq3.platform.playable_window.poll`.
function poll() pollNative();inputFrameNative();return void end function
/// Computes `shouldCloseNative()!=0` for `mq3.platform.playable_window.shouldClose`.
function shouldClose() return shouldCloseNative()!=0 end function
/// Computes `setTitle` from `setTitleNative(nativeBytesPtr(data),len(data))!=0` using `mq3.platform.playable_window.setTitleNative`.
/// @param title Argument 1 supplied to `bytes`.
function setTitle(title)
  if typeof(title)!="string" then return error(7489,"preview window title must be a string") end if
  data=bytes(title)
  if len(data)<1 or len(data)>255 then return error(7489,"preview window title must contain 1 to 255 UTF-8 bytes") end if
  return setTitleNative(nativeBytesPtr(data),len(data))!=0
end function
/// Computes `loadingTitle` from `"MiniQuake3 | Loading "+str(progress)+"% | "+status`.
/// @param progress Input tested by `progress<0 or progress>100`.
/// @param status Argument 1 supplied to `bytes`.
function loadingTitle(progress,status)
  if progress<0 or progress>100 then return error(7490,"loading progress must be between 0 and 100") end if
  if typeof(status)!="string" or len(bytes(status))<1 then return error(7490,"loading status must be a non-empty string") end if
  title="MiniQuake3 | Loading "+str(progress)+"% | "+status
  if len(bytes(title))>255 then return error(7490,"loading title exceeds the Win32 UTF-8 limit") end if
  return title
end function
/// Updates the loading-window title and progress graphics while honoring close requests.
/// @param progress Value forwarded as `progress` to `mq3.platform.playable_window.loadingTitle`.
/// @param status Value forwarded as `status` to `mq3.platform.playable_window.loadingTitle`.
function showLoading(progress,status)
  title=loadingTitle(progress,status);if title is error then return title end if
  if shouldClose() then return false end if
  poll()
  if not setTitle(title) then return error(7491,"could not update loading window title") end if
  beginFrame(7,10,18)
  // Keep the startup surface deliberately dependency-free: this is visible
  // while retail textures and fonts are still being decoded.
  left=80;right=560;top=334;bottom=354;filled=left+(right-left)*progress/100
  for y=top to bottom
    drawLine(LoadingPoint(left,y),LoadingPoint(right,y),20,28,44)
    if filled>left then drawLine(LoadingPoint(left,y),LoadingPoint(filled,y),214,142,35) end if
  end for
  drawLine(LoadingPoint(left-1,top-1),LoadingPoint(right+1,top-1),112,124,150)
  drawLine(LoadingPoint(left-1,bottom+1),LoadingPoint(right+1,bottom+1),112,124,150)
  drawLine(LoadingPoint(left-1,top-1),LoadingPoint(left-1,bottom+1),112,124,150)
  drawLine(LoadingPoint(right+1,top-1),LoadingPoint(right+1,bottom+1),112,124,150)
  present();poll();return true
end function
/// Computes `keyDownNative(key)!=0` for `mq3.platform.playable_window.keyDown`.
/// @param key Value forwarded as `key` to `mq3.platform.playable_window.keyDownNative`.
function keyDown(key) return keyDownNative(key)!=0 end function
// The native Sys_QueEvent key-state table uses Quake keynums, including mouse
// and keypad keys. Keep legacy keyDown's Win32 virtual-key API separate.
/// @param key Value forwarded as `key` to `mq3.platform.playable_window.inputKeyDownNative`.
function inputKeyDown(key) return inputKeyDownNative(key)!=0 end function
/// Builds `mq3.platform.playable_window.InputEvent` for `mq3.platform.playable_window.decodeInputEvent`.
/// @param data Argument 1 supplied to `mq3.compat.numeric.readI32`.
function decodeInputEvent(data)
  if typeof(data)!="bytes" or len(data)<16 then return error(7492,"native input event is truncated") end if
  return InputEvent(numeric.readI32(data,0),numeric.readI32(data,4),numeric.readI32(data,8),numeric.readI32(data,12))
end function
/// Returns `decodeInputEvent(data)` from `mq3.platform.playable_window.nextInputEvent`; earlier branches return `void`.
function nextInputEvent()
  data=bytes(16,0);if nextInputEventNative(data,16)==0 then return void end if;return decodeInputEvent(data)
end function
/// Computes `inputEvents` from `result.toArray()` using `std.ds.list.List.withCapacity`, `result.len`, `mq3.platform.playable_window.nextInputEvent`.
/// @param maxEvents Argument 1 supplied to `std.ds.list.List.withCapacity`.
function inputEvents(maxEvents)
  if typeof(maxEvents)!="int" or maxEvents<0 or maxEvents>256 then return error(7492,"invalid native input event budget") end if
  result=lists.List.withCapacity(maxEvents);while result.len()<maxEvents event=nextInputEvent();if event==void then break end if;result.add(event) end while;return result.toArray()
end function
/// Returns `[mouseXNative(),mouseYNative()]` for `mq3.platform.playable_window.mouseDelta`.
function mouseDelta() return [mouseXNative(),mouseYNative()] end function
/// Returns `void` from `mq3.platform.playable_window.inputActivate`.
/// @param active Input tested by `active`.
function inputActivate(active) value=0;if active then value=1 end if;inputActivateNative(value);return void end function
/// Returns `void` from `mq3.platform.playable_window.inputClear`.
function inputClear() inputClearNative();return void end function
/// Computes `configureJoystick` from `joystickConfigureNative(value,threshold,ballScale)!=0` using `mq3.platform.playable_window.joystickConfigureNative`.
/// @param enabled Input tested by `enabled`.
/// @param threshold Value forwarded as `threshold` to `mq3.platform.playable_window.joystickConfigureNative`.
/// @param ballScale Value forwarded as `ballScale` to `mq3.platform.playable_window.joystickConfigureNative`.
function configureJoystick(enabled,threshold,ballScale)
  if typeof(threshold)!="double" and typeof(threshold)!="int" then return error(7491,"joystick threshold must be numeric") end if
  if threshold<0 or threshold>1 then return error(7491,"joystick threshold must be between zero and one") end if
  value=0;if enabled then value=1 end if
  return joystickConfigureNative(value,threshold,ballScale)!=0
end function
/// Computes `joystickAvailableNative()!=0` for `mq3.platform.playable_window.joystickAvailable`.
function joystickAvailable() return joystickAvailableNative()!=0 end function
/// Returns `midiConfigureNative(value,device,channel)!=0` from `mq3.platform.playable_window.configureMidi`; earlier branches return `error(7492,"MIDI device or channel is invalid")`.
/// @param enabled Input tested by `enabled`.
/// @param device Value forwarded as `device` to `mq3.platform.playable_window.midiConfigureNative`.
/// @param channel Value forwarded as `channel` to `mq3.platform.playable_window.midiConfigureNative`.
function configureMidi(enabled,device,channel)
  if device<0 or channel<1 or channel>16 then return error(7492,"MIDI device or channel is invalid") end if
  value=0;if enabled then value=1 end if
  return midiConfigureNative(value,device,channel)!=0
end function
/// Calls `mq3.platform.playable_window.midiDeviceCountNative` with `()` and returns its result.
function midiDeviceCount() return midiDeviceCountNative() end function
/// Calls `mq3.platform.playable_window.millisecondsNative` with `()` and returns its result.
function milliseconds() return millisecondsNative() end function
/// Computes `hardwareRendererNative()!=0` for `mq3.platform.playable_window.hardwareRenderer`.
function hardwareRenderer() return hardwareRendererNative()!=0 end function
/// Calls `mq3.platform.playable_window.hardwareTrianglesNative` with `()` and returns its result.
function hardwareTriangles() return hardwareTrianglesNative() end function
/// Calls `mq3.platform.playable_window.hardwareDrawCallsNative` with `()` and returns its result.
function hardwareDrawCalls() return hardwareDrawCallsNative() end function
/// Computes `takeVideoRestartNative()!=0` for `mq3.platform.playable_window.takeVideoRestart`.
function takeVideoRestart() return takeVideoRestartNative()!=0 end function
/// Builds `mq3.platform.playable_window.WindowState` for `mq3.platform.playable_window.windowState`.
function windowState()
  data=bytes(28,0);if windowStateNative(data,7)==0 then return error(7495,"could not read native window state") end if
  return WindowState(numeric.readI32(data,0)!=0,numeric.readI32(data,4)!=0,numeric.readI32(data,8),numeric.readI32(data,12),numeric.readI32(data,16)!=0,numeric.readI32(data,20)!=0,numeric.readI32(data,24))
end function
/// Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.currentUser`; earlier branches return `"player"`.
function currentUser() data=bytes(4096,0);count=currentUserNative(data,len(data));if count<1 then return "player" end if;return decode(slice(data,0,count)) end function
/// Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.currentDirectory`; earlier branches return `""`.
function currentDirectory() data=bytes(4096,0);count=currentDirectoryNative(data,len(data));if count<1 then return "" end if;return decode(slice(data,0,count)) end function
/// Returns `decode(slice(data,0,count))` from `mq3.platform.playable_window.executableDirectory`; earlier branches return `""`.
function executableDirectory() data=bytes(32768,0);count=executableDirectoryNative(data,len(data));if count<1 then return "" end if;return decode(slice(data,0,count)) end function
/// Calls `mq3.platform.playable_window.processorIdNative` with `()` and returns its result.
function processorId() return processorIdNative() end function
/// Returns `void` from `mq3.platform.playable_window.beginFrame`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.beginNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.beginNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.beginNative`.
function beginFrame(red,green,blue) beginNative(red,green,blue);return void end function
/// Returns `void` from `mq3.platform.playable_window.drawLine`.
/// @param a Record providing `a.x`, `a.y`.
/// @param b Record providing `b.x`, `b.y`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.lineNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.lineNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.lineNative`.
function drawLine(a,b,red,green,blue)
  lineNative(numeric.trunc32(a.x),numeric.trunc32(a.y),numeric.trunc32(b.x),numeric.trunc32(b.y),red,green,blue);return void
end function
/// Returns `void` from `mq3.platform.playable_window.present`.
function present() presentNative();return void end function
/// Calls `mq3.platform.playable_window.presentedNonBlackNative` with `()` and returns its result.
function presentedNonBlack() return presentedNonBlackNative() end function
/// Returns `void` from `mq3.platform.playable_window.endFrame`.
function endFrame() glEndFrameNative();return void end function
/// Returns `void` from `mq3.platform.playable_window.shutdown`.
function shutdown() shutdownNative();return void end function
/// Returns `void` from `mq3.platform.playable_window.clearDepth`.
/// @param depth Value forwarded as `depth` to `mq3.platform.playable_window.clearDepthNative`.
function clearDepth(depth) clearDepthNative(depth);return void end function
/// Calls `mq3.platform.playable_window.sampleDepthNative` with `(numeric.trunc32(x),numeric.trunc32(y))` and returns its result.
/// @param x Argument 1 supplied to `mq3.compat.numeric.trunc32`.
/// @param y Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function sampleDepth(x,y) return sampleDepthNative(numeric.trunc32(x),numeric.trunc32(y)) end function
/// Computes `setDepthRangeNative(scale,nearDistance)!=0` for `mq3.platform.playable_window.setDepthRange`.
/// @param scale Value forwarded as `scale` to `mq3.platform.playable_window.setDepthRangeNative`.
/// @param nearDistance Value forwarded as `nearDistance` to `mq3.platform.playable_window.setDepthRangeNative`.
function setDepthRange(scale,nearDistance) return setDepthRangeNative(scale,nearDistance)!=0 end function
/// Computes `clearStencilNative(area.x,area.y,area.width,area.height)!=0` for `mq3.platform.playable_window.clearStencil`.
/// @param area Record providing `area.x`, `area.y`, `area.width`, `area.height`.
function clearStencil(area) return clearStencilNative(area.x,area.y,area.width,area.height)!=0 end function
/// Computes `setStencilPassNative(pass)!=0` for `mq3.platform.playable_window.setStencilPass`.
/// @param pass Value forwarded as `pass` to `mq3.platform.playable_window.setStencilPassNative`.
function setStencilPass(pass) return setStencilPassNative(pass)!=0 end function
/// Calls `mq3.platform.playable_window.finishStencilShadowNative` with `(area.x,area.y,area.width,area.height)` and returns its result.
/// @param area Record providing `area.x`, `area.y`, `area.width`, `area.height`.
function finishStencilShadow(area) return finishStencilShadowNative(area.x,area.y,area.width,area.height) end function
/// Returns `uploadTextureNative(slot,nativeBytesPtr(rgba),width,height)!=0` from `mq3.platform.playable_window.uploadTexture`; earlier branches return `error(7483,"preview texture must be RGBA bytes")`.
/// @param slot Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureNative`.
/// @param rgba Input tested by `typeof(rgba)!="bytes"`.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureNative`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureNative`.
function uploadTexture(slot,rgba,width,height)
  if typeof(rgba)!="bytes" then return error(7483,"preview texture must be RGBA bytes") end if
  return uploadTextureNative(slot,nativeBytesPtr(rgba),width,height)!=0
end function
/// Computes `uploadTextureMipmapped` from `uploadTextureMipmappedNative(slot,nativeBytesPtr(rgba),width,height,value)!=0` using `mq3.platform.playable_window.uploadTextureMipmappedNative`.
/// @param slot Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureMipmappedNative`.
/// @param rgba Input tested by `typeof(rgba)!="bytes"`.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureMipmappedNative`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureMipmappedNative`.
/// @param mipmapped Input tested by `mipmapped`.
function uploadTextureMipmapped(slot,rgba,width,height,mipmapped)
  if typeof(rgba)!="bytes" then return error(7483,"preview texture must be RGBA bytes") end if
  value=0;if mipmapped then value=1 end if
  return uploadTextureMipmappedNative(slot,nativeBytesPtr(rgba),width,height,value)!=0
end function
/// Calls `mq3.platform.playable_window.uploadTextureMipmapped` with `(slot,rgba,width,height,false)` and returns its result.
/// @param slot Value forwarded as `slot` to `mq3.platform.playable_window.uploadTextureMipmapped`.
/// @param rgba Value forwarded as `rgba` to `mq3.platform.playable_window.uploadTextureMipmapped`.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.uploadTextureMipmapped`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.uploadTextureMipmapped`.
function uploadTextureNoMip(slot,rgba,width,height) return uploadTextureMipmapped(slot,rgba,width,height,false) end function
/// Computes `uploadMaterialTexture` from `uploadMaterialTextureNative(slot,nativeBytesPtr(rgba),width,height,mip,picmip)!=0` using `mq3.platform.playable_window.uploadMaterialTextureNative`.
/// @param slot Value forwarded as `slot` to `mq3.platform.playable_window.uploadMaterialTextureNative`.
/// @param rgba Input tested by `typeof(rgba)!="bytes"`.
/// @param width Value forwarded as `width` to `mq3.platform.playable_window.uploadMaterialTextureNative`.
/// @param height Value forwarded as `height` to `mq3.platform.playable_window.uploadMaterialTextureNative`.
/// @param mipmapped Input tested by `mipmapped`.
/// @param allowPicmip Input tested by `allowPicmip`.
function uploadMaterialTexture(slot,rgba,width,height,mipmapped,allowPicmip)
  if typeof(rgba)!="bytes" then return error(7483,"preview texture must be RGBA bytes") end if
  mip=0;if mipmapped then mip=1 end if
  picmip=0;if allowPicmip then picmip=1 end if
  return uploadMaterialTextureNative(slot,nativeBytesPtr(rgba),width,height,mip,picmip)!=0
end function
/// Maps an OpenGL texture-filter name to its native mode index and applies picmip/filter settings.
/// @param picmip Value forwarded as `picmip` to `mq3.platform.playable_window.setTextureSettingsNative`.
/// @param textureMode Argument 1 supplied to `stringEqualsIgnoreCaseAscii`.
function setTextureSettings(picmip,textureMode)
  modes=["GL_NEAREST","GL_LINEAR","GL_NEAREST_MIPMAP_NEAREST","GL_LINEAR_MIPMAP_NEAREST","GL_NEAREST_MIPMAP_LINEAR","GL_LINEAR_MIPMAP_LINEAR"]
  mode=-1
  for index=0 to len(modes)-1 if stringEqualsIgnoreCaseAscii(textureMode,modes[index]) then mode=index;break end if end for
  setTextureSettingsNative(picmip,mode)
end function
/// Returns `void` from `mq3.platform.playable_window.releaseTexture`.
/// @param slot Value forwarded as `slot` to `mq3.platform.playable_window.releaseTextureNative`.
function releaseTexture(slot) releaseTextureNative(slot);return void end function
/// Returns `void` from `mq3.platform.playable_window.drawTriangle`.
/// @param textureSlot Value forwarded as `textureSlot` to `mq3.platform.playable_window.triangleNative`.
/// @param a Record providing `a.x`, `a.y`, `a.depth`.
/// @param uvA Indexed input read at `0`, `1`.
/// @param lightA Value forwarded as `light0` to `mq3.platform.playable_window.triangleNative`.
/// @param b Record providing `b.x`, `b.y`, `b.depth`.
/// @param uvB Indexed input read at `0`, `1`.
/// @param lightB Value forwarded as `light1` to `mq3.platform.playable_window.triangleNative`.
/// @param c Record providing `c.x`, `c.y`, `c.depth`.
/// @param uvC Indexed input read at `0`, `1`.
/// @param lightC Value forwarded as `light2` to `mq3.platform.playable_window.triangleNative`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.triangleNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.triangleNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.triangleNative`.
function drawTriangle(textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  triangleNative(textureSlot,a.x,a.y,a.depth,uvA[0],uvA[1],lightA,b.x,b.y,b.depth,uvB[0],uvB[1],lightB,c.x,c.y,c.depth,uvC[0],uvC[1],lightC,red,green,blue)
  return void
end function
/// Submits a textured screen triangle with independent RGBA values at all three vertices.
/// @param textureSlot Value forwarded as `textureSlot` to `mq3.platform.playable_window.triangleColoredNative`.
/// @param a Record providing `a.x`, `a.y`, `a.depth`.
/// @param uvA Indexed input read at `0`, `1`.
/// @param colorA Indexed input read at `0`, `1`, `2`, `3`.
/// @param b Record providing `b.x`, `b.y`, `b.depth`.
/// @param uvB Indexed input read at `0`, `1`.
/// @param colorB Indexed input read at `0`, `1`, `2`, `3`.
/// @param c Record providing `c.x`, `c.y`, `c.depth`.
/// @param uvC Indexed input read at `0`, `1`.
/// @param colorC Indexed input read at `0`, `1`, `2`, `3`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.triangleColoredNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.triangleColoredNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.triangleColoredNative`.
function drawTriangleColored(textureSlot,a,uvA,colorA,b,uvB,colorB,c,uvC,colorC,red,green,blue)
  triangleColoredNative(textureSlot,a.x,a.y,a.depth,uvA[0],uvA[1],b.x,b.y,b.depth,uvB[0],uvB[1],c.x,c.y,c.depth,uvC[0],uvC[1],colorA[0],colorA[1],colorA[2],colorA[3],colorB[0],colorB[1],colorB[2],colorB[3],colorC[0],colorC[1],colorC[2],colorC[3],red,green,blue)
  return void
end function

/// Builds `mq3.platform.playable_window.TriangleBatch` for `mq3.platform.playable_window.createTriangleBatch`.
/// @param capacity Initial value for `mq3.platform.playable_window.TriangleBatch.capacity`.
function createTriangleBatch(capacity)
  if capacity<1 or capacity>TRIANGLE_BATCH_MAX_COUNT then return error(7486,"invalid triangle batch capacity") end if
  return TriangleBatch(bytes(capacity*TRIANGLE_BATCH_RECORD_BYTES,0),capacity,0)
end function
/// Updates `batch.count` in `mq3.platform.playable_window.resetTriangleBatch`; returns `batch`.
/// @param batch Mutable record or buffer; this call updates `batch.count`.
function resetTriangleBatch(batch) batch.count=0;return batch end function
/// Updates `batch.count` in `mq3.platform.playable_window.appendScreenQuad`; returns `batch`.
/// @param batch Mutable record or buffer; this call updates `batch.count`.
/// @param textureSlot Value forwarded as `textureSlot` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param positions Indexed input read at `0`, `1`, `2`, `3`.
/// @param texCoords Indexed input read at `0`, `1`, `2`, `3`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function appendScreenQuad(batch,textureSlot,positions,texCoords,color)
  if batch==void or positions==void or texCoords==void or color==void or len(positions)!=4 or len(texCoords)!=4 or len(color)!=4 then return error(7487,"invalid screen quad") end if
  if batch.count+2>batch.capacity then return error(7487,"triangle batch is full") end if
  a=positions[0];b=positions[1];c=positions[2];d=positions[3];ua=texCoords[0];ub=texCoords[1];uc=texCoords[2];ud=texCoords[3]
  written=writeScreenQuadNative(nativeBytesPtr(batch.data),len(batch.data),batch.count,textureSlot,a.x,a.y,a.depth,ua[0],ua[1],b.x,b.y,b.depth,ub[0],ub[1],c.x,c.y,c.depth,uc[0],uc[1],d.x,d.y,d.depth,ud[0],ud[1],color[0],color[1],color[2],color[3])
  if written!=2 then return error(7487,"native screen quad write failed") end if;batch.count=batch.count+2;return batch
end function
/// Rewrites two existing packed triangles as a scaled screen rectangle with the supplied UVs and RGBA color.
/// @param batch Record providing `batch.count`, `batch.data`.
/// @param triangleIndex Value forwarded as `triangleIndex` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param textureSlot Value forwarded as `textureSlot` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param x Input used by `left=x*scaleX`.
/// @param y Input used by `top=y*scaleY`.
/// @param width Input used by `right=(x+width)*scaleX`.
/// @param height Input used by `bottom=(y+height)*scaleY`.
/// @param s1 Value forwarded as `u0` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param t1 Value forwarded as `v0` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param s2 Value forwarded as `u1` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param t2 Value forwarded as `v2` to `mq3.platform.playable_window.writeScreenQuadNative`.
/// @param scaleX Input used by `left=x*scaleX`.
/// @param scaleY Input used by `top=y*scaleY`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function writeScreenRect(batch,triangleIndex,textureSlot,x,y,width,height,s1,t1,s2,t2,scaleX,scaleY,color)
  if batch==void or color==void or len(color)!=4 or triangleIndex<0 or triangleIndex+2>batch.count then return error(7487,"invalid cached screen rectangle") end if
  left=x*scaleX;top=y*scaleY;right=(x+width)*scaleX;bottom=(y+height)*scaleY;depth=0.001
  written=writeScreenQuadNative(nativeBytesPtr(batch.data),len(batch.data),triangleIndex,textureSlot,left,top,depth,s1,t1,right,top,depth,s2,t1,right,bottom,depth,s2,t2,left,bottom,depth,s1,t2,color[0],color[1],color[2],color[3])
  if written!=2 then return error(7487,"native cached screen rectangle write failed") end if;return batch
end function
/// Returns `void` from `mq3.platform.playable_window.writeBatchI32`.
/// @param data Argument 1 supplied to `mq3.compat.numeric.writeU32`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.writeU32`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.i32`.
function writeBatchI32(data,offset,value) numeric.writeU32(data,offset,numeric.i32(value));return void end function
/// Returns `void` from `mq3.platform.playable_window.writeBatchF32`.
/// @param data Argument 1 supplied to `mq3.compat.numeric.writeU32`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.writeU32`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.floatBits`.
function writeBatchF32(data,offset,value) numeric.writeU32(data,offset,numeric.floatBits(value));return void end function
/// Writes a projected vertex and its texture/lightmap coordinates into native packed triangle storage.
/// @param data Writable packed triangle bytes; the native helper replaces the 32-byte vertex at offset.
/// @param offset Value forwarded as `offset` to `mq3.platform.playable_window.writeBatchVertexNative`.
/// @param point Record providing `point.x`, `point.y`, `point.depth`.
/// @param baseUV Indexed input read at `0`, `1`.
/// @param lightmapUV Indexed input read at `0`, `1`.
/// @param light Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertexNative`.
function writeBatchVertex(data,offset,point,baseUV,lightmapUV,light)
  if writeBatchVertexNative(nativeBytesPtr(data),len(data),offset,point.x,point.y,point.depth,baseUV[0],baseUV[1],lightmapUV[0],lightmapUV[1],light)!=1 then return error(7487,"native batch vertex rejected") end if
  return void
end function
/// Writes a world-position vertex and its texture/lightmap coordinates into native packed triangle storage.
/// @param data Writable packed triangle bytes; the native helper replaces the 32-byte vertex at offset.
/// @param offset Value forwarded as `offset` to `mq3.platform.playable_window.writeBatchVertexNative`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param baseUV Indexed input read at `0`, `1`.
/// @param lightmapUV Indexed input read at `0`, `1`.
/// @param light Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertexNative`.
function writeBatchPositionVertex(data as bytes,offset as int,position as array,baseUV as array,lightmapUV as array,light)
  if writeBatchVertexNative(nativeBytesPtr(data),len(data),offset,position[0],position[1],position[2],baseUV[0],baseUV[1],lightmapUV[0],lightmapUV[1],light)!=1 then return error(7487,"native batch position vertex rejected") end if
  return void
end function
/// Replaces one packed shader-stage vertex using world position, UV coordinates, and RGBA modulation.
/// @param batch Record providing `batch.data`.
/// @param triangle Value forwarded as `triangle` to `mq3.platform.playable_window.updateStageVertexNative`.
/// @param vertex Value forwarded as `vertex` to `mq3.platform.playable_window.updateStageVertexNative`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param uv Indexed input read at `0`, `1`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function updateStageVertex(batch as TriangleBatch,triangle as int,vertex as int,position as array,uv as array,color as array)
  if updateStageVertexNative(nativeBytesPtr(batch.data),len(batch.data),triangle,vertex,position[0],position[1],position[2],uv[0],uv[1],color[0],color[1],color[2],color[3])!=1 then return error(7487,"native stage vertex rejected") end if
  return void
end function
/// Recomputes packed specular vertex colors from 36-byte triangle-normal records and the eye position.
/// @param batch Record providing `batch.data`, `batch.count`.
/// @param normals Read-only packed float32 normals, 36 bytes per triangle in batch order.
/// @param eye Three-component vector read at indices 0, 1, and 2.
function updateSpecularPass(batch as TriangleBatch,normals as bytes,eye as array)
  if updateSpecularPassNative(nativeBytesPtr(batch.data),len(batch.data),nativeBytesPtr(normals),len(normals),batch.count,eye[0],eye[1],eye[2])!=1 then return error(7487,"native specular pass rejected") end if
  return void
end function
/// Updates `data[offset+channel]` in `mq3.platform.playable_window.writeBatchColor`.
/// @param data Mutable record or buffer; this call updates `data[offset+channel]`.
/// @param offset Input used by `data[offset+channel]=value`.
/// @param color Indexed input read at `channel`.
function writeBatchColor(data as bytes,offset as int,color as array)
  for channel=0 to 3 value=color[channel];if value<0 then value=0 end if;if value>255 then value=255 end if;data[offset+channel]=value end for;return void
end function
/// Updates `batch.count` in `mq3.platform.playable_window.appendTriangleBatchColored`; returns `batch`.
/// @param batch Mutable record or buffer; this call updates `batch.count`.
/// @param baseSlot Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`.
/// @param lightmapSlot Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`.
/// @param a Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param baseA Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightmapA Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightA Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param colorA Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`.
/// @param b Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param baseB Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightmapB Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightB Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param colorB Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`.
/// @param c Value forwarded as `point` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param baseC Value forwarded as `baseUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightmapC Value forwarded as `lightmapUV` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param lightC Value forwarded as `light` to `mq3.platform.playable_window.writeBatchVertex`.
/// @param colorC Value forwarded as `color` to `mq3.platform.playable_window.writeBatchColor`.
/// @param red Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`.
/// @param green Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`.
/// @param blue Value forwarded as `value` to `mq3.platform.playable_window.writeBatchI32`.
function appendTriangleBatchColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,colorA,b,baseB,lightmapB,lightB,colorB,c,baseC,lightmapC,lightC,colorC,red,green,blue)
  if batch.count>=batch.capacity then return error(7487,"triangle batch is full") end if
  offset=batch.count*TRIANGLE_BATCH_RECORD_BYTES
  writeBatchI32(batch.data,offset,baseSlot);writeBatchI32(batch.data,offset+4,lightmapSlot);writeBatchI32(batch.data,offset+8,red);writeBatchI32(batch.data,offset+12,green);writeBatchI32(batch.data,offset+16,blue)
  writeBatchVertex(batch.data,offset+20,a,baseA,lightmapA,lightA);writeBatchVertex(batch.data,offset+52,b,baseB,lightmapB,lightB);writeBatchVertex(batch.data,offset+84,c,baseC,lightmapC,lightC)
  writeBatchColor(batch.data,offset+116,colorA);writeBatchColor(batch.data,offset+120,colorB);writeBatchColor(batch.data,offset+124,colorC)
  batch.count=batch.count+1
  return batch
end function
/// Updates `batch.count` in `mq3.platform.playable_window.appendTriangleBatchPositionColored`; returns `batch`.
/// @param batch Mutable record or buffer; this call updates `batch.count`.
/// @param baseSlot Value forwarded as `baseSlot` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param lightmapSlot Value forwarded as `lightmapSlot` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param baseA Indexed input read at `0`, `1`.
/// @param lightmapA Indexed input read at `0`, `1`.
/// @param lightA Value forwarded as `light0` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param colorA Indexed input read at `0`, `1`, `2`, `3`.
/// @param b Three-component vector read at indices 0, 1, and 2.
/// @param baseB Indexed input read at `0`, `1`.
/// @param lightmapB Indexed input read at `0`, `1`.
/// @param lightB Value forwarded as `light1` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param colorB Indexed input read at `0`, `1`, `2`, `3`.
/// @param c Three-component vector read at indices 0, 1, and 2.
/// @param baseC Indexed input read at `0`, `1`.
/// @param lightmapC Indexed input read at `0`, `1`.
/// @param lightC Value forwarded as `light2` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param colorC Indexed input read at `0`, `1`, `2`, `3`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.writePositionTriangleNative`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.writePositionTriangleNative`.
function appendTriangleBatchPositionColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,colorA,b,baseB,lightmapB,lightB,colorB,c,baseC,lightmapC,lightC,colorC,red,green,blue)
  if batch.count>=batch.capacity then return error(7487,"triangle batch is full") end if
  written=writePositionTriangleNative(nativeBytesPtr(batch.data),len(batch.data),batch.count,baseSlot,lightmapSlot,red,green,blue,
    a[0],a[1],a[2],baseA[0],baseA[1],lightmapA[0],lightmapA[1],lightA,colorA[0],colorA[1],colorA[2],colorA[3],
    b[0],b[1],b[2],baseB[0],baseB[1],lightmapB[0],lightmapB[1],lightB,colorB[0],colorB[1],colorB[2],colorB[3],
    c[0],c[1],c[2],baseC[0],baseC[1],lightmapC[0],lightmapC[1],lightC,colorC[0],colorC[1],colorC[2],colorC[3])
  if written!=1 then return error(7487,"native position triangle rejected") end if
  batch.count=batch.count+1;return batch
end function
/// Appends a base/lightmap triangle using opaque white per-vertex colors and the supplied light values.
/// @param batch Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param baseSlot Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightmapSlot Value forwarded as `lightmapSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param a Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param baseA Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightmapA Value forwarded as `lightmapA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightA Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param b Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param baseB Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightmapB Value forwarded as `lightmapB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightB Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param c Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param baseC Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightmapC Value forwarded as `lightmapC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightC Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchColored`.
function appendTriangleBatch(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,b,baseB,lightmapB,lightB,c,baseC,lightmapC,lightC,red,green,blue)
  white=[255,255,255,255];return appendTriangleBatchColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,white,b,baseB,lightmapB,lightB,white,c,baseC,lightmapC,lightC,white,red,green,blue)
end function
/// Appends a colored projected triangle without a lightmap stage.
/// @param batch Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param textureSlot Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param a Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param uvA Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightA Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param colorA Value forwarded as `colorA` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param b Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param uvB Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightB Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param colorB Value forwarded as `colorB` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param c Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param uvC Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param lightC Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param colorC Value forwarded as `colorC` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchColored`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchColored`.
function appendSingleTextureTriangleColored(batch,textureSlot,a,uvA,lightA,colorA,b,uvB,lightB,colorB,c,uvC,lightC,colorC,red,green,blue)
  zero=[0.0,0.0];return appendTriangleBatchColored(batch,textureSlot,-1,a,uvA,zero,lightA,colorA,b,uvB,zero,lightB,colorB,c,uvC,zero,lightC,colorC,red,green,blue)
end function
/// Appends a colored world-position triangle without a lightmap stage.
/// @param batch Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param textureSlot Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param a Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param uvA Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param lightA Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param colorA Value forwarded as `colorA` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param b Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param uvB Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param lightB Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param colorB Value forwarded as `colorB` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param c Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param uvC Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param lightC Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param colorC Value forwarded as `colorC` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
function appendSingleTextureTrianglePositionColored(batch,textureSlot,a,uvA,lightA,colorA,b,uvB,lightB,colorB,c,uvC,lightC,colorC,red,green,blue)
  zero=[0.0,0.0];return appendTriangleBatchPositionColored(batch,textureSlot,-1,a,uvA,zero,lightA,colorA,b,uvB,zero,lightB,colorB,c,uvC,zero,lightC,colorC,red,green,blue)
end function
/// Appends a world-position triangle using opaque white vertex colors and one texture.
/// @param batch Value forwarded as `batch` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param textureSlot Value forwarded as `textureSlot` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param a Value forwarded as `a` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param uvA Value forwarded as `uvA` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param lightA Value forwarded as `lightA` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param b Value forwarded as `b` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param uvB Value forwarded as `uvB` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param lightB Value forwarded as `lightB` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param c Value forwarded as `c` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param uvC Value forwarded as `uvC` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param lightC Value forwarded as `lightC` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.appendSingleTextureTrianglePositionColored`.
function appendSingleTextureTrianglePosition(batch,textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  white=[255,255,255,255];return appendSingleTextureTrianglePositionColored(batch,textureSlot,a,uvA,lightA,white,b,uvB,lightB,white,c,uvC,lightC,white,red,green,blue)
end function
/// Computes `appendSingleTextureTriangle` from `appendTriangleBatch(batch,textureSlot,-1,a,uvA,zero,lightA,b,uvB,zero,lightB,c,uvC,zero,lightC,red,green,blue)` using `mq3.platform.playable_window.appendTriangleBatch`.
/// @param batch Value forwarded as `batch` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param textureSlot Value forwarded as `baseSlot` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param a Value forwarded as `a` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param uvA Value forwarded as `baseA` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param lightA Value forwarded as `lightA` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param b Value forwarded as `b` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param uvB Value forwarded as `baseB` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param lightB Value forwarded as `lightB` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param c Value forwarded as `c` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param uvC Value forwarded as `baseC` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param lightC Value forwarded as `lightC` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param red Value forwarded as `red` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param green Value forwarded as `green` to `mq3.platform.playable_window.appendTriangleBatch`.
/// @param blue Value forwarded as `blue` to `mq3.platform.playable_window.appendTriangleBatch`.
function appendSingleTextureTriangle(batch,textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  zero=[0.0,0.0]
  return appendTriangleBatch(batch,textureSlot,-1,a,uvA,zero,lightA,b,uvB,zero,lightB,c,uvC,zero,lightC,red,green,blue)
end function
/// Computes `submitTriangleBatch` from `triangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count)` using `mq3.platform.playable_window.triangleBatchNative`.
/// @param batch Record providing `batch.count`, `batch.data`.
function submitTriangleBatch(batch)
  if batch.count==0 then return 0 end if
  rendered=triangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count)
  if rendered!=batch.count then return error(7488,"native triangle batch was rejected") end if
  return rendered
end function
/// Submits packed world triangles with the camera projection, adjusting vertical scaling before the native draw.
/// @param batch Record providing `batch.count`, `batch.data`.
/// @param projection Record providing `projection.position`, `projection.right`, `projection.up`, `projection.forward`, `projection.verticalFocal`, `projection.focal`.
function submitWorldTriangleBatch(batch,projection)
  if batch.count==0 then return 0 end if
  if projection==void or projection.position==void or projection.right==void or projection.up==void or projection.forward==void then return error(7488,"invalid world triangle projection") end if
  verticalScale=projection.verticalFocal/projection.focal
  rendered=worldTriangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count,projection.position[0],projection.position[1],projection.position[2],projection.right[0],projection.right[1],projection.right[2],projection.up[0]*verticalScale,projection.up[1]*verticalScale,projection.up[2]*verticalScale,projection.forward[0],projection.forward[1],projection.forward[2],projection.halfWidth,projection.halfHeight,projection.focal,projection.nearDistance)
  if rendered!=batch.count then return error(7488,"native world triangle batch was rejected") end if
  return rendered
end function
/// Checks positive viewport dimensions and signed 32-bit bounds for the origin and far edges.
/// @param x Signed screen-space viewport origin in pixels.
/// @param y Signed screen-space viewport origin in pixels.
/// @param width Positive viewport width; x + width must remain within signed 32-bit range.
/// @param height Positive viewport height; y + height must remain within signed 32-bit range.
function validViewportRectangle(x,y,width,height)
  return x>= -2147483648 and y>= -2147483648 and x<=2147483647 and y<=2147483647 and width>=1 and height>=1 and width<=2147483647 and height<=2147483647 and x+width<=2147483647 and y+height<=2147483647
end function
/// Builds `mq3.platform.playable_window.Viewport` for `mq3.platform.playable_window.viewport`.
/// @param x Initial value for `mq3.platform.playable_window.Viewport.x`.
/// @param y Initial value for `mq3.platform.playable_window.Viewport.y`.
/// @param width Initial value for `mq3.platform.playable_window.Viewport.width`.
/// @param height Initial value for `mq3.platform.playable_window.Viewport.height`.
function viewport(x,y,width,height)
  if not validViewportRectangle(x,y,width,height) then return error(7490,"invalid world triangle viewport") end if
  return Viewport(x,y,width,height)
end function
/// Validates an explicit viewport and camera projection before submitting packed world triangles within it.
/// @param batch Record providing `batch.count`, `batch.data`.
/// @param projection Record providing `projection.position`, `projection.right`, `projection.up`, `projection.forward`, `projection.verticalFocal`, `projection.focal`.
/// @param area Record providing `area.x`, `area.y`, `area.width`, `area.height`.
function submitWorldTriangleBatchViewport(batch,projection,area)
  if area==void then return error(7490,"invalid world triangle viewport") end if
  if not validViewportRectangle(area.x,area.y,area.width,area.height) then return error(7490,"invalid world triangle viewport") end if
  if projection==void or projection.position==void or projection.right==void or projection.up==void or projection.forward==void then return error(7488,"invalid world triangle projection") end if
  if batch.count==0 then return 0 end if
  // Native world draws use one focal value. Scale the submitted view-space
  // Y row so hardware and software project with the refdef's vertical focal.
  verticalScale=projection.verticalFocal/projection.focal
  rendered=worldTriangleBatchViewportNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count,area.x,area.y,area.width,area.height,projection.position[0],projection.position[1],projection.position[2],projection.right[0],projection.right[1],projection.right[2],projection.up[0]*verticalScale,projection.up[1]*verticalScale,projection.up[2]*verticalScale,projection.forward[0],projection.forward[1],projection.forward[2],projection.focal,projection.nearDistance)
  if rendered!=batch.count then return error(7488,"native viewport world triangle batch was rejected") end if
  return rendered
end function
