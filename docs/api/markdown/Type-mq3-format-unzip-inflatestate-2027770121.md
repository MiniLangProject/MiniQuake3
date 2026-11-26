# `mq3.format.unzip.InflateState`

[Home](README.md) · [Source file](File-src-mq3-format-unzip-ml-788120655.md)

<a id="struct-struct-mq3-format-unzip-inflatestate-struct-inflatestate-src-mq3-format-unzip-ml-882993623"></a>
## InflateState

```ml
struct InflateState
```

InflateState record for format.unzip, containing `windowBits`, `initialized`, `totalIn`, `totalOut`, `output`, `dictionary`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L126)

## Members

<a id="field-field-mq3-format-unzip-inflatestate-dictionary-dictionary-src-mq3-format-unzip-ml-784830509"></a>
### dictionary

```ml
dictionary
```

Preset or retained dictionary bytes used by the inflater.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L138)

<a id="field-field-mq3-format-unzip-inflatestate-initialized-initialized-src-mq3-format-unzip-ml-119126461"></a>
### initialized

```ml
initialized
```

True while the inflate stream is initialized and has not been ended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L130)

<a id="field-field-mq3-format-unzip-inflatestate-output-output-src-mq3-format-unzip-ml-14240331"></a>
### output

```ml
output
```

Decompressed bytes produced by the managed inflater.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L136)

<a id="field-field-mq3-format-unzip-inflatestate-syncpoint-syncpoint-src-mq3-format-unzip-ml-301703237"></a>
### syncPoint

```ml
syncPoint
```

True when the inflater is positioned at a synchronization boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L140)

<a id="field-field-mq3-format-unzip-inflatestate-totalin-totalin-src-mq3-format-unzip-ml-790872617"></a>
### totalIn

```ml
totalIn
```

Cumulative compressed input bytes consumed by the inflater.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L132)

<a id="field-field-mq3-format-unzip-inflatestate-totalout-totalout-src-mq3-format-unzip-ml-1124309049"></a>
### totalOut

```ml
totalOut
```

Cumulative decompressed output bytes produced by the inflater.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L134)

<a id="field-field-mq3-format-unzip-inflatestate-windowbits-windowbits-src-mq3-format-unzip-ml-1858792285"></a>
### windowBits

```ml
windowBits
```

Configured sliding-window size for the inflater, expressed as a bit count.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L128)
