# `mq3.client.cl_keys_runtime.DrawResult`

[Home](README.md) · [Source file](File-src-mq3-client-cl-keys-runtime-ml-1022053976.md)

<a id="struct-struct-mq3-client-cl-keys-runtime-drawresult-struct-drawresult-src-mq3-client-cl-keys-runtime-ml-455682727"></a>
## DrawResult

```ml
struct DrawResult
```

Stores engine client keys runtime draw result record, including `text`, `x`, `y`, `size`, `cursorVisible`, `cursorX` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L69)

## Members

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-cursorchar-cursorchar-src-mq3-client-cl-keys-runtime-ml-1353607746"></a>
### cursorChar

```ml
cursorChar
```

When constructing this record, `Field_VariableSizeDraw` supplies `cursorChar` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L83)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-cursorvisible-cursorvisible-src-mq3-client-cl-keys-runtime-ml-1438057450"></a>
### cursorVisible

```ml
cursorVisible
```

When constructing this record, `Field_VariableSizeDraw` supplies `cursorVisible` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L79)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-cursorx-cursorx-src-mq3-client-cl-keys-runtime-ml-846810210"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L81)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-prestep-prestep-src-mq3-client-cl-keys-runtime-ml-319175926"></a>
### prestep

```ml
prestep
```

When constructing this record, `Field_VariableSizeDraw` supplies `prestep` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L85)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-size-size-src-mq3-client-cl-keys-runtime-ml-2092922760"></a>
### size

```ml
size
```

When constructing this record, `Field_VariableSizeDraw` supplies `size` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L77)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-text-text-src-mq3-client-cl-keys-runtime-ml-1743714272"></a>
### text

```ml
text
```

Visible, horizontally scrolled substring of the edited field prepared for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L71)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-x-x-src-mq3-client-cl-keys-runtime-ml-629171506"></a>
### x

```ml
x
```

Horizontal coordinate of the visible editable text produced by the keyboard field renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L73)

<a id="field-field-mq3-client-cl-keys-runtime-drawresult-y-y-src-mq3-client-cl-keys-runtime-ml-114216118"></a>
### y

```ml
y
```

Vertical coordinate of the visible editable text produced by the keyboard field renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_keys_runtime.ml#L75)
