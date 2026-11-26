# `mq3.engine.local_qvm_match.FileCursor`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-filecursor-struct-filecursor-src-mq3-engine-local-qvm-match-ml-1977478019"></a>
## FileCursor

```ml
struct FileCursor
```

FileCursor record for engine.local_qvm_match, containing `data`, `offset`, `writePath`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L182)

## Members

<a id="field-field-mq3-engine-local-qvm-match-filecursor-data-data-src-mq3-engine-local-qvm-match-ml-1877315881"></a>
### data

```ml
data
```

Buffered contents of the file opened through the VM filesystem traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L184)

<a id="field-field-mq3-engine-local-qvm-match-filecursor-offset-offset-src-mq3-engine-local-qvm-match-ml-1298519371"></a>
### offset

```ml
offset
```

Byte offset of the current cursor or data range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L186)

<a id="field-field-mq3-engine-local-qvm-match-filecursor-writepath-writepath-src-mq3-engine-local-qvm-match-ml-1004753013"></a>
### writePath

```ml
writePath
```

Destination path used when the file cursor is closed or flushed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L188)
