# `mq3.botlib.l_script.Script`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-script-ml-301363504.md)

<a id="struct-struct-mq3-botlib-l-script-script-struct-script-src-mq3-botlib-l-script-ml-325178653"></a>
## Script

```ml
struct Script
```

`Script` record for l script, containing `runtime`, `source`, `lastOffset`, `lastLine` and `whitespaceStart` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L206)

## Members

<a id="field-field-mq3-botlib-l-script-script-flags-flags-src-mq3-botlib-l-script-ml-956563984"></a>
### flags

```ml
flags
```

Scanner options controlling accepted syntax and diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L222)

<a id="field-field-mq3-botlib-l-script-script-freed-freed-src-mq3-botlib-l-script-ml-360271856"></a>
### freed

```ml
freed
```

True after this managed resource has been released.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L228)

<a id="field-field-mq3-botlib-l-script-script-lastline-lastline-src-mq3-botlib-l-script-ml-1337106356"></a>
### lastLine

```ml
lastLine
```

Line before reading token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L214)

<a id="field-field-mq3-botlib-l-script-script-lastoffset-lastoffset-src-mq3-botlib-l-script-ml-243450486"></a>
### lastOffset

```ml
lastOffset
```

Source offset retained so the most recently read token can be unread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L212)

<a id="field-field-mq3-botlib-l-script-script-punctuations-punctuations-src-mq3-botlib-l-script-ml-286843726"></a>
### punctuations

```ml
punctuations
```

The punctuations used in the script.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L224)

<a id="field-field-mq3-botlib-l-script-script-runtime-runtime-src-mq3-botlib-l-script-ml-1847999336"></a>
### runtime

```ml
runtime
```

Owning scanner runtime providing source services and diagnostic callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L208)

<a id="field-field-mq3-botlib-l-script-script-source-source-src-mq3-botlib-l-script-ml-1460214690"></a>
### source

```ml
source
```

Source text and scanner state consumed by this script reader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L210)

<a id="field-field-mq3-botlib-l-script-script-token-token-src-mq3-botlib-l-script-ml-1594311040"></a>
### token

```ml
token
```

Most recently scanned token retained for unread or lookahead operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L226)

<a id="field-field-mq3-botlib-l-script-script-tokenavailable-tokenavailable-src-mq3-botlib-l-script-ml-1349980064"></a>
### tokenAvailable

```ml
tokenAvailable
```

True when the last token has been unread and will be returned again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L220)

<a id="field-field-mq3-botlib-l-script-script-whitespaceend-whitespaceend-src-mq3-botlib-l-script-ml-67434304"></a>
### whitespaceEnd

```ml
whitespaceEnd
```

Source offset immediately after whitespace preceding the token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L218)

<a id="field-field-mq3-botlib-l-script-script-whitespacestart-whitespacestart-src-mq3-botlib-l-script-ml-1734531020"></a>
### whitespaceStart

```ml
whitespaceStart
```

Source offset at the beginning of whitespace preceding the token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_script.ml#L216)
