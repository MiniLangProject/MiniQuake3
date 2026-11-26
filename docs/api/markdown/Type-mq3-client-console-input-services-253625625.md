# `mq3.client.console_input.Services`

[Home](README.md) · [Source file](File-src-mq3-client-console-input-ml-896040399.md)

<a id="struct-struct-mq3-client-console-input-services-struct-services-src-mq3-client-console-input-ml-365660651"></a>
## Services

```ml
struct Services
```

Stores console input host-service callbacks, including `context`, `commandFn`, `reliableFn`, `printFn`, `completeFn`, `clipboardFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L74)

## Members

<a id="field-field-mq3-client-console-input-services-clipboardfn-clipboardfn-src-mq3-client-console-input-ml-387271685"></a>
### clipboardFn

```ml
clipboardFn
```

Host callback for the clipboard operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L90)

<a id="field-field-mq3-client-console-input-services-commandfn-commandfn-src-mq3-client-console-input-ml-1705980693"></a>
### commandFn

```ml
commandFn
```

Host callback for the command operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L79)

<a id="field-field-mq3-client-console-input-services-completefn-completefn-src-mq3-client-console-input-ml-50322347"></a>
### completeFn

```ml
completeFn
```

Host callback for the complete operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L87)

<a id="field-field-mq3-client-console-input-services-context-context-src-mq3-client-console-input-ml-621193021"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for console editing and command submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L77)

<a id="field-field-mq3-client-console-input-services-printfn-printfn-src-mq3-client-console-input-ml-827671741"></a>
### printFn

```ml
printFn
```

Host callback for the print operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L84)

<a id="field-field-mq3-client-console-input-services-reliablefn-reliablefn-src-mq3-client-console-input-ml-1775557249"></a>
### reliableFn

```ml
reliableFn
```

Host callback for the reliable operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L82)

<a id="field-field-mq3-client-console-input-services-scrollfn-scrollfn-src-mq3-client-console-input-ml-789966607"></a>
### scrollFn

```ml
scrollFn
```

Host callback for the scroll operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L92)
