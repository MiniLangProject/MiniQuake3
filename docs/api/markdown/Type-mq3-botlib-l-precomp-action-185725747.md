# `mq3.botlib.l_precomp.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-precomp-ml-1036988431.md)

<a id="struct-struct-mq3-botlib-l-precomp-action-struct-action-src-mq3-botlib-l-precomp-ml-76654187"></a>
## Action

```ml
struct Action
```

`Action` record for l precomp, containing `kind`, `message`, `file`, `line` and `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L73)

## Members

<a id="field-field-mq3-botlib-l-precomp-action-dispatched-dispatched-src-mq3-botlib-l-precomp-ml-886021413"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L83)

<a id="field-field-mq3-botlib-l-precomp-action-file-file-src-mq3-botlib-l-precomp-ml-330403391"></a>
### file

```ml
file
```

Source file associated with the diagnostic or allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L79)

<a id="field-field-mq3-botlib-l-precomp-action-kind-kind-src-mq3-botlib-l-precomp-ml-1053045891"></a>
### kind

```ml
kind
```

Diagnostic or lifecycle action emitted by the preprocessor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L75)

<a id="field-field-mq3-botlib-l-precomp-action-line-line-src-mq3-botlib-l-precomp-ml-1920609919"></a>
### line

```ml
line
```

Source-line number associated with the token, diagnostic, or allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L81)

<a id="field-field-mq3-botlib-l-precomp-action-message-message-src-mq3-botlib-l-precomp-ml-396634771"></a>
### message

```ml
message
```

Text associated with the reported event or diagnostic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L77)
