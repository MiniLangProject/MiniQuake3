# `mq3.client.cgame_event.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-event-ml-1436945917.md)

<a id="struct-struct-mq3-client-cgame-event-action-struct-action-src-mq3-client-cgame-event-ml-1722559223"></a>
## Action

```ml
struct Action
```

Stores client game event queued engine action, including `boundary`, `kind`, `entity`, `channel`, `parm`, `origin` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L35)

## Members

<a id="field-field-mq3-client-cgame-event-action-boundary-boundary-src-mq3-client-cgame-event-ml-744681415"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while decoding entity events into audio, rendering, HUD, and state changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L38)

<a id="field-field-mq3-client-cgame-event-action-channel-channel-src-mq3-client-cgame-event-ml-487121827"></a>
### channel

```ml
channel
```

When constructing this record, `action` supplies `channel` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L45)

<a id="field-field-mq3-client-cgame-event-action-dispatched-dispatched-src-mq3-client-cgame-event-ml-1805181937"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while decoding entity events into audio, rendering, HUD, and state changes; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L61)

<a id="field-field-mq3-client-cgame-event-action-entity-entity-src-mq3-client-cgame-event-ml-1746320185"></a>
### entity

```ml
entity
```

When constructing this record, `action` supplies `entity` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L43)

<a id="field-field-mq3-client-cgame-event-action-kind-kind-src-mq3-client-cgame-event-ml-901197807"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while decoding entity events into audio, rendering, HUD, and state changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L41)

<a id="field-field-mq3-client-cgame-event-action-origin-origin-src-mq3-client-cgame-event-ml-2038795831"></a>
### origin

```ml
origin
```

World-space event position supplied to the selected sound, effect, or feedback operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L49)

<a id="field-field-mq3-client-cgame-event-action-origin2-origin2-src-mq3-client-cgame-event-ml-1972005231"></a>
### origin2

```ml
origin2
```

When constructing this record, `action` supplies `origin2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L51)

<a id="field-field-mq3-client-cgame-event-action-other-other-src-mq3-client-cgame-event-ml-7644931"></a>
### other

```ml
other
```

When constructing this record, `action` supplies `other` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L55)

<a id="field-field-mq3-client-cgame-event-action-parm-parm-src-mq3-client-cgame-event-ml-1708003395"></a>
### parm

```ml
parm
```

When constructing this record, `action` supplies `parm` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L47)

<a id="field-field-mq3-client-cgame-event-action-text-text-src-mq3-client-cgame-event-ml-1548196857"></a>
### text

```ml
text
```

Optional event text, populated with the event name for voice-chat HUD actions and empty for ordinary sound or rendering actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L58)

<a id="field-field-mq3-client-cgame-event-action-weapon-weapon-src-mq3-client-cgame-event-ml-850449891"></a>
### weapon

```ml
weapon
```

Native weapon identifier copied from the triggering entity into a weapon-effect event request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L53)
