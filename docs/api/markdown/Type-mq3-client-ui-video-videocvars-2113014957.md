# `mq3.client.ui_video.VideoCvars`

[Home](README.md) · [Source file](File-src-mq3-client-ui-video-ml-1287978223.md)

<a id="struct-struct-mq3-client-ui-video-videocvars-struct-videocvars-src-mq3-client-ui-video-ml-1323200095"></a>
## VideoCvars

```ml
struct VideoCvars
```

Stores UI video video cvars record, including `mode`, `fullscreen`, `allowExtensions`, `picmip`, `vertexLight`, `textureBits` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L120)

## Members

<a id="field-field-mq3-client-ui-video-videocvars-allowextensions-allowextensions-src-mq3-client-ui-video-ml-2068031293"></a>
### allowExtensions

```ml
allowExtensions
```

Nonzero when the renderer is allowed to use optional graphics-driver extensions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L126)

<a id="field-field-mq3-client-ui-video-videocvars-colorbits-colorbits-src-mq3-client-ui-video-ml-1788891629"></a>
### colorBits

```ml
colorBits
```

Number of bits requested or provided for the framebuffer's color channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L140)

<a id="field-field-mq3-client-ui-video-videocvars-fullscreen-fullscreen-src-mq3-client-ui-video-ml-185412607"></a>
### fullscreen

```ml
fullscreen
```

Fullscreen video setting supplied by the renderer configuration variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L124)

<a id="field-field-mq3-client-ui-video-videocvars-gldriver-gldriver-src-mq3-client-ui-video-ml-400600419"></a>
### glDriver

```ml
glDriver
```

Configured OpenGL driver name or path selected by the video-settings UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L142)

<a id="field-field-mq3-client-ui-video-videocvars-lodbias-lodbias-src-mq3-client-ui-video-ml-1004510693"></a>
### lodBias

```ml
lodBias
```

Bias applied when choosing lower-detail model geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L136)

<a id="field-field-mq3-client-ui-video-videocvars-mode-mode-src-mq3-client-ui-video-ml-1556341711"></a>
### mode

```ml
mode
```

Renderer video-mode index read from the engine's mode configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L122)

<a id="field-field-mq3-client-ui-video-videocvars-picmip-picmip-src-mq3-client-ui-video-ml-360401525"></a>
### picmip

```ml
picmip
```

Texture mip-level reduction setting; larger values select lower-resolution texture data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L128)

<a id="field-field-mq3-client-ui-video-videocvars-subdivisions-subdivisions-src-mq3-client-ui-video-ml-1492599261"></a>
### subdivisions

```ml
subdivisions
```

Renderer subdivision setting used to control curved-surface geometry detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L138)

<a id="field-field-mq3-client-ui-video-videocvars-texturebits-texturebits-src-mq3-client-ui-video-ml-248281097"></a>
### textureBits

```ml
textureBits
```

Requested color precision for texture storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L132)

<a id="field-field-mq3-client-ui-video-videocvars-texturemode-texturemode-src-mq3-client-ui-video-ml-125576405"></a>
### textureMode

```ml
textureMode
```

Texture-filtering mode name used to select bilinear or trilinear sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L134)

<a id="field-field-mq3-client-ui-video-videocvars-vertexlight-vertexlight-src-mq3-client-ui-video-ml-257850581"></a>
### vertexLight

```ml
vertexLight
```

Nonzero when lighting is computed from vertex colors instead of lightmap sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L130)
