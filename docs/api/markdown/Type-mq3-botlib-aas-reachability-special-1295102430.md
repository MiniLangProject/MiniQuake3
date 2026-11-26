# `mq3.botlib.aas_reachability.Special`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-special-struct-special-src-mq3-botlib-aas-reachability-ml-1744296431"></a>
## Special

```ml
struct Special
```

`Special` record for aas reachability, containing `kind`, `sourceArea`, `destinationArea`, `entity` and `model` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L117)

## Members

<a id="field-field-mq3-botlib-aas-reachability-special-destinationarea-destinationarea-src-mq3-botlib-aas-reachability-ml-633568164"></a>
### destinationArea

```ml
destinationArea
```

AAS area reached at the end of this movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L123)

<a id="field-field-mq3-botlib-aas-reachability-special-entity-entity-src-mq3-botlib-aas-reachability-ml-1333995770"></a>
### entity

```ml
entity
```

Game entity associated with this special movement feature.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L125)

<a id="field-field-mq3-botlib-aas-reachability-special-finish-finish-src-mq3-botlib-aas-reachability-ml-66914078"></a>
### finish

```ml
finish
```

Destination position of the entity-driven movement connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L131)

<a id="field-field-mq3-botlib-aas-reachability-special-kind-kind-src-mq3-botlib-aas-reachability-ml-1539378704"></a>
### kind

```ml
kind
```

Special movement feature type, such as a teleporter, jump pad, or mover.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L119)

<a id="field-field-mq3-botlib-aas-reachability-special-model-model-src-mq3-botlib-aas-reachability-ml-1446060896"></a>
### model

```ml
model
```

Inline BSP model identifier associated with this movement entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L127)

<a id="field-field-mq3-botlib-aas-reachability-special-sourcearea-sourcearea-src-mq3-botlib-aas-reachability-ml-1429605200"></a>
### sourceArea

```ml
sourceArea
```

AAS area from which this reachability or route begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L121)

<a id="field-field-mq3-botlib-aas-reachability-special-start-start-src-mq3-botlib-aas-reachability-ml-553873232"></a>
### start

```ml
start
```

Source position of the entity-driven movement connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L129)

<a id="field-field-mq3-botlib-aas-reachability-special-team-team-src-mq3-botlib-aas-reachability-ml-728316622"></a>
### team

```ml
team
```

Team restriction applied to this special movement feature.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L135)

<a id="field-field-mq3-botlib-aas-reachability-special-velocity-velocity-src-mq3-botlib-aas-reachability-ml-1930546978"></a>
### velocity

```ml
velocity
```

World-space linear velocity associated with the moving entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L133)
