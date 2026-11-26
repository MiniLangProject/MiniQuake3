# `mq3.vm.cgame_misc_traps.RealTimeValue`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-misc-traps-ml-419606242.md)

<a id="struct-struct-mq3-vm-cgame-misc-traps-realtimevalue-struct-realtimevalue-src-mq3-vm-cgame-misc-traps-ml-1285128731"></a>
## RealTimeValue

```ml
struct RealTimeValue
```

RealTimeValue record for vm.cgame_misc_traps, containing `epoch`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_misc_traps.ml#L16)

## Members

<a id="field-field-mq3-vm-cgame-misc-traps-realtimevalue-data-data-src-mq3-vm-cgame-misc-traps-ml-2141118471"></a>
### data

```ml
data
```

Packed qtime ABI fields accompanying the epoch return value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_misc_traps.ml#L20)

<a id="field-field-mq3-vm-cgame-misc-traps-realtimevalue-epoch-epoch-src-mq3-vm-cgame-misc-traps-ml-986672303"></a>
### epoch

```ml
epoch
```

Calendar time represented as the epoch value returned by the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_misc_traps.ml#L18)
