# `src/mq3/botlib/aas_movement_queries.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_movement_queries`](Package-mq3-botlib-aas-movement-queries-206498782.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-botlib-aas-movement-queries-contents-lava-const-contents-lava-8-src-mq3-botlib-aas-movement-queries-ml-541831749"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision contents bit marking lava.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_movement_queries.ml#L7)

<a id="constant-constant-mq3-botlib-aas-movement-queries-contents-slime-const-contents-slime-16-src-mq3-botlib-aas-movement-queries-ml-531105836"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision contents bit marking slime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_movement_queries.ml#L9)

<a id="constant-constant-mq3-botlib-aas-movement-queries-contents-water-const-contents-water-32-src-mq3-botlib-aas-movement-queries-ml-46992744"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision contents bit marking water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_movement_queries.ml#L11)

<a id="function-function-mq3-botlib-aas-movement-queries-swimming-function-swimming-context-pointcontentsfn-origin-src-mq3-botlib-aas-movement-queries-ml-219146987"></a>
### swimming

```ml
function swimming(context, pointContentsFn, origin)
```

Test whether the point contents permit swimming under the AAS movement rules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `pointContentsFn` | `dynamic` | — | Operand used to evaluate the returned expression `(pointContentsFn(context,test)&(CONTENTS_LAVA\|CONTENTS_SLIME\|CONTENTS_WATER))!=0`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_movement_queries.ml#L17)
