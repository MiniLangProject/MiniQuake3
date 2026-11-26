# `mq3.engine.local_qvm_match.SoundCommand`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-soundcommand-struct-soundcommand-src-mq3-engine-local-qvm-match-ml-1860294639"></a>
## SoundCommand

```ml
struct SoundCommand
```

SoundCommand record for engine.local_qvm_match, containing `kind`, `entity`, `channel`, `handle`, `origin`, `velocity`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L216)

## Members

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-axis-axis-src-mq3-engine-local-qvm-match-ml-1407914275"></a>
### axis

```ml
axis
```

Listener orientation basis carried by a spatial-sound listener update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L230)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-channel-channel-src-mq3-engine-local-qvm-match-ml-16947381"></a>
### channel

```ml
channel
```

Selected sound or MIDI channel associated with the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L222)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-entity-entity-src-mq3-engine-local-qvm-match-ml-1987963399"></a>
### entity

```ml
entity
```

Entity identifier associated with the VM sound request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L220)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-flag-flag-src-mq3-engine-local-qvm-match-ml-547333125"></a>
### flag

```ml
flag
```

Operation-specific Boolean or flag passed through the VM sound request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L232)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-handle-handle-src-mq3-engine-local-qvm-match-ml-1948685797"></a>
### handle

```ml
handle
```

Resource handle used to identify the registered or opened object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L224)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-kind-kind-src-mq3-engine-local-qvm-match-ml-1820532581"></a>
### kind

```ml
kind
```

Sound request operation, such as starting playback, updating the listener, or stopping music.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L218)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-origin-origin-src-mq3-engine-local-qvm-match-ml-208759381"></a>
### origin

```ml
origin
```

World position supplied by a positional sound, looping sound, entity update, or listener request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L226)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-text-text-src-mq3-engine-local-qvm-match-ml-2086347859"></a>
### text

```ml
text
```

Text payload, script source, or message associated with this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L234)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-text2-text2-src-mq3-engine-local-qvm-match-ml-1255588497"></a>
### text2

```ml
text2
```

Second text argument carried by the VM sound request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L236)

<a id="field-field-mq3-engine-local-qvm-match-soundcommand-velocity-velocity-src-mq3-engine-local-qvm-match-ml-131685047"></a>
### velocity

```ml
velocity
```

Velocity supplied with the sound or entity update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L228)
