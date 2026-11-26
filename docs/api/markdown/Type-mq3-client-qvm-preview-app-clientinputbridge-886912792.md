# `mq3.client.qvm_preview_app.ClientInputBridge`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)

<a id="struct-struct-mq3-client-qvm-preview-app-clientinputbridge-struct-clientinputbridge-src-mq3-client-qvm-preview-app-ml-714080257"></a>
## ClientInputBridge

```ml
struct ClientInputBridge
```

Stores QVM preview app client input bridge record, including `frame`, `plan`, `ui`, `matchState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L117)

## Members

<a id="field-field-mq3-client-qvm-preview-app-clientinputbridge-frame-frame-src-mq3-client-qvm-preview-app-ml-1704198821"></a>
### frame

```ml
frame
```

Client frame-input state retaining held controls, view angles, and command sequencing for event translation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L120)

<a id="field-field-mq3-client-qvm-preview-app-clientinputbridge-matchstate-matchstate-src-mq3-client-qvm-preview-app-ml-1457221153"></a>
### matchState

```ml
matchState
```

When constructing this record, `runMatchWithLoading` supplies `state` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L126)

<a id="field-field-mq3-client-qvm-preview-app-clientinputbridge-plan-plan-src-mq3-client-qvm-preview-app-ml-1376539095"></a>
### plan

```ml
plan
```

When constructing this record, `runMatchWithLoading` supplies `initialPlan` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L122)

<a id="field-field-mq3-client-qvm-preview-app-clientinputbridge-ui-ui-src-mq3-client-qvm-preview-app-ml-2122105649"></a>
### ui

```ml
ui
```

When constructing this record, `runMatchWithLoading` supplies `ui` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L124)
