# `mq3.renderer.mark_fragments.Result`

[Home](README.md) · [Source file](File-src-mq3-renderer-mark-fragments-ml-1532505804.md)

<a id="struct-struct-mq3-renderer-mark-fragments-result-struct-result-src-mq3-renderer-mark-fragments-ml-1831153669"></a>
## Result

```ml
struct Result
```

Data record for `mq3.renderer.mark_fragments.Result`; groups `points`, `fragments`, `candidateSurfaces`, `testedTriangles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/mark_fragments.ml#L48)

## Members

<a id="field-field-mq3-renderer-mark-fragments-result-candidatesurfaces-candidatesurfaces-src-mq3-renderer-mark-fragments-ml-334978326"></a>
### candidateSurfaces

```ml
candidateSurfaces
```

Number of world surfaces considered when projecting marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/mark_fragments.ml#L54)

<a id="field-field-mq3-renderer-mark-fragments-result-fragments-fragments-src-mq3-renderer-mark-fragments-ml-2101290574"></a>
### fragments

```ml
fragments
```

Clipped polygon fragments produced by mark projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/mark_fragments.ml#L52)

<a id="field-field-mq3-renderer-mark-fragments-result-points-points-src-mq3-renderer-mark-fragments-ml-1136431616"></a>
### points

```ml
points
```

Points defining the face, polygon, or clipping result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/mark_fragments.ml#L50)

<a id="field-field-mq3-renderer-mark-fragments-result-testedtriangles-testedtriangles-src-mq3-renderer-mark-fragments-ml-1997277714"></a>
### testedTriangles

```ml
testedTriangles
```

Number of triangles tested while clipping projected marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/mark_fragments.ml#L56)
