# `mq3.client.cgame_localents.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-localents-ml-2123896286.md)

<a id="struct-struct-mq3-client-cgame-localents-state-struct-state-src-mq3-client-cgame-localents-ml-1972157803"></a>
## State

```ml
struct State
```

Stores client game localents state, including `entities`, `free`, `active`, `time`, `frametime`, `vieworg` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L210)

## Members

<a id="field-field-mq3-client-cgame-localents-state-actions-actions-src-mq3-client-cgame-localents-ml-696863340"></a>
### actions

```ml
actions
```

Host requests queued while advancing temporary fragments, puffs, marks, and other local effects, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L232)

<a id="field-field-mq3-client-cgame-localents-state-active-active-src-mq3-client-cgame-localents-ml-245437324"></a>
### active

```ml
active
```

When constructing this record, `initLocalEntities` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L217)

<a id="field-field-mq3-client-cgame-localents-state-audio-audio-src-mq3-client-cgame-localents-ml-1288082496"></a>
### audio

```ml
audio
```

When constructing this record, `initLocalEntities` supplies `0` for this member. Used by `boundary` and `clearBoundaryActions` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L238)

<a id="field-field-mq3-client-cgame-localents-state-entities-entities-src-mq3-client-cgame-localents-ml-747340182"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L212)

<a id="field-field-mq3-client-cgame-localents-state-errors-errors-src-mq3-client-cgame-localents-ml-60279862"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L249)

<a id="field-field-mq3-client-cgame-localents-state-frametime-frametime-src-mq3-client-cgame-localents-ml-1655440216"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L221)

<a id="field-field-mq3-client-cgame-localents-state-free-free-src-mq3-client-cgame-localents-ml-1803133348"></a>
### free

```ml
free
```

When constructing this record, `initLocalEntities` supplies `free` for this member. Used by `freeLocalEntity` and `allocLocalEntity` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L215)

<a id="field-field-mq3-client-cgame-localents-state-freed-freed-src-mq3-client-cgame-localents-ml-1366688984"></a>
### freed

```ml
freed
```

When constructing this record, `initLocalEntities` supplies `0` for this member. Used by `freeLocalEntity` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L247)

<a id="field-field-mq3-client-cgame-localents-state-marks-marks-src-mq3-client-cgame-localents-ml-922694608"></a>
### marks

```ml
marks
```

When constructing this record, `initLocalEntities` supplies `0` for this member. Used by `boundary` and `clearBoundaryActions` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L241)

<a id="field-field-mq3-client-cgame-localents-state-rendered-rendered-src-mq3-client-cgame-localents-ml-1023557306"></a>
### rendered

```ml
rendered
```

When constructing this record, `initLocalEntities` supplies `0` for this member. Used by `boundary` and `clearBoundaryActions` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L235)

<a id="field-field-mq3-client-cgame-localents-state-retailactive-retailactive-src-mq3-client-cgame-localents-ml-640692738"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns short-lived client effect entities, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L227)

<a id="field-field-mq3-client-cgame-localents-state-services-services-src-mq3-client-cgame-localents-ml-1656648296"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L229)

<a id="field-field-mq3-client-cgame-localents-state-spawned-spawned-src-mq3-client-cgame-localents-ml-1922654552"></a>
### spawned

```ml
spawned
```

When constructing this record, `initLocalEntities` supplies `0` for this member. Used by `allocLocalEntity` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L244)

<a id="field-field-mq3-client-cgame-localents-state-time-time-src-mq3-client-cgame-localents-ml-175530470"></a>
### time

```ml
time
```

Current client-game time in milliseconds used to update, fade, and expire local entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L219)

<a id="field-field-mq3-client-cgame-localents-state-vieworg-vieworg-src-mq3-client-cgame-localents-ml-92878124"></a>
### vieworg

```ml
vieworg
```

When constructing this record, `initLocalEntities` supplies `[0.0,0.0,0.0]` for this member. Used by `nearView` and `addScorePlum` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L224)
