# `src/mq3/renderer/entity_surface_policy.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.entity_surface_policy`](Package-mq3-renderer-entity-surface-policy-405754921.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-entity-surface-policy-isportalmarker-function-isportalmarker-retype-src-mq3-renderer-entity-surface-policy-ml-317152681"></a>
### isPortalMarker

```ml
function isPortalMarker(reType)
```

Computes `reType==RT_PORTALSURFACE` for `mq3.renderer.entity_surface_policy.isPortalMarker`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reType` | `dynamic` | — | Input used in the result expression `reType==RT_PORTALSURFACE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/entity_surface_policy.ml#L20)

<a id="constant-constant-mq3-renderer-entity-surface-policy-rf-first-person-const-rf-first-person-4-src-mq3-renderer-entity-surface-policy-ml-248603051"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/entity_surface_policy.ml#L6)

<a id="constant-constant-mq3-renderer-entity-surface-policy-rf-third-person-const-rf-third-person-2-src-mq3-renderer-entity-surface-policy-ml-225065245"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/entity_surface_policy.ml#L5)

<a id="constant-constant-mq3-renderer-entity-surface-policy-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-entity-surface-policy-ml-855102100"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/entity_surface_policy.ml#L7)

<a id="function-function-mq3-renderer-entity-surface-policy-visible-function-visible-retype-renderfx-isportal-src-mq3-renderer-entity-surface-policy-ml-461004745"></a>
### visible

```ml
function visible(reType, renderfx, isPortal)
```

Returns `reType!=RT_PORTALSURFACE` from `mq3.renderer.entity_surface_policy.visible`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reType` | `dynamic` | — | Input used in the result expression `reType!=RT_PORTALSURFACE`. |
| `renderfx` | `dynamic` | — | Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`. |
| `isPortal` | `dynamic` | — | Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/entity_surface_policy.ml#L13)
