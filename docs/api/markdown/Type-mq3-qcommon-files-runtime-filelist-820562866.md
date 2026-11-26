# `mq3.qcommon.files_runtime.FileList`

[Home](README.md) · [Source file](File-src-mq3-qcommon-files-runtime-ml-1340378570.md)

<a id="struct-struct-mq3-qcommon-files-runtime-filelist-struct-filelist-src-mq3-qcommon-files-runtime-ml-1131687307"></a>
## FileList

```ml
struct FileList
```

FileList record for qcommon.files_runtime, containing `count`, `names`, `packed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L62)

## Members

<a id="field-field-mq3-qcommon-files-runtime-filelist-count-count-src-mq3-qcommon-files-runtime-ml-1145180401"></a>
### count

```ml
count
```

Number of valid entries represented by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L64)

<a id="field-field-mq3-qcommon-files-runtime-filelist-names-names-src-mq3-qcommon-files-runtime-ml-1768745213"></a>
### names

```ml
names
```

Matching virtual filenames returned by the directory enumeration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L66)

<a id="field-field-mq3-qcommon-files-runtime-filelist-packed-packed-src-mq3-qcommon-files-runtime-ml-1701257145"></a>
### packed

```ml
packed
```

NUL-separated filename bytes prepared for VM ABI output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L68)
