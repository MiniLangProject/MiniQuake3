# `mq3.client.command_ring.AdvanceResult`

[Home](README.md) · [Source file](File-src-mq3-client-command-ring-ml-1850754325.md)

<a id="struct-struct-mq3-client-command-ring-advanceresult-struct-advanceresult-src-mq3-client-command-ring-ml-1654696311"></a>
## AdvanceResult

```ml
struct AdvanceResult
```

Stores command ring advance result record, including `created`, `frameMsec`, `oldFrameTime`, `commandNumber`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L16)

## Members

<a id="field-field-mq3-client-command-ring-advanceresult-commandnumber-commandnumber-src-mq3-client-command-ring-ml-1698955396"></a>
### commandNumber

```ml
commandNumber
```

When constructing this record, `advance` supplies `commandNumber` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L24)

<a id="field-field-mq3-client-command-ring-advanceresult-created-created-src-mq3-client-command-ring-ml-774292116"></a>
### created

```ml
created
```

When constructing this record, `advance` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L18)

<a id="field-field-mq3-client-command-ring-advanceresult-framemsec-framemsec-src-mq3-client-command-ring-ml-15936400"></a>
### frameMsec

```ml
frameMsec
```

When constructing this record, `advance` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L20)

<a id="field-field-mq3-client-command-ring-advanceresult-oldframetime-oldframetime-src-mq3-client-command-ring-ml-459028618"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L22)

<a id="field-field-mq3-client-command-ring-advanceresult-slot-slot-src-mq3-client-command-ring-ml-912844624"></a>
### slot

```ml
slot
```

Ring-buffer slot selected for the newly advanced command sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/command_ring.ml#L26)
