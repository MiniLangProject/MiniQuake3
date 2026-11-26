# `mq3.client.snapshot_command.State`

[Home](README.md) · [Source file](File-src-mq3-client-snapshot-command-ml-285373799.md)

<a id="struct-struct-mq3-client-snapshot-command-state-struct-state-src-mq3-client-snapshot-command-ml-386559231"></a>
## State

```ml
struct State
```

Stores snapshot command state, including `entityState`, `snapshots`, `snap`, `outPackets`, `serverMessageSequence`, `serverCommandSequence` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L57)

## Members

<a id="field-field-mq3-client-snapshot-command-state-demowaiting-demowaiting-src-mq3-client-snapshot-command-ml-1367660238"></a>
### demoWaiting

```ml
demoWaiting
```

When constructing this record, `create` supplies `true` for this member. Used by `parseSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L78)

<a id="field-field-mq3-client-snapshot-command-state-entitystate-entitystate-src-mq3-client-snapshot-command-ml-1731231526"></a>
### entityState

```ml
entityState
```

When constructing this record, `create` supplies `snapshotEntities.createState()` for this member. Used by `oldFrameFor` and `parseSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L60)

<a id="field-field-mq3-client-snapshot-command-state-newsnapshots-newsnapshots-src-mq3-client-snapshot-command-ml-950878124"></a>
### newSnapshots

```ml
newSnapshots
```

True after parsing a new valid snapshot that has not yet been consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L80)

<a id="field-field-mq3-client-snapshot-command-state-outgoingsequence-outgoingsequence-src-mq3-client-snapshot-command-ml-1434729704"></a>
### outgoingSequence

```ml
outgoingSequence
```

When constructing this record, `create` supplies `0` for this member. Used by `calculatePing` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L73)

<a id="field-field-mq3-client-snapshot-command-state-outpackets-outpackets-src-mq3-client-snapshot-command-ml-686142572"></a>
### outPackets

```ml
outPackets
```

History of outgoing packet metadata used to estimate acknowledgement timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L66)

<a id="field-field-mq3-client-snapshot-command-state-realtime-realtime-src-mq3-client-snapshot-command-ml-563743528"></a>
### realtime

```ml
realtime
```

Current local client clock in milliseconds used to calculate received-snapshot latency.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L75)

<a id="field-field-mq3-client-snapshot-command-state-servercommandsequence-servercommandsequence-src-mq3-client-snapshot-command-ml-1432259582"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Latest received reliable server-command sequence copied into newly decoded snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L70)

<a id="field-field-mq3-client-snapshot-command-state-servermessagesequence-servermessagesequence-src-mq3-client-snapshot-command-ml-2110798986"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L68)

<a id="field-field-mq3-client-snapshot-command-state-shownetlevel-shownetlevel-src-mq3-client-snapshot-command-ml-1730931390"></a>
### shownetLevel

```ml
shownetLevel
```

When constructing this record, `create` supplies `0` for this member. Used by `shownet` and `parseSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L83)

<a id="field-field-mq3-client-snapshot-command-state-shownetlines-shownetlines-src-mq3-client-snapshot-command-ml-1553925600"></a>
### shownetLines

```ml
shownetLines
```

When constructing this record, `create` supplies an empty list for this member. Used by `shownet` and `parseSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L86)

<a id="field-field-mq3-client-snapshot-command-state-snap-snap-src-mq3-client-snapshot-command-ml-1639132058"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L64)

<a id="field-field-mq3-client-snapshot-command-state-snapshots-snapshots-src-mq3-client-snapshot-command-ml-1373067014"></a>
### snapshots

```ml
snapshots
```

Snapshot history indexed by sequence number for interpolation and delta decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L62)
