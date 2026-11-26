# `src/mq3/renderer/tr_public.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_public`](Package-mq3-renderer-tr-public-1664155533.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-tr-public-compatible-function-compatible-apiversion-src-mq3-renderer-tr-public-ml-480339926"></a>
### compatible

```ml
function compatible(apiVersion)
```

Computes `apiVersion==REF_API_VERSION` for `mq3.renderer.tr_public.compatible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `apiVersion` | `dynamic` | — | Input used in the result expression `apiVersion==REF_API_VERSION`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L138)

<a id="function-function-mq3-renderer-tr-public-declaredexportnames-function-declaredexportnames-src-mq3-renderer-tr-public-ml-703196322"></a>
### declaredExportNames

```ml
function declaredExportNames()
```

Lists the 30 declared names for `mq3.renderer.tr_public.declaredExportNames`, including `Shutdown`, `BeginRegistration`, `RegisterModel`, `RegisterSkin`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L131)

<a id="function-function-mq3-renderer-tr-public-entrypointname-function-entrypointname-src-mq3-renderer-tr-public-ml-255035574"></a>
### entrypointName

```ml
function entrypointName()
```

Computes `"GetRefAPI"` for `mq3.renderer.tr_public.entrypointName`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L140)

<a id="function-function-mq3-renderer-tr-public-exportnames-function-exportnames-src-mq3-renderer-tr-public-ml-1915362954"></a>
### exportNames

```ml
function exportNames()
```

Returns `result` from `mq3.renderer.tr_public.exportNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L133)

<a id="function-function-mq3-renderer-tr-public-importnames-function-importnames-src-mq3-renderer-tr-public-ml-1252804412"></a>
### importNames

```ml
function importNames()
```

Lists the 27 declared names for `mq3.renderer.tr_public.importNames`, including `Printf`, `Error`, `Milliseconds`, `Hunk_AllocDebug`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L135)

<a id="constant-constant-mq3-renderer-tr-public-ref-api-version-const-ref-api-version-8-src-mq3-renderer-tr-public-ml-1515639899"></a>
### REF_API_VERSION

```ml
const REF_API_VERSION = 8
```

Renderer import/export ABI version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_public.ml#L7)

- [mq3.renderer.tr_public.RefExport](Type-mq3-renderer-tr-public-refexport-698037780.md) — struct
- [mq3.renderer.tr_public.RefImport](Type-mq3-renderer-tr-public-refimport-1746790723.md) — struct
