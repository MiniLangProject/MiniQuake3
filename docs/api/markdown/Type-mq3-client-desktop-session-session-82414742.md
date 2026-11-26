# `mq3.client.desktop_session.Session`

[Home](README.md) · [Source file](File-src-mq3-client-desktop-session-ml-419426432.md)

<a id="struct-struct-mq3-client-desktop-session-session-struct-session-src-mq3-client-desktop-session-ml-1697557481"></a>
## Session

```ml
struct Session
```

Stores desktop session session record, including `dataRoot`, `action`, `mapName`, `singlePlayer`, `settings`, `persistence` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L37)

## Members

<a id="field-field-mq3-client-desktop-session-session-action-action-src-mq3-client-desktop-session-ml-1431282553"></a>
### action

```ml
action
```

When constructing this record, `create` supplies an empty string for this member. Used by `capture` and `mapCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L42)

<a id="field-field-mq3-client-desktop-session-session-activegame-activegame-src-mq3-client-desktop-session-ml-1667061033"></a>
### activeGame

```ml
activeGame
```

When constructing this record, `create` supplies an empty string for this member. Used by `videoCommand` and `attach` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L68)

<a id="field-field-mq3-client-desktop-session-session-cinematicnext-cinematicnext-src-mq3-client-desktop-session-ml-1587212497"></a>
### cinematicNext

```ml
cinematicNext
```

When constructing this record, `create` supplies an empty string for this member. Used by `cinematicCommand` and `finishCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L83)

<a id="field-field-mq3-client-desktop-session-session-configloaded-configloaded-src-mq3-client-desktop-session-ml-1984381023"></a>
### configLoaded

```ml
configLoaded
```

When constructing this record, `create` supplies `false` for this member. Used by `attach` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L59)

<a id="field-field-mq3-client-desktop-session-session-dataroot-dataroot-src-mq3-client-desktop-session-ml-879807553"></a>
### dataRoot

```ml
dataRoot
```

When constructing this record, `create` supplies `dataRoot` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L39)

<a id="field-field-mq3-client-desktop-session-session-mapname-mapname-src-mq3-client-desktop-session-ml-485866153"></a>
### mapName

```ml
mapName
```

Selected map identifier retained by the desktop session configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L44)

<a id="field-field-mq3-client-desktop-session-session-notice-notice-src-mq3-client-desktop-session-ml-212820697"></a>
### notice

```ml
notice
```

When constructing this record, `create` supplies an empty string for this member. Used by `attach` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L77)

<a id="field-field-mq3-client-desktop-session-session-persistence-persistence-src-mq3-client-desktop-session-ml-540418049"></a>
### persistence

```ml
persistence
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `save` and `attach` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L53)

<a id="field-field-mq3-client-desktop-session-session-requestedgame-requestedgame-src-mq3-client-desktop-session-ml-47151441"></a>
### requestedGame

```ml
requestedGame
```

When constructing this record, `create` supplies an empty string for this member. Used by `restartFilesystem` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L71)

<a id="field-field-mq3-client-desktop-session-session-restartcommands-restartcommands-src-mq3-client-desktop-session-ml-705826589"></a>
### restartCommands

```ml
restartCommands
```

When constructing this record, `create` supplies an empty list for this member. Used by `capture` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L65)

<a id="field-field-mq3-client-desktop-session-session-savedbindings-savedbindings-src-mq3-client-desktop-session-ml-1204281857"></a>
### savedBindings

```ml
savedBindings
```

When constructing this record, `create` supplies `0` for this member. Used by `save` and `attach` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L56)

<a id="field-field-mq3-client-desktop-session-session-settings-settings-src-mq3-client-desktop-session-ml-1031145783"></a>
### settings

```ml
settings
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `capture` and `finishCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L50)

<a id="field-field-mq3-client-desktop-session-session-singleplayer-singleplayer-src-mq3-client-desktop-session-ml-115410415"></a>
### singlePlayer

```ml
singlePlayer
```

When constructing this record, `create` supplies `false` for this member. Used by `mapCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L47)

<a id="field-field-mq3-client-desktop-session-session-target-target-src-mq3-client-desktop-session-ml-674784995"></a>
### target

```ml
target
```

When constructing this record, `create` supplies an empty string for this member. Used by `cinematicCommand` and `streamCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L74)

<a id="field-field-mq3-client-desktop-session-session-transitioncommands-transitioncommands-src-mq3-client-desktop-session-ml-1418420571"></a>
### transitionCommands

```ml
transitionCommands
```

When constructing this record, `create` supplies an empty string for this member. Used by `capture` and `finishCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L80)

<a id="field-field-mq3-client-desktop-session-session-videoheight-videoheight-src-mq3-client-desktop-session-ml-980566629"></a>
### videoHeight

```ml
videoHeight
```

When constructing this record, `create` supplies `720` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L87)

<a id="field-field-mq3-client-desktop-session-session-videorestart-videorestart-src-mq3-client-desktop-session-ml-1895361097"></a>
### videoRestart

```ml
videoRestart
```

When constructing this record, `create` supplies `false` for this member. Used by `videoCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L62)

<a id="field-field-mq3-client-desktop-session-session-videowidth-videowidth-src-mq3-client-desktop-session-ml-1492745087"></a>
### videoWidth

```ml
videoWidth
```

When constructing this record, `create` supplies `1280` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L85)
