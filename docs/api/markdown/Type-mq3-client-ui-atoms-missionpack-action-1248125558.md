# `mq3.client.ui_atoms_missionpack.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-atoms-missionpack-ml-2145955256.md)

<a id="struct-struct-mq3-client-ui-atoms-missionpack-action-struct-action-src-mq3-client-ui-atoms-missionpack-ml-1368043573"></a>
## Action

```ml
struct Action
```

Stores UI atoms missionpack queued engine action, including `kind`, `arguments`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L68)

## Members

<a id="field-field-mq3-client-ui-atoms-missionpack-action-arguments-arguments-src-mq3-client-ui-atoms-missionpack-ml-1503645703"></a>
### arguments

```ml
arguments
```

When constructing this record, `internal` supplies `arguments` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L73)

<a id="field-field-mq3-client-ui-atoms-missionpack-action-dispatched-dispatched-src-mq3-client-ui-atoms-missionpack-ml-825758677"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while updating postgame cvars, cached score files, and Missionpack UI state; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L76)

<a id="field-field-mq3-client-ui-atoms-missionpack-action-kind-kind-src-mq3-client-ui-atoms-missionpack-ml-789308703"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while updating postgame cvars, cached score files, and Missionpack UI state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L71)
