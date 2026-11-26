# `mq3.client.ui_shared.Source`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-source-struct-source-src-mq3-client-ui-shared-ml-1475497935"></a>
## Source

```ml
struct Source
```

Stores UI shared source record, including `scan`, `name`, `warnings`, `errors`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L180)

## Members

<a id="field-field-mq3-client-ui-shared-source-errors-errors-src-mq3-client-ui-shared-ml-436365398"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L188)

<a id="field-field-mq3-client-ui-shared-source-name-name-src-mq3-client-ui-shared-ml-407053338"></a>
### name

```ml
name
```

Source name included in parser diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L184)

<a id="field-field-mq3-client-ui-shared-source-scan-scan-src-mq3-client-ui-shared-ml-979426726"></a>
### scan

```ml
scan
```

Token-scanner state used to read the menu or script source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L182)

<a id="field-field-mq3-client-ui-shared-source-warnings-warnings-src-mq3-client-ui-shared-ml-220985574"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostic messages collected while processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L186)
