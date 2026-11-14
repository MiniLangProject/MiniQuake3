# `src/mq3/botlib/lib_variables.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.lib_variables`](Package-mq3-botlib-lib-variables-1075972509.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-lib-variables-alloc-function-alloc-state-name-src-mq3-botlib-lib-variables-ml-686057920"></a>
### alloc

```ml
function alloc(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L38)

<a id="function-function-mq3-botlib-lib-variables-changed-function-changed-state-name-src-mq3-botlib-lib-variables-ml-439557298"></a>
### changed

```ml
function changed(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L47)

<a id="function-function-mq3-botlib-lib-variables-dealloc-function-dealloc-state-variable-src-mq3-botlib-lib-variables-ml-806165723"></a>
### deAlloc

```ml
function deAlloc(state, variable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `variable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L50)

<a id="function-function-mq3-botlib-lib-variables-deallocall-function-deallocall-state-src-mq3-botlib-lib-variables-ml-1993312387"></a>
### deAllocAll

```ml
function deAllocAll(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L55)

<a id="function-function-mq3-botlib-lib-variables-get-function-get-state-name-src-mq3-botlib-lib-variables-ml-384705282"></a>
### get

```ml
function get(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L34)

<a id="function-function-mq3-botlib-lib-variables-getstring-function-getstring-state-name-src-mq3-botlib-lib-variables-ml-450342252"></a>
### getString

```ml
function getString(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L35)

<a id="function-function-mq3-botlib-lib-variables-getvalue-function-getvalue-state-name-src-mq3-botlib-lib-variables-ml-1746523466"></a>
### getValue

```ml
function getValue(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L36)

<a id="function-function-mq3-botlib-lib-variables-indexof-function-indexof-state-name-src-mq3-botlib-lib-variables-ml-2056149184"></a>
### indexOf

```ml
function indexOf(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L28)

<a id="function-function-mq3-botlib-lib-variables-set-function-set-state-name-text-src-mq3-botlib-lib-variables-ml-699321651"></a>
### set

```ml
function set(state, name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L39)

<a id="function-function-mq3-botlib-lib-variables-setnotmodified-function-setnotmodified-state-name-src-mq3-botlib-lib-variables-ml-1394669058"></a>
### setNotModified

```ml
function setNotModified(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L48)

<a id="function-function-mq3-botlib-lib-variables-stringvalue-function-stringvalue-text-src-mq3-botlib-lib-variables-ml-1255129415"></a>
### stringValue

```ml
function stringValue(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L9)

<a id="function-function-mq3-botlib-lib-variables-variable-function-variable-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-708917940"></a>
### variable

```ml
function variable(state, name, defaultValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L44)

- [mq3.botlib.lib_variables.Variable](Type-mq3-botlib-lib-variables-variable-28576369.md) — struct
<a id="function-function-mq3-botlib-lib-variables-variablestring-function-variablestring-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-1138149464"></a>
### variableString

```ml
function variableString(state, name, defaultValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L45)

<a id="function-function-mq3-botlib-lib-variables-variablevalue-function-variablevalue-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-1468100834"></a>
### variableValue

```ml
function variableValue(state, name, defaultValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L46)
