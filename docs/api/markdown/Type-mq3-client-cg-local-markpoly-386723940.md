# `mq3.client.cg_local.MarkPoly`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-markpoly-struct-markpoly-src-mq3-client-cg-local-ml-961696619"></a>
## MarkPoly

```ml
struct MarkPoly
```

Stores client game local mark poly record, including `prevMark`, `nextMark`, `time`, `markShader`, `alphaFade`, `color` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L285)

## Members

<a id="field-field-mq3-client-cg-local-markpoly-alphafade-alphafade-src-mq3-client-cg-local-ml-1382142114"></a>
### alphaFade

```ml
alphaFade
```

True when the mark fades its alpha channel instead of its RGB components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L295)

<a id="field-field-mq3-client-cg-local-markpoly-color-color-src-mq3-client-cg-local-ml-1581117830"></a>
### color

```ml
color
```

RGBA base color retained by the native-compatible persistent mark polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L297)

<a id="field-field-mq3-client-cg-local-markpoly-markshader-markshader-src-mq3-client-cg-local-ml-1901736878"></a>
### markShader

```ml
markShader
```

Shader used to draw the surface-impact decal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L293)

<a id="field-field-mq3-client-cg-local-markpoly-nextmark-nextmark-src-mq3-client-cg-local-ml-2097457066"></a>
### nextMark

```ml
nextMark
```

Next mark polygon in the active or free linked list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L289)

<a id="field-field-mq3-client-cg-local-markpoly-poly-poly-src-mq3-client-cg-local-ml-686075698"></a>
### poly

```ml
poly
```

Polygon description or associated polygon storage used by the mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L299)

<a id="field-field-mq3-client-cg-local-markpoly-prevmark-prevmark-src-mq3-client-cg-local-ml-795656910"></a>
### prevMark

```ml
prevMark
```

Previous mark polygon in the active or free linked list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L287)

<a id="field-field-mq3-client-cg-local-markpoly-time-time-src-mq3-client-cg-local-ml-676082188"></a>
### time

```ml
time
```

Client timestamp used as the creation or update reference for this temporary visual effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L291)

<a id="field-field-mq3-client-cg-local-markpoly-verts-verts-src-mq3-client-cg-local-ml-1565568294"></a>
### verts

```ml
verts
```

Vertex records forming the polygon or rendered geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L301)
