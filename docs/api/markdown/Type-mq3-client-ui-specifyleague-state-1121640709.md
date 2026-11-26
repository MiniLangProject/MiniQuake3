# `mq3.client.ui_specifyleague.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-specifyleague-ml-1420873104.md)

<a id="struct-struct-mq3-client-ui-specifyleague-state-struct-state-src-mq3-client-ui-specifyleague-ml-969516957"></a>
## State

```ml
struct State
```

Stores UI specifyleague state, including `menu`, `banner`, `framel`, `framer`, `rankname`, `list` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L45)

## Members

<a id="field-field-mq3-client-ui-specifyleague-state-actions-actions-src-mq3-client-ui-specifyleague-ml-309828954"></a>
### actions

```ml
actions
```

Host requests queued while accepting a league identifier for ranked play, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L90)

<a id="field-field-mq3-client-ui-specifyleague-state-arrows-arrows-src-mq3-client-ui-specifyleague-ml-470145070"></a>
### arrows

```ml
arrows
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L66)

<a id="field-field-mq3-client-ui-specifyleague-state-back-back-src-mq3-client-ui-specifyleague-ml-458883760"></a>
### back

```ml
back
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L75)

<a id="field-field-mq3-client-ui-specifyleague-state-banner-banner-src-mq3-client-ui-specifyleague-ml-1994312114"></a>
### banner

```ml
banner
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L51)

<a id="field-field-mq3-client-ui-specifyleague-state-displaynames-displaynames-src-mq3-client-ui-specifyleague-ml-1838007062"></a>
### displayNames

```ml
displayNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `SpecifyLeague_GetList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L87)

<a id="field-field-mq3-client-ui-specifyleague-state-down-down-src-mq3-client-ui-specifyleague-ml-210561406"></a>
### down

```ml
down
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L72)

<a id="field-field-mq3-client-ui-specifyleague-state-framel-framel-src-mq3-client-ui-specifyleague-ml-803597236"></a>
### framel

```ml
framel
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L54)

<a id="field-field-mq3-client-ui-specifyleague-state-framer-framer-src-mq3-client-ui-specifyleague-ml-1036644512"></a>
### framer

```ml
framer
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L57)

<a id="field-field-mq3-client-ui-specifyleague-state-grlogo-grlogo-src-mq3-client-ui-specifyleague-ml-1437435862"></a>
### grlogo

```ml
grlogo
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L78)

<a id="field-field-mq3-client-ui-specifyleague-state-leaguenames-leaguenames-src-mq3-client-ui-specifyleague-ml-1066808806"></a>
### leagueNames

```ml
leagueNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L84)

<a id="field-field-mq3-client-ui-specifyleague-state-list-list-src-mq3-client-ui-specifyleague-ml-303973934"></a>
### list

```ml
list
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L63)

<a id="field-field-mq3-client-ui-specifyleague-state-menu-menu-src-mq3-client-ui-specifyleague-ml-447305220"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `q.menu(true,true)` for this member. Used by `SpecifyLeague_Event` and `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L48)

<a id="field-field-mq3-client-ui-specifyleague-state-playername-playername-src-mq3-client-ui-specifyleague-ml-752624490"></a>
### playername

```ml
playername
```

When constructing this record, `create` supplies an empty string for this member. Used by `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L81)

<a id="field-field-mq3-client-ui-specifyleague-state-popped-popped-src-mq3-client-ui-specifyleague-ml-1121745918"></a>
### popped

```ml
popped
```

Records a request to remove the ranked-play league dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L94)

<a id="field-field-mq3-client-ui-specifyleague-state-pushed-pushed-src-mq3-client-ui-specifyleague-ml-816222832"></a>
### pushed

```ml
pushed
```

Records that the ranked-play league dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L92)

<a id="field-field-mq3-client-ui-specifyleague-state-rankname-rankname-src-mq3-client-ui-specifyleague-ml-149809004"></a>
### rankname

```ml
rankname
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L60)

<a id="field-field-mq3-client-ui-specifyleague-state-retailactive-retailactive-src-mq3-client-ui-specifyleague-ml-1018726980"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the ranked-play league dialog, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L99)

<a id="field-field-mq3-client-ui-specifyleague-state-selected-selected-src-mq3-client-ui-specifyleague-ml-373604336"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L96)

<a id="field-field-mq3-client-ui-specifyleague-state-up-up-src-mq3-client-ui-specifyleague-ml-247987048"></a>
### up

```ml
up
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `SpecifyLeague_MenuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specifyleague.ml#L69)
