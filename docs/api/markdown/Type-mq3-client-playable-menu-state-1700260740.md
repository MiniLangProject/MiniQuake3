# `mq3.client.playable_menu.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-menu-ml-1211516485.md)

<a id="struct-struct-mq3-client-playable-menu-state-struct-state-src-mq3-client-playable-menu-ml-965288019"></a>
## State

```ml
struct State
```

Stores playable menu state, including `selected`, `lastUp`, `lastDown`, `lastEnter`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L56)

## Members

<a id="field-field-mq3-client-playable-menu-state-lastdown-lastdown-src-mq3-client-playable-menu-ml-1008285842"></a>
### lastDown

```ml
lastDown
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L62)

<a id="field-field-mq3-client-playable-menu-state-lastenter-lastenter-src-mq3-client-playable-menu-ml-1567032974"></a>
### lastEnter

```ml
lastEnter
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L64)

<a id="field-field-mq3-client-playable-menu-state-lastup-lastup-src-mq3-client-playable-menu-ml-48494248"></a>
### lastUp

```ml
lastUp
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L60)

<a id="field-field-mq3-client-playable-menu-state-selected-selected-src-mq3-client-playable-menu-ml-1845973180"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_menu.ml#L58)
