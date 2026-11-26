# `mq3.client.cl_console.ConsoleLine`

[Home](README.md) · [Source file](File-src-mq3-client-cl-console-ml-1724798958.md)

<a id="struct-struct-mq3-client-cl-console-consoleline-struct-consoleline-src-mq3-client-cl-console-ml-821792433"></a>
## ConsoleLine

```ml
struct ConsoleLine
```

Stores engine client console console line record, including `line`, `text`, `glyphs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L66)

## Members

<a id="field-field-mq3-client-cl-console-consoleline-glyphs-glyphs-src-mq3-client-cl-console-ml-339389102"></a>
### glyphs

```ml
glyphs
```

When constructing this record, `Con_DrawNotify` supplies `lineGlyphs(state,line,SMALLCHAR_WIDTH,vertical)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L74)

<a id="field-field-mq3-client-cl-console-consoleline-line-line-src-mq3-client-cl-console-ml-935707016"></a>
### line

```ml
line
```

When constructing this record, `Con_DrawNotify` supplies `line` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L68)

<a id="field-field-mq3-client-cl-console-consoleline-text-text-src-mq3-client-cl-console-ml-2016423826"></a>
### text

```ml
text
```

Character text of one console scrollback line, paired with separately positioned and colored glyphs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_console.ml#L71)
