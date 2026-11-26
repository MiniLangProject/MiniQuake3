# `mq3.engine.local_qvm_match.Refdef`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-refdef-struct-refdef-src-mq3-engine-local-qvm-match-ml-1652675979"></a>
## Refdef

```ml
struct Refdef
```

Refdef record for engine.local_qvm_match, containing `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L191)

## Members

<a id="field-field-mq3-engine-local-qvm-match-refdef-areamask-areamask-src-mq3-engine-local-qvm-match-ml-1522297963"></a>
### areaMask

```ml
areaMask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L213)

<a id="field-field-mq3-engine-local-qvm-match-refdef-flags-flags-src-mq3-engine-local-qvm-match-ml-1421593985"></a>
### flags

```ml
flags
```

View-definition flags controlling world and special-effect rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L211)

<a id="field-field-mq3-engine-local-qvm-match-refdef-fovx-fovx-src-mq3-engine-local-qvm-match-ml-382483111"></a>
### fovX

```ml
fovX
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L201)

<a id="field-field-mq3-engine-local-qvm-match-refdef-fovy-fovy-src-mq3-engine-local-qvm-match-ml-109435585"></a>
### fovY

```ml
fovY
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L203)

<a id="field-field-mq3-engine-local-qvm-match-refdef-height-height-src-mq3-engine-local-qvm-match-ml-770464907"></a>
### height

```ml
height
```

Height in pixels of the client-game viewport decoded from the VM request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L199)

<a id="field-field-mq3-engine-local-qvm-match-refdef-time-time-src-mq3-engine-local-qvm-match-ml-605493047"></a>
### time

```ml
time
```

Client-game view time in milliseconds decoded from the VM rendering request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L209)

<a id="field-field-mq3-engine-local-qvm-match-refdef-viewaxis-viewaxis-src-mq3-engine-local-qvm-match-ml-139223961"></a>
### viewaxis

```ml
viewaxis
```

Camera orientation represented by three basis vectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L207)

<a id="field-field-mq3-engine-local-qvm-match-refdef-vieworg-vieworg-src-mq3-engine-local-qvm-match-ml-1032007885"></a>
### vieworg

```ml
vieworg
```

Camera origin in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L205)

<a id="field-field-mq3-engine-local-qvm-match-refdef-width-width-src-mq3-engine-local-qvm-match-ml-1045287525"></a>
### width

```ml
width
```

Width in pixels of the client-game viewport decoded from the VM request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L197)

<a id="field-field-mq3-engine-local-qvm-match-refdef-x-x-src-mq3-engine-local-qvm-match-ml-2080149017"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L193)

<a id="field-field-mq3-engine-local-qvm-match-refdef-y-y-src-mq3-engine-local-qvm-match-ml-577677685"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L195)
