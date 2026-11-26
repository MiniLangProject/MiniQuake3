# `mq3.client.baseq3_match_display.CenterPrint`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)

<a id="struct-struct-mq3-client-baseq3-match-display-centerprint-struct-centerprint-src-mq3-client-baseq3-match-display-ml-1983224149"></a>
## CenterPrint

```ml
struct CenterPrint
```

Stores base Quake III match display center print record, including `text`, `startedAt`, `y`, `charWidth`, `duration`, `lines`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L48)

## Members

<a id="field-field-mq3-client-baseq3-match-display-centerprint-charwidth-charwidth-src-mq3-client-baseq3-match-display-ml-1619988853"></a>
### charWidth

```ml
charWidth
```

When constructing this record, `centerPrint` supplies `charWidth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L57)

<a id="field-field-mq3-client-baseq3-match-display-centerprint-duration-duration-src-mq3-client-baseq3-match-display-ml-1792925481"></a>
### duration

```ml
duration
```

When constructing this record, `centerPrint` supplies `duration` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L59)

<a id="field-field-mq3-client-baseq3-match-display-centerprint-lines-lines-src-mq3-client-baseq3-match-display-ml-430475765"></a>
### lines

```ml
lines
```

When constructing this record, `centerPrint` supplies `lineCount(text)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L61)

<a id="field-field-mq3-client-baseq3-match-display-centerprint-startedat-startedat-src-mq3-client-baseq3-match-display-ml-34214065"></a>
### startedAt

```ml
startedAt
```

When constructing this record, `centerPrint` supplies `startedAt` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L53)

<a id="field-field-mq3-client-baseq3-match-display-centerprint-text-text-src-mq3-client-baseq3-match-display-ml-85700995"></a>
### text

```ml
text
```

Multiline center-print message retained with its start time, screen position, and display duration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L51)

<a id="field-field-mq3-client-baseq3-match-display-centerprint-y-y-src-mq3-client-baseq3-match-display-ml-736256957"></a>
### y

```ml
y
```

Vertical coordinate of the center-print message in the virtual HUD layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L55)
