# `mq3.format.md3.Model`

[Home](README.md) · [Source file](File-src-mq3-format-md3-ml-2098563759.md)

<a id="struct-struct-mq3-format-md3-model-struct-model-src-mq3-format-md3-ml-1230757283"></a>
## Model

```ml
struct Model
```

Model record for format.md3, containing `name`, `flags`, `numFrames`, `numTags`, `numSurfaces`, `numSkins`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L76)

## Members

<a id="field-field-mq3-format-md3-model-bounds-bounds-src-mq3-format-md3-ml-1321821836"></a>
### bounds

```ml
bounds
```

Model-local minimum and maximum corners spanning the bounds of every animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L96)

<a id="field-field-mq3-format-md3-model-flags-flags-src-mq3-format-md3-ml-1544786422"></a>
### flags

```ml
flags
```

Raw model flags retained from the MD3 header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L80)

<a id="field-field-mq3-format-md3-model-frames-frames-src-mq3-format-md3-ml-1681532110"></a>
### frames

```ml
frames
```

Animation-frame bounds and origin data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L90)

<a id="field-field-mq3-format-md3-model-name-name-src-mq3-format-md3-ml-882597840"></a>
### name

```ml
name
```

Name retained from the MD3 model header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L78)

<a id="field-field-mq3-format-md3-model-numframes-numframes-src-mq3-format-md3-ml-1025178558"></a>
### numFrames

```ml
numFrames
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L82)

<a id="field-field-mq3-format-md3-model-numskins-numskins-src-mq3-format-md3-ml-602817910"></a>
### numSkins

```ml
numSkins
```

Number of skin slots declared by the model header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L88)

<a id="field-field-mq3-format-md3-model-numsurfaces-numsurfaces-src-mq3-format-md3-ml-552396886"></a>
### numSurfaces

```ml
numSurfaces
```

Number of surfaces described by this model or file record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L86)

<a id="field-field-mq3-format-md3-model-numtags-numtags-src-mq3-format-md3-ml-274752382"></a>
### numTags

```ml
numTags
```

Number of attachment tags stored for each model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L84)

<a id="field-field-mq3-format-md3-model-surfaces-surfaces-src-mq3-format-md3-ml-521059038"></a>
### surfaces

```ml
surfaces
```

Surface meshes and their shader assignments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L94)

<a id="field-field-mq3-format-md3-model-tags-tags-src-mq3-format-md3-ml-1737686620"></a>
### tags

```ml
tags
```

Attachment Tag records indexed first by animation frame, then by tag number within that frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L92)
