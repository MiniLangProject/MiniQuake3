# `src/mq3/client/key_binding_dispatch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.key_binding_dispatch`](Package-mq3-client-key-binding-dispatch-275330337.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `bindingStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.key_binding_dispatch.Command](Type-mq3-client-key-binding-dispatch-command-2053604602.md) — struct
<a id="function-function-mq3-client-key-binding-dispatch-commands-function-commands-binding-key-down-time-src-mq3-client-key-binding-dispatch-ml-1529206747"></a>
### commands

```ml
function commands(binding, key, down, time)
```

Calls `mq3.client.key_binding_dispatch.emit`, `mq3.client.key_binding_dispatch.segments` from key binding dispatch `commands`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — | Command text associated with an input key. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding key binding dispatch entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `time` | `dynamic` | — | Value used by `if key<0 or key>=256 or typeof(time)!="int" or time<0 then return error(7732,"key binding dispatch: invalid event") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L43)

<a id="function-function-mq3-client-key-binding-dispatch-emit-function-emit-segment-key-time-down-src-mq3-client-key-binding-dispatch-ml-1243351783"></a>
### emit

```ml
function emit(segment, key, time, down)
```

Calls `std.string.trim`, `decode`, `slice` and additional helpers from key binding dispatch `emit`. The final path returns `Command(segment+"\n",segment,false,down,key,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `segment` | `dynamic` | — | Sequence read at `segment[0]`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding key binding dispatch entry. |
| `time` | `dynamic` | — | Value used by `return Command(prefix+action+" "+str(key)+" "+str(time)+"\\n",action,true,down,key,time)`. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L16)

<a id="function-function-mq3-client-key-binding-dispatch-segments-function-segments-binding-src-mq3-client-key-binding-dispatch-ml-1121134409"></a>
### segments

```ml
function segments(binding)
```

Calls `decode` from key binding dispatch `segments`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — | Command text associated with an input key. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/key_binding_dispatch.ml#L26)
