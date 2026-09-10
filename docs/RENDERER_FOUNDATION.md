# Renderer foundation

`mq3.renderer.shader_index` ports the first renderer data path from
`tr_shader.c`: shader-name hashing, slash and ASCII-case normalization,
extension handling, the 2,048-bucket text index and lookup of the first
definition. The scanner skips nested braced sections and rejects incomplete
shader text safely.

Ten records execute the unchanged `generateHashValue` and
`FindShaderInShaderText` bodies; ten MiniLang contracts cover index and parser
boundaries. Run `python scripts/test_shader_index.py`.

`mq3.renderer.shader_parser` consumes indexed definitions and ports the central
material/stage directives: maps and animations, blend/depth state, RGB/alpha
generation, texture-coordinate generation and transforms, surface flags,
sorting and culling. Thirty unchanged-C records and 32 contracts pass. Run
`python scripts/test_shader_parser.py`.

`mq3.renderer.tga` adds the original renderer's type 2, 3 and 10 TGA decoder,
including 8/24/32-bit input, BGR(A)-to-RGBA conversion, bottom-up rows and RLE
packets across row boundaries. Five unchanged-C records and 22 contracts pass.
Run `python scripts/test_tga.py`.

`mq3.renderer.image_processing` ports `ResampleTexture`, `R_LightScaleTexture`,
`R_MipMap2` and `R_MipMap`. Ten unchanged-C records and 19 contracts cover
resampling, alpha preservation, one-dimensional mipmaps, the wrapped 4x4 filter
and the gamma/intensity branches. Run `python scripts/test_image_processing.py`.

`mq3.renderer.surface_polychain` starts the CPU surface backend with the exact
`RB_SurfacePolychain` append path: positions, texture coordinates, vertex colors,
fan indices, base offsets and the original strict overflow rule. Three direct
C records and 21 contracts pass. Run `python scripts/test_surface_polychain.py`.

`mq3.renderer.image_registry` connects loading, caching and CPU upload planning.
It preserves the renderer's filename hash, extension fallback, flag-conflict
diagnostics, lightmap TMU selection, texture numbering and image limits. Upload
plans apply power-of-two sizing, round-down, picmip, device-size limits, RGB(A)
or S3TC format choice, color scaling and full mip chains before an injected GPU
submission boundary. Eight exact C records and 29 contracts pass. Run
`python scripts/test_image_registry.py`.

`mq3.renderer.surface_mesh` adds `RB_SurfaceTriangles` and `RB_SurfaceFace` to a
shared CPU tessellation buffer. It rebases indices, copies positions, normals,
base/lightmap coordinates, colors and per-vertex light bits, and preserves the
strict overflow/flush boundary. Three exact C records and 30 contracts pass.
Run `python scripts/test_surface_mesh.py`.

`mq3.renderer.surface_md3` adds `VectorArrayNormalize`, `LerpMeshVertexes` and
`RB_SurfaceMesh`. It preserves binary32 MD3 coordinate scaling, the original
1,024-entry sine table, packed lat/lng normals, `Q_rsqrt` normalization,
frame interpolation, rebased indices, texture coordinates and tessellation
overflow behavior. Three exact C records and 31 contracts pass. Run
`python scripts/test_surface_md3.py`.

`mq3.renderer.model_tags` connects animated MD3 models to attached weapons and
player parts through `R_GetTag`, `R_LerpTag` and `R_ModelBounds`. Seven exact C
records and 26 contracts cover frame clamping, normalized interpolated axes,
missing-tag identity and brush/MD3 bounds. Run `python scripts/test_model_tags.py`.

`mq3.renderer.view_math` ports eight transform and frustum functions from
`tr_main.c`, including local/world conversion, model-to-clip, clip-to-window,
point/radius culling and local-box culling. Eleven exact C records and 36
contracts pass. Run `python scripts/test_renderer_view_math.py`.

`mq3.renderer.surface_entities` adds CPU-side sprite quads through
`RB_AddQuadStampExt`, `RB_AddQuadStamp` and `RB_SurfaceSprite`. Six exact C
records and 31 contracts cover rotation, mirroring, both texture-coordinate
sets, colors, index rebasing and strict tessellation overflow. Run
`python scripts/test_surface_entities.py`.

`mq3.renderer.texture_state` ports `GL_Bind`, `GL_SelectTexture` and
`GL_BindMultitexture` behind injected GL callbacks. Eighteen exact C records and
30 contracts cover both texture units, bind caching, frame-use accounting, NULL
fallback, `r_nobind` and callback ordering. Run `python scripts/test_texture_state.py`.

`mq3.renderer.surface_grid` ports `RB_SurfaceGrid`, including LOD row/column
selection, multi-batch strips, repeated boundary rows, original winding, all
vertex attributes and the post-flush dynamic-light behavior. Five exact C
records and 30 contracts pass. Run `python scripts/test_surface_grid.py`.

`mq3.renderer.command_queue` adds the 0x40000-byte front-end queue and executes
set-color, stretch-pic, draw-buffer and swap commands through backend services.
Seven exact C records and 29 contracts cover capacity, fatal/drop behavior,
shader batching, quad geometry and frame-end ordering. Run
`python scripts/test_renderer_commands.py`.

`mq3.renderer.scene_queue` adds scene marks and submission for polygons,
reference entities and normal/additive dynamic lights. Six exact header values
and 24 contracts cover capacities, fog intersection, entity types and the
original hardware exceptions. Run `python scripts/test_scene_queue.py`.

`mq3.renderer.draw_surfs` ports the QSORT bit layout, masked draw-surface ring,
key decomposition and stable ascending ordering. Five exact C records and 34
contracts pass. Run `python scripts/test_draw_surfs.py`.
