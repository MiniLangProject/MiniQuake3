# `mq3.platform.win_syscon.State`

[Home](README.md) · [Source file](File-src-mq3-platform-win-syscon-ml-742432789.md)

<a id="struct-struct-mq3-platform-win-syscon-state-struct-state-src-mq3-platform-win-syscon-ml-1762607027"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.win_syscon.State`; groups `created`, `visLevel`, `quitOnClose`, `consoleText`, `returnedText`, `displayText`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L35)

## Members

<a id="field-field-mq3-platform-win-syscon-state-actions-actions-src-mq3-platform-win-syscon-ml-1637708486"></a>
### actions

```ml
actions
```

Platform operations recorded for dispatch or inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L63)

<a id="field-field-mq3-platform-win-syscon-state-consoletext-consoletext-src-mq3-platform-win-syscon-ml-774658378"></a>
### consoleText

```ml
consoleText
```

Text accumulated in the platform console buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L43)

<a id="field-field-mq3-platform-win-syscon-state-created-created-src-mq3-platform-win-syscon-ml-1299309050"></a>
### created

```ml
created
```

Whether the native console window has been created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L37)

<a id="field-field-mq3-platform-win-syscon-state-dedicated-dedicated-src-mq3-platform-win-syscon-ml-1098200990"></a>
### dedicated

```ml
dedicated
```

Whether the process is running as a dedicated server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L61)

<a id="field-field-mq3-platform-win-syscon-state-displaytext-displaytext-src-mq3-platform-win-syscon-ml-179806814"></a>
### displayText

```ml
displayText
```

Console text prepared for presentation in the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L47)

<a id="field-field-mq3-platform-win-syscon-state-errorstring-errorstring-src-mq3-platform-win-syscon-ml-1007317970"></a>
### errorString

```ml
errorString
```

Error message displayed by the native console.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L49)

<a id="field-field-mq3-platform-win-syscon-state-haserror-haserror-src-mq3-platform-win-syscon-ml-129572266"></a>
### hasError

```ml
hasError
```

Whether the console currently displays an error message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L53)

<a id="field-field-mq3-platform-win-syscon-state-hasinput-hasinput-src-mq3-platform-win-syscon-ml-1141233918"></a>
### hasInput

```ml
hasInput
```

Whether a completed console input line is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L51)

<a id="field-field-mq3-platform-win-syscon-state-quitonclose-quitonclose-src-mq3-platform-win-syscon-ml-431371258"></a>
### quitOnClose

```ml
quitOnClose
```

Whether closing the console requests application shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L41)

<a id="field-field-mq3-platform-win-syscon-state-retailactive-retailactive-src-mq3-platform-win-syscon-ml-1870782708"></a>
### retailActive

```ml
retailActive
```

Whether the real platform backend is active for action dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L65)

<a id="field-field-mq3-platform-win-syscon-state-returnedtext-returnedtext-src-mq3-platform-win-syscon-ml-729853482"></a>
### returnedText

```ml
returnedText
```

Completed console input line waiting to be returned to the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L45)

<a id="field-field-mq3-platform-win-syscon-state-timepolarity-timepolarity-src-mq3-platform-win-syscon-ml-2002757136"></a>
### timePolarity

```ml
timePolarity
```

Alternating timing state used by the console's visual updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L57)

<a id="field-field-mq3-platform-win-syscon-state-totalchars-totalchars-src-mq3-platform-win-syscon-ml-538070768"></a>
### totalChars

```ml
totalChars
```

Number of characters retained or appended in the console buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L55)

<a id="field-field-mq3-platform-win-syscon-state-viewlog-viewlog-src-mq3-platform-win-syscon-ml-532772346"></a>
### viewlog

```ml
viewlog
```

Console-log visibility setting reflected by the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L59)

<a id="field-field-mq3-platform-win-syscon-state-vislevel-vislevel-src-mq3-platform-win-syscon-ml-482030146"></a>
### visLevel

```ml
visLevel
```

Console visibility mode: hidden, visible, or minimized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L39)
