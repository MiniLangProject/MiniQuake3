# `mq3.client.demo.Record`

[Home](README.md) · [Source file](File-src-mq3-client-demo-ml-1236155596.md)

<a id="struct-struct-mq3-client-demo-record-struct-record-src-mq3-client-demo-ml-1790691341"></a>
## Record

```ml
struct Record
```

Stores demo record, including `completed`, `truncated`, `sequence`, `payload`, `nextOffset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L23)

## Members

<a id="field-field-mq3-client-demo-record-completed-completed-src-mq3-client-demo-ml-1056772078"></a>
### completed

```ml
completed
```

When constructing this record, `completed` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L25)

<a id="field-field-mq3-client-demo-record-nextoffset-nextoffset-src-mq3-client-demo-ml-2061480530"></a>
### nextOffset

```ml
nextOffset
```

When constructing this record, `completed` supplies `offset` for this member. Used by `readDemoMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L36)

<a id="field-field-mq3-client-demo-record-payload-payload-src-mq3-client-demo-ml-91898690"></a>
### payload

```ml
payload
```

When constructing this record, `completed` supplies `bytes(0,0)` for this member. Used by `readDemoMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L33)

<a id="field-field-mq3-client-demo-record-sequence-sequence-src-mq3-client-demo-ml-1706559832"></a>
### sequence

```ml
sequence
```

When constructing this record, `completed` supplies `0` for this member. Used by `readDemoMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L30)

<a id="field-field-mq3-client-demo-record-truncated-truncated-src-mq3-client-demo-ml-182080202"></a>
### truncated

```ml
truncated
```

When constructing this record, `completed` supplies `truncated` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L27)
