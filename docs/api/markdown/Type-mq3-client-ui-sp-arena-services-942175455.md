# `mq3.client.ui_sp_arena.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sp-arena-ml-228611501.md)

<a id="struct-struct-mq3-client-ui-sp-arena-services-struct-services-src-mq3-client-ui-sp-arena-ml-972161759"></a>
## Services

```ml
struct Services
```

Stores UI sp arena host-service callbacks, including `context`, `variableValueFn`, `setValueFn`, `numTiersFn`, `executeTextFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L16)

## Members

<a id="field-field-mq3-client-ui-sp-arena-services-context-context-src-mq3-client-ui-sp-arena-ml-1800311457"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for single-player arena launching.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L19)

<a id="field-field-mq3-client-ui-sp-arena-services-executetextfn-executetextfn-src-mq3-client-ui-sp-arena-ml-1941196925"></a>
### executeTextFn

```ml
executeTextFn
```

Host callback for the execute text operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L31)

<a id="field-field-mq3-client-ui-sp-arena-services-numtiersfn-numtiersfn-src-mq3-client-ui-sp-arena-ml-638975647"></a>
### numTiersFn

```ml
numTiersFn
```

Host callback for the num tiers operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L28)

<a id="field-field-mq3-client-ui-sp-arena-services-setvaluefn-setvaluefn-src-mq3-client-ui-sp-arena-ml-1024843047"></a>
### setValueFn

```ml
setValueFn
```

Host callback for the set value operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L25)

<a id="field-field-mq3-client-ui-sp-arena-services-variablevaluefn-variablevaluefn-src-mq3-client-ui-sp-arena-ml-471370945"></a>
### variableValueFn

```ml
variableValueFn
```

Host callback for the variable value operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_arena.ml#L22)
