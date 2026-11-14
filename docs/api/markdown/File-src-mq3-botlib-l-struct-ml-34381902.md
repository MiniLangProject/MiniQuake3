# `src/mq3/botlib/l_struct.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.l_struct`](Package-mq3-botlib-l-struct-270615456.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)

## Declarations

<a id="function-function-mq3-botlib-l-struct-checktoken-function-checktoken-reader-text-src-mq3-botlib-l-struct-ml-645462632"></a>
### checkToken

```ml
function checkToken(reader, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L48)

<a id="function-function-mq3-botlib-l-struct-createfieldvalue-function-createfieldvalue-fd-src-mq3-botlib-l-struct-ml-1202716166"></a>
### createFieldValue

```ml
function createFieldValue(fd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L67)

<a id="function-function-mq3-botlib-l-struct-createstructure-function-createstructure-def-src-mq3-botlib-l-struct-ml-434725629"></a>
### createStructure

```ml
function createStructure(def)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L72)

<a id="function-function-mq3-botlib-l-struct-definition-function-definition-size-fields-src-mq3-botlib-l-struct-ml-947929636"></a>
### definition

```ml
function definition(size, fields)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `fields` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L34)

<a id="function-function-mq3-botlib-l-struct-expecttoken-function-expecttoken-reader-text-src-mq3-botlib-l-struct-ml-1781927832"></a>
### expectToken

```ml
function expectToken(reader, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L44)

<a id="function-function-mq3-botlib-l-struct-fail-function-fail-reader-message-src-mq3-botlib-l-struct-ml-1185243382"></a>
### fail

```ml
function fail(reader, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L29)

<a id="function-function-mq3-botlib-l-struct-field-function-field-name-offset-type-maxarray-floatmin-floatmax-substruct-src-mq3-botlib-l-struct-ml-1759792528"></a>
### field

```ml
function field(name, offset, type, maxarray, floatmin, floatmax, substruct)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `maxarray` | `dynamic` | — |  |
| `floatmin` | `dynamic` | — |  |
| `floatmax` | `dynamic` | — |  |
| `substruct` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L33)

- [mq3.botlib.l_struct.FieldDef](Type-mq3-botlib-l-struct-fielddef-151438485.md) — struct
<a id="function-function-mq3-botlib-l-struct-fieldvalue-function-fieldvalue-structure-name-src-mq3-botlib-l-struct-ml-955122074"></a>
### fieldValue

```ml
function fieldValue(structure, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L82)

- [mq3.botlib.l_struct.FieldValue](Type-mq3-botlib-l-struct-fieldvalue-1462248639.md) — struct
<a id="function-function-mq3-botlib-l-struct-findfield-function-findfield-defs-name-src-mq3-botlib-l-struct-ml-1848212829"></a>
### FindField

```ml
function FindField(defs, name)
```

FindField

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `defs` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L54)

<a id="constant-constant-mq3-botlib-l-struct-ft-array-const-ft-array-256-src-mq3-botlib-l-struct-ml-1702881112"></a>
### FT_ARRAY

```ml
const FT_ARRAY = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L17)

<a id="constant-constant-mq3-botlib-l-struct-ft-bounded-const-ft-bounded-512-src-mq3-botlib-l-struct-ml-734449879"></a>
### FT_BOUNDED

```ml
const FT_BOUNDED = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L18)

<a id="constant-constant-mq3-botlib-l-struct-ft-char-const-ft-char-1-src-mq3-botlib-l-struct-ml-2087336708"></a>
### FT_CHAR

```ml
const FT_CHAR = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L11)

<a id="constant-constant-mq3-botlib-l-struct-ft-float-const-ft-float-3-src-mq3-botlib-l-struct-ml-935474442"></a>
### FT_FLOAT

```ml
const FT_FLOAT = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L13)

<a id="constant-constant-mq3-botlib-l-struct-ft-int-const-ft-int-2-src-mq3-botlib-l-struct-ml-747281565"></a>
### FT_INT

```ml
const FT_INT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L12)

<a id="constant-constant-mq3-botlib-l-struct-ft-string-const-ft-string-4-src-mq3-botlib-l-struct-ml-1809894005"></a>
### FT_STRING

```ml
const FT_STRING = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L14)

<a id="constant-constant-mq3-botlib-l-struct-ft-struct-const-ft-struct-6-src-mq3-botlib-l-struct-ml-1218513243"></a>
### FT_STRUCT

```ml
const FT_STRUCT = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L15)

<a id="constant-constant-mq3-botlib-l-struct-ft-type-const-ft-type-255-src-mq3-botlib-l-struct-ml-200610049"></a>
### FT_TYPE

```ml
const FT_TYPE = 255
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L16)

<a id="constant-constant-mq3-botlib-l-struct-ft-unsigned-const-ft-unsigned-1024-src-mq3-botlib-l-struct-ml-1724301764"></a>
### FT_UNSIGNED

```ml
const FT_UNSIGNED = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L19)

<a id="constant-constant-mq3-botlib-l-struct-max-stringfield-const-max-stringfield-80-src-mq3-botlib-l-struct-ml-293614893"></a>
### MAX_STRINGFIELD

```ml
const MAX_STRINGFIELD = 80
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L10)

