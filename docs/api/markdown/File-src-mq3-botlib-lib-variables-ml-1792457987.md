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

Set `state.variables` to `[variable]+state.variables` in `mq3.botlib.lib_variables.alloc`. Return paths include `variable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. May update `state.variables` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L65)

<a id="function-function-mq3-botlib-lib-variables-changed-function-changed-state-name-src-mq3-botlib-lib-variables-ml-439557298"></a>
### changed

```ml
function changed(state, name)
```

Apply `mq3.botlib.lib_variables.get` while evaluating `changed`. Return paths include `current!=void and current.modified`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L93)

<a id="function-function-mq3-botlib-lib-variables-dealloc-function-dealloc-state-variable-src-mq3-botlib-lib-variables-ml-806165723"></a>
### deAlloc

```ml
function deAlloc(state, variable)
```

Set `state.variables` to `kept` in `mq3.botlib.lib_variables.deAlloc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. May update `state.variables` in place. |
| `variable` | `dynamic` | — | Variable record; accesses `name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L102)

<a id="function-function-mq3-botlib-lib-variables-deallocall-function-deallocall-state-src-mq3-botlib-lib-variables-ml-1993312387"></a>
### deAllocAll

```ml
function deAllocAll(state)
```

Set `state.variables` to `[]` in `mq3.botlib.lib_variables.deAllocAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. May update `state.variables` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L109)

<a id="function-function-mq3-botlib-lib-variables-get-function-get-state-name-src-mq3-botlib-lib-variables-ml-384705282"></a>
### get

```ml
function get(state, name)
```

Apply `mq3.botlib.lib_variables.indexOf` while evaluating `get`. Return paths include `state.variables[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L52)

<a id="function-function-mq3-botlib-lib-variables-getstring-function-getstring-state-name-src-mq3-botlib-lib-variables-ml-450342252"></a>
### getString

```ml
function getString(state, name)
```

Apply `mq3.botlib.lib_variables.get` while evaluating `getString`. Return paths include `variable.value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L56)

<a id="function-function-mq3-botlib-lib-variables-getvalue-function-getvalue-state-name-src-mq3-botlib-lib-variables-ml-1746523466"></a>
### getValue

```ml
function getValue(state, name)
```

Apply `mq3.botlib.lib_variables.get` while evaluating `getValue`. Return paths include `variable.numericValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L60)

<a id="function-function-mq3-botlib-lib-variables-indexof-function-indexof-state-name-src-mq3-botlib-lib-variables-ml-2056149184"></a>
### indexOf

```ml
function indexOf(state, name)
```

Find a library variable by an ASCII case-insensitive name, returning -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L43)

<a id="function-function-mq3-botlib-lib-variables-set-function-set-state-name-text-src-mq3-botlib-lib-variables-ml-699321651"></a>
### set

```ml
function set(state, name, text)
```

Apply `mq3.botlib.lib_variables.get`, `mq3.botlib.lib_variables.alloc` and `mq3.botlib.lib_variables.stringValue` while evaluating `set`. Return paths include `variable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L70)

<a id="function-function-mq3-botlib-lib-variables-setnotmodified-function-setnotmodified-state-name-src-mq3-botlib-lib-variables-ml-1394669058"></a>
### setNotModified

```ml
function setNotModified(state, name)
```

Apply `mq3.botlib.lib_variables.get` while evaluating `setNotModified`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L97)

<a id="function-function-mq3-botlib-lib-variables-stringvalue-function-stringvalue-text-src-mq3-botlib-lib-variables-ml-1255129415"></a>
### stringValue

```ml
function stringValue(text)
```

Parse the released botlib unsigned decimal-number syntax, returning zero for invalid text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L21)

<a id="function-function-mq3-botlib-lib-variables-variable-function-variable-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-708917940"></a>
### variable

```ml
function variable(state, name, defaultValue)
```

Apply `mq3.botlib.lib_variables.get` and `mq3.botlib.lib_variables.set` while evaluating `variable`. Return paths include `set(state,name,defaultValue)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `defaultValue` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L79)

- [mq3.botlib.lib_variables.Variable](Type-mq3-botlib-lib-variables-variable-28576369.md) — struct
<a id="function-function-mq3-botlib-lib-variables-variablestring-function-variablestring-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-1138149464"></a>
### variableString

```ml
function variableString(state, name, defaultValue)
```

Return `variable(state,name,defaultValue).value` for `variableString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `defaultValue` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L84)

<a id="function-function-mq3-botlib-lib-variables-variablevalue-function-variablevalue-state-name-defaultvalue-src-mq3-botlib-lib-variables-ml-1468100834"></a>
### variableValue

```ml
function variableValue(state, name, defaultValue)
```

Return `variable(state,name,defaultValue).numericValue` for `variableValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `defaultValue` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lib_variables.ml#L89)
