# `mq3.vm.syscall_common.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-common-ml-1768394.md)

<a id="struct-struct-mq3-vm-syscall-common-services-struct-services-src-mq3-vm-syscall-common-ml-325991133"></a>
## Services

```ml
struct Services
```

Shared QVM host services; callbacks receive the stored context rather than the Services record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L36)

## Members

<a id="field-field-mq3-vm-syscall-common-services-closefn-closefn-src-mq3-vm-syscall-common-ml-1881083705"></a>
### closeFn

```ml
closeFn
```

Optional callback `(context, handle)` releasing a file handle; its return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L58)

<a id="field-field-mq3-vm-syscall-common-services-commands-commands-src-mq3-vm-syscall-common-ml-1456203837"></a>
### commands

```ml
commands
```

Command-buffer state whose currently tokenized command supplies argc, argv, and args traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L40)

<a id="field-field-mq3-vm-syscall-common-services-consolefn-consolefn-src-mq3-vm-syscall-common-ml-631088341"></a>
### consoleFn

```ml
consoleFn
```

Optional callback `(context, executionMode, text)` for a console command; its return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L50)

<a id="field-field-mq3-vm-syscall-common-services-context-context-src-mq3-vm-syscall-common-ml-692994341"></a>
### context

```ml
context
```

Opaque caller-supplied context available to shared QVM console, clock, and file-system services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L42)

<a id="field-field-mq3-vm-syscall-common-services-cvars-cvars-src-mq3-vm-syscall-common-ml-561106537"></a>
### cvars

```ml
cvars
```

Host cvar registry used by QVM registration, lookup, mutation, and vmCvar_t synchronization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L38)

<a id="field-field-mq3-vm-syscall-common-services-errorfn-errorfn-src-mq3-vm-syscall-common-ml-1072097549"></a>
### errorFn

```ml
errorFn
```

Optional callback `(context, text)` for VM error reporting; the trap returns zero if the callback returns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L46)

<a id="field-field-mq3-vm-syscall-common-services-millisecondsfn-millisecondsfn-src-mq3-vm-syscall-common-ml-641172077"></a>
### millisecondsFn

```ml
millisecondsFn
```

Optional callback `(context)` returning the host millisecond clock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L48)

<a id="field-field-mq3-vm-syscall-common-services-openfn-openfn-src-mq3-vm-syscall-common-ml-1459803417"></a>
### openFn

```ml
openFn
```

Optional callback `(context, path, mode)` returning OpenResult(handle, length), or `void` for failure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L52)

<a id="field-field-mq3-vm-syscall-common-services-printfn-printfn-src-mq3-vm-syscall-common-ml-543154621"></a>
### printFn

```ml
printFn
```

Optional callback `(context, text)` for ordinary console output; its return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L44)

<a id="field-field-mq3-vm-syscall-common-services-readfn-readfn-src-mq3-vm-syscall-common-ml-1162967453"></a>
### readFn

```ml
readFn
```

Optional callback `(context, handle, count)` returning at least `count` bytes; short results fail the trap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L54)

<a id="field-field-mq3-vm-syscall-common-services-writefn-writefn-src-mq3-vm-syscall-common-ml-845174169"></a>
### writeFn

```ml
writeFn
```

Optional callback `(context, handle, data)` receiving the requested byte slice; its return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L56)