<a id="function-function-mq3-botlib-l-struct-nexttoken-function-nexttoken-reader-src-mq3-botlib-l-struct-ml-1491004371"></a>
### nextToken

```ml
function nextToken(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L37)

<a id="function-function-mq3-botlib-l-struct-precompilerreader-function-precompilerreader-registry-sourcehandle-src-mq3-botlib-l-struct-ml-1489896626"></a>
### precompilerReader

```ml
function precompilerReader(registry, sourceHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `sourceHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L36)

<a id="function-function-mq3-botlib-l-struct-readchar-function-readchar-reader-fd-src-mq3-botlib-l-struct-ml-1398643533"></a>
### ReadChar

```ml
function ReadChar(reader, fd)
```

ReadChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L126)

- [mq3.botlib.l_struct.Reader](Type-mq3-botlib-l-struct-reader-2083030309.md) — struct
<a id="function-function-mq3-botlib-l-struct-readfieldscalar-function-readfieldscalar-reader-fd-src-mq3-botlib-l-struct-ml-2088786361"></a>
### readFieldScalar

```ml
function readFieldScalar(reader, fd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L139)

<a id="function-function-mq3-botlib-l-struct-readnumber-function-readnumber-reader-fd-src-mq3-botlib-l-struct-ml-25598385"></a>
### ReadNumber

```ml
function ReadNumber(reader, fd)
```

ReadNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L91)

<a id="function-function-mq3-botlib-l-struct-readstring-function-readstring-reader-fd-src-mq3-botlib-l-struct-ml-2043881213"></a>
### ReadString

```ml
function ReadString(reader, fd)
```

ReadString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L133)

<a id="function-function-mq3-botlib-l-struct-readstructure-function-readstructure-reader-def-structure-src-mq3-botlib-l-struct-ml-523461265"></a>
### ReadStructure

```ml
function ReadStructure(reader, def, structure)
```

ReadStructure

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `def` | `dynamic` | — |  |
| `structure` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L152)

<a id="function-function-mq3-botlib-l-struct-scalardefault-function-scalardefault-fd-src-mq3-botlib-l-struct-ml-2110461164"></a>
### scalarDefault

```ml
function scalarDefault(fd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L60)

<a id="function-function-mq3-botlib-l-struct-setvalue-function-setvalue-structure-name-index-newvalue-src-mq3-botlib-l-struct-ml-1135058905"></a>
### setValue

```ml
function setValue(structure, name, index, newValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `newValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L86)

<a id="function-function-mq3-botlib-l-struct-sourcereader-function-sourcereader-name-text-src-mq3-botlib-l-struct-ml-410516416"></a>
### sourceReader

```ml
function sourceReader(name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L35)

- [mq3.botlib.l_struct.StructDef](Type-mq3-botlib-l-struct-structdef-1373631726.md) — struct
- [mq3.botlib.l_struct.Structure](Type-mq3-botlib-l-struct-structure-115795747.md) — struct
<a id="function-function-mq3-botlib-l-struct-unreadtoken-function-unreadtoken-reader-token-src-mq3-botlib-l-struct-ml-1204978864"></a>
### unreadToken

```ml
function unreadToken(reader, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L43)

<a id="function-function-mq3-botlib-l-struct-value-function-value-structure-name-index-src-mq3-botlib-l-struct-ml-1722796776"></a>
### value

```ml
function value(structure, name, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L83)

<a id="function-function-mq3-botlib-l-struct-valueindex-function-valueindex-structure-name-src-mq3-botlib-l-struct-ml-575371742"></a>
### valueIndex

```ml
function valueIndex(structure, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L77)

<a id="function-function-mq3-botlib-l-struct-writefloat-function-writefloat-value-src-mq3-botlib-l-struct-ml-1286741897"></a>
### WriteFloat

```ml
function WriteFloat(value)
```

WriteFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L179)

<a id="function-function-mq3-botlib-l-struct-writeindent-function-writeindent-indent-src-mq3-botlib-l-struct-ml-1763454900"></a>
### WriteIndent

```ml
function WriteIndent(indent)
```

WriteIndent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L174)

<a id="function-function-mq3-botlib-l-struct-writescalar-function-writescalar-fd-stored-index-indent-src-mq3-botlib-l-struct-ml-1668901019"></a>
### writeScalar

```ml
function writeScalar(fd, stored, index, indent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — |  |
| `stored` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `indent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L185)

<a id="function-function-mq3-botlib-l-struct-writestructure-function-writestructure-def-structure-src-mq3-botlib-l-struct-ml-554338508"></a>
### WriteStructure

```ml
function WriteStructure(def, structure)
```

WriteStructure

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — |  |
| `structure` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L210)

<a id="function-function-mq3-botlib-l-struct-writestructwithindent-function-writestructwithindent-def-structure-indent-src-mq3-botlib-l-struct-ml-1409297546"></a>
### WriteStructWithIndent

```ml
function WriteStructWithIndent(def, structure, indent)
```

WriteStructWithIndent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — |  |
| `structure` | `dynamic` | — |  |
| `indent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L196)
