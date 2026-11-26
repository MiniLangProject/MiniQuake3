# `src/mq3/shared/info.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.info`](Package-mq3-shared-info-914793151.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-shared-info-copy-function-copy-text-capacity-src-mq3-shared-info-ml-1790774425"></a>
### copy

```ml
function copy(text, capacity)
```

Copy info in shared.info; the normal completion returns `text`.

Validation failures include `Info copy has no native storage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(capacity - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L25)

<a id="function-function-mq3-shared-info-infodiagnostic-function-infodiagnostic-context-diagnosticfn-message-src-mq3-shared-info-ml-1332858825"></a>
### infoDiagnostic

```ml
function infoDiagnostic(context, diagnosticFn, message)
```

Compute info diagnostic in shared.info.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context used in `diagnosticFn(context, message)`. |
| `diagnosticFn` | `dynamic` | — | Callback invoked for diagnostic; the call sites below define the callback arguments. |
| `message` | `dynamic` | — | Message used in `diagnosticFn(context, message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L89)

<a id="function-function-mq3-shared-info-removekey-function-removekey-info-key-src-mq3-shared-info-ml-67983453"></a>
### removeKey

```ml
function removeKey(info, key)
```

Remove key in shared.info; the normal completion returns `info`.

Validation failures include `Info_RemoveKey: oversize infostring`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `key` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L60)

<a id="function-function-mq3-shared-info-setvalue-function-setvalue-info-key-newvalue-context-diagnosticfn-src-mq3-shared-info-ml-2117446646"></a>
### setValue

```ml
function setValue(info, key, newValue, context, diagnosticFn)
```

Set value in shared.info; the normal completion returns `(prefix + remaining)`.

Validation failures include `Info_SetValueForKey: oversize infostring`; `Info value would overflow original Com_sprintf scratch storage`; `Info value would write beyond original 1024-byte storage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `key` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `newValue` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.shared.info.infoDiagnostic`. |
| `diagnosticFn` | `dynamic` | — | Diagnostic fn passed as `diagnosticFn` to `mq3.shared.info.infoDiagnostic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L102)

<a id="function-function-mq3-shared-info-textbytes-function-textbytes-text-src-mq3-shared-info-ml-986412897"></a>
### textBytes

```ml
function textBytes(text)
```

Compute text bytes in shared.info; the normal completion returns `data`.

Validation failures include `NULL info string`; `Info string contains embedded NUL`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L12)

<a id="function-function-mq3-shared-info-valid-function-valid-info-src-mq3-shared-info-ml-1288371482"></a>
### valid

```ml
function valid(info)
```

Validate info in shared.info; the normal completion returns `((strings.indexOf(info, "\"", 0) < 0) and (strings.indexOf(info, ";", 0) < 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L49)

<a id="function-function-mq3-shared-info-value-function-value-info-key-src-mq3-shared-info-ml-452499257"></a>
### value

```ml
function value(info, key)
```

Compute value in shared.info; the normal completion returns `""`.

Validation failures include `Info_ValueForKey: oversize infostring`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |
| `key` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.textBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/info.ml#L36)
