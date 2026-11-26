# `mq3.client.ui_team.TeamMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-team-ml-1416565839.md)

<a id="struct-struct-mq3-client-ui-team-teammenu-struct-teammenu-src-mq3-client-ui-team-ml-512703435"></a>
## TeamMenu

```ml
struct TeamMenu
```

Stores UI team team menu record, including `wrapAround`, `fullscreen`, `items`, `assets`, `commands`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L40)

## Members

<a id="field-field-mq3-client-ui-team-teammenu-actions-actions-src-mq3-client-ui-team-ml-86669095"></a>
### actions

```ml
actions
```

Host requests queued while selecting a team or spectator status, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L53)

<a id="field-field-mq3-client-ui-team-teammenu-assets-assets-src-mq3-client-ui-team-ml-596767929"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the team-selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L49)

<a id="field-field-mq3-client-ui-team-teammenu-commands-commands-src-mq3-client-ui-team-ml-2007912183"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L51)

<a id="field-field-mq3-client-ui-team-teammenu-fullscreen-fullscreen-src-mq3-client-ui-team-ml-42743913"></a>
### fullscreen

```ml
fullscreen
```

Whether the team-selection menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L45)

<a id="field-field-mq3-client-ui-team-teammenu-items-items-src-mq3-client-ui-team-ml-1162156135"></a>
### items

```ml
items
```

When constructing this record, `init` supplies `items` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L47)

<a id="field-field-mq3-client-ui-team-teammenu-wraparound-wraparound-src-mq3-client-ui-team-ml-1554018897"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the team-selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_team.ml#L42)
