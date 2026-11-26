# `mq3.botlib.l_precomp.Source`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-precomp-ml-1036988431.md)

<a id="struct-struct-mq3-botlib-l-precomp-source-struct-source-src-mq3-botlib-l-precomp-ml-815101015"></a>
## Source

```ml
struct Source
```

`Source` record for l precomp, containing `runtime`, `handle`, `includePath`, `punctuations` and `lastToken` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L112)

## Members

<a id="field-field-mq3-botlib-l-precomp-source-handle-handle-src-mq3-botlib-l-precomp-ml-980824732"></a>
### handle

```ml
handle
```

Registry handle identifying this loaded preprocessor source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L116)

<a id="field-field-mq3-botlib-l-precomp-source-includepath-includepath-src-mq3-botlib-l-precomp-ml-848479300"></a>
### includePath

```ml
includePath
```

Path to include files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L118)

<a id="field-field-mq3-botlib-l-precomp-source-indents-indents-src-mq3-botlib-l-precomp-ml-958931076"></a>
### indents

```ml
indents
```

Active stack of conditional-preprocessor nesting records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L124)

<a id="field-field-mq3-botlib-l-precomp-source-lasttoken-lasttoken-src-mq3-botlib-l-precomp-ml-805760"></a>
### lastToken

```ml
lastToken
```

Most recently returned preprocessor token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L122)

<a id="field-field-mq3-botlib-l-precomp-source-punctuations-punctuations-src-mq3-botlib-l-precomp-ml-1934734922"></a>
### punctuations

```ml
punctuations
```

Punctuations to use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L120)

<a id="field-field-mq3-botlib-l-precomp-source-runtime-runtime-src-mq3-botlib-l-precomp-ml-1201162868"></a>
### runtime

```ml
runtime
```

Owning preprocessor runtime containing the source registry and diagnostic actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L114)

<a id="field-field-mq3-botlib-l-precomp-source-scripts-scripts-src-mq3-botlib-l-precomp-ml-1412905404"></a>
### scripts

```ml
scripts
```

Script inputs currently stacked by include processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L126)
