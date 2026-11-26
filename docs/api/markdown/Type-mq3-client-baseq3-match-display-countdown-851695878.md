# `mq3.client.baseq3_match_display.Countdown`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)

<a id="struct-struct-mq3-client-baseq3-match-display-countdown-struct-countdown-src-mq3-client-baseq3-match-display-ml-942697531"></a>
## Countdown

```ml
struct Countdown
```

Stores base Quake III match display countdown record, including `text`, `charWidth`, `charHeight`, `second`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L64)

## Members

<a id="field-field-mq3-client-baseq3-match-display-countdown-charheight-charheight-src-mq3-client-baseq3-match-display-ml-1018827082"></a>
### charHeight

```ml
charHeight
```

When constructing this record, `countdown` supplies `numeric.trunc32(charWidth*1.5)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L71)

<a id="field-field-mq3-client-baseq3-match-display-countdown-charwidth-charwidth-src-mq3-client-baseq3-match-display-ml-555212916"></a>
### charWidth

```ml
charWidth
```

When constructing this record, `countdown` supplies `charWidth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L68)

<a id="field-field-mq3-client-baseq3-match-display-countdown-second-second-src-mq3-client-baseq3-match-display-ml-928228380"></a>
### second

```ml
second
```

When constructing this record, `countdown` supplies `second` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L73)

<a id="field-field-mq3-client-baseq3-match-display-countdown-text-text-src-mq3-client-baseq3-match-display-ml-1428180202"></a>
### text

```ml
text
```

Preformatted warmup label displaying how many seconds remain before the match starts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L66)
