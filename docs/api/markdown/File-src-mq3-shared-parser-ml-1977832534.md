# `src/mq3/shared/parser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.parser`](Package-mq3-shared-parser-748472996.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-shared-parser-at-function-at-state-offset-src-mq3-shared-parser-ml-309673638"></a>
### at

```ml
function at(state, offset)
```

Compute at in shared.parser; the normal completion returns `state.data[offset]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `data`. |
| `offset` | `dynamic` | — | Zero-based index into `state.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/parser.ml#L26)

<a id="function-function-mq3-shared-parser-create-function-create-text-src-mq3-shared-parser-ml-469338955"></a>
### create

```ml
function create(text)
```

Create parser in shared.parser; the normal completion returns `Parser(text, 0, 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.shared.parser.Parser` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/parser.ml#L18)

<a id="function-function-mq3-shared-parser-parseext-function-parseext-state-allowlinebreaks-src-mq3-shared-parser-ml-1879082220"></a>
### parseExt

```ml
function parseExt(state, allowLineBreaks)
```

Parse ext in shared.parser; the normal completion returns `decode(slice(token, 0, length))`.

Validation failures include `quoted token exceeds safe C buffer capacity`.
Direct state writes: `state.offset`, `state.line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `offset`, `line`. Updated in place: `offset`, `line`. |
| `allowLineBreaks` | `dynamic` | — | Allow line breaks used in `(newlines and not allowLineBreaks)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/parser.ml#L37)

- [mq3.shared.parser.Parser](Type-mq3-shared-parser-parser-1824324521.md) — struct
