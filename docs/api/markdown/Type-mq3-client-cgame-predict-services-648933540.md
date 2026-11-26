# `mq3.client.cgame_predict.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-predict-ml-1773632218.md)

<a id="struct-struct-mq3-client-cgame-predict-services-struct-services-src-mq3-client-cgame-predict-ml-1517065519"></a>
## Services

```ml
struct Services
```

Stores client game predict host-service callbacks, including `worldTraceFn`, `entityTraceFn`, `worldPointFn`, `entityPointFn`, `triggerTouchFn`, `moverAdjustFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L41)

## Members

<a id="field-field-mq3-client-cgame-predict-services-context-context-src-mq3-client-cgame-predict-ml-282364541"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for local player-movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L62)

<a id="field-field-mq3-client-cgame-predict-services-entitypointfn-entitypointfn-src-mq3-client-cgame-predict-ml-1902372217"></a>
### entityPointFn

```ml
entityPointFn
```

Host callback for the entity point operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L53)

<a id="field-field-mq3-client-cgame-predict-services-entitytracefn-entitytracefn-src-mq3-client-cgame-predict-ml-114956729"></a>
### entityTraceFn

```ml
entityTraceFn
```

Host callback for the entity trace operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L47)

<a id="field-field-mq3-client-cgame-predict-services-moveradjustfn-moveradjustfn-src-mq3-client-cgame-predict-ml-956651717"></a>
### moverAdjustFn

```ml
moverAdjustFn
```

Host callback for the mover adjust operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L59)

<a id="field-field-mq3-client-cgame-predict-services-triggertouchfn-triggertouchfn-src-mq3-client-cgame-predict-ml-415628711"></a>
### triggerTouchFn

```ml
triggerTouchFn
```

Host callback for the trigger touch operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L56)

<a id="field-field-mq3-client-cgame-predict-services-worldpointfn-worldpointfn-src-mq3-client-cgame-predict-ml-702056285"></a>
### worldPointFn

```ml
worldPointFn
```

Host callback for the world point operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L50)

<a id="field-field-mq3-client-cgame-predict-services-worldtracefn-worldtracefn-src-mq3-client-cgame-predict-ml-1349141967"></a>
### worldTraceFn

```ml
worldTraceFn
```

Host callback for the world trace operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L44)
