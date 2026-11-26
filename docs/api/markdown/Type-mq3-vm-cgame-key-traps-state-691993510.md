# `mq3.vm.cgame_key_traps.State`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)

<a id="struct-struct-mq3-vm-cgame-key-traps-state-struct-state-src-mq3-vm-cgame-key-traps-ml-1536315339"></a>
## State

```ml
struct State
```

State record for vm.cgame_key_traps, containing `down`, `bindings`, `catcher`, `overstrike`, `bindingSerial`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L33)

## Members

<a id="field-field-mq3-vm-cgame-key-traps-state-bindings-bindings-src-mq3-vm-cgame-key-traps-ml-953063154"></a>
### bindings

```ml
bindings
```

Command strings associated with keyboard keys.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L37)

<a id="field-field-mq3-vm-cgame-key-traps-state-bindingserial-bindingserial-src-mq3-vm-cgame-key-traps-ml-823392158"></a>
### bindingSerial

```ml
bindingSerial
```

Revision counter incremented when keyboard bindings change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L43)

<a id="field-field-mq3-vm-cgame-key-traps-state-catcher-catcher-src-mq3-vm-cgame-key-traps-ml-1075746702"></a>
### catcher

```ml
catcher
```

Key-catcher mask selecting the component that receives input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L39)

<a id="field-field-mq3-vm-cgame-key-traps-state-down-down-src-mq3-vm-cgame-key-traps-ml-1066720034"></a>
### down

```ml
down
```

Per-key pressed/released states.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L35)

<a id="field-field-mq3-vm-cgame-key-traps-state-overstrike-overstrike-src-mq3-vm-cgame-key-traps-ml-2063438646"></a>
### overstrike

```ml
overstrike
```

Nonzero when text editing overwrites existing characters instead of inserting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L41)
