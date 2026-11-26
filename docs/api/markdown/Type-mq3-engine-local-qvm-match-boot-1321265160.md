# `mq3.engine.local_qvm_match.Boot`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-boot-struct-boot-src-mq3-engine-local-qvm-match-ml-1033114427"></a>
## Boot

```ml
struct Boot
```

Boot record for engine.local_qvm_match, containing `game`, `runtime`, `context`, `cgame`, `ui`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L473)

## Members

<a id="field-field-mq3-engine-local-qvm-match-boot-cgame-cgame-src-mq3-engine-local-qvm-match-ml-1961308309"></a>
### cgame

```ml
cgame
```

Loaded client-game VM instance used by the local match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L481)

<a id="field-field-mq3-engine-local-qvm-match-boot-context-context-src-mq3-engine-local-qvm-match-ml-2081679245"></a>
### context

```ml
context
```

Shared local-match host state used by the loaded game, client-game, and UI VMs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L479)

<a id="field-field-mq3-engine-local-qvm-match-boot-game-game-src-mq3-engine-local-qvm-match-ml-1125503077"></a>
### game

```ml
game
```

Loaded game VM instance or native game state used by the local match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L475)

<a id="field-field-mq3-engine-local-qvm-match-boot-runtime-runtime-src-mq3-engine-local-qvm-match-ml-1020806301"></a>
### runtime

```ml
runtime
```

Runtime object used to execute the subsystem's operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L477)

<a id="field-field-mq3-engine-local-qvm-match-boot-ui-ui-src-mq3-engine-local-qvm-match-ml-1744378949"></a>
### ui

```ml
ui
```

Loaded user-interface VM instance used by the local match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L483)
