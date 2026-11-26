# `mq3.vm.syscall_qagame_world.TraceResult`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)

<a id="struct-struct-mq3-vm-syscall-qagame-world-traceresult-struct-traceresult-src-mq3-vm-syscall-qagame-world-ml-1981889443"></a>
## TraceResult

```ml
struct TraceResult
```

TraceResult record for vm.syscall_qagame_world, containing `allsolid`, `startsolid`, `fraction`, `endpos`, `planeNormal`, `planeDist`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L36)

## Members

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-allsolid-allsolid-src-mq3-vm-syscall-qagame-world-ml-42322325"></a>
### allsolid

```ml
allsolid
```

Nonzero when the entire requested trace remains inside solid space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L38)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-contents-contents-src-mq3-vm-syscall-qagame-world-ml-748934141"></a>
### contents

```ml
contents
```

CONTENTS_* mask describing the collision contents of this object or query result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L56)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-endpos-endpos-src-mq3-vm-syscall-qagame-world-ml-312871063"></a>
### endpos

```ml
endpos
```

Final position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L44)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-entitynum-entitynum-src-mq3-vm-syscall-qagame-world-ml-1152553409"></a>
### entityNum

```ml
entityNum
```

Entity number returned by or associated with this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L58)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-fraction-fraction-src-mq3-vm-syscall-qagame-world-ml-489066973"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace completed before the first blocking collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L42)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-planedist-planedist-src-mq3-vm-syscall-qagame-world-ml-115110269"></a>
### planeDist

```ml
planeDist
```

Distance of the collision plane from the world origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L48)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-planenormal-planenormal-src-mq3-vm-syscall-qagame-world-ml-936975689"></a>
### planeNormal

```ml
planeNormal
```

Normal of the collision plane returned by the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L46)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-planesignbits-planesignbits-src-mq3-vm-syscall-qagame-world-ml-1252235633"></a>
### planeSignBits

```ml
planeSignBits
```

Negative-component mask of the collision plane normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L52)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-planetype-planetype-src-mq3-vm-syscall-qagame-world-ml-46511149"></a>
### planeType

```ml
planeType
```

Axial/general classification of the collision plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L50)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-startsolid-startsolid-src-mq3-vm-syscall-qagame-world-ml-837235315"></a>
### startsolid

```ml
startsolid
```

Nonzero when the requested trace begins inside solid space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L40)

<a id="field-field-mq3-vm-syscall-qagame-world-traceresult-surfaceflags-surfaceflags-src-mq3-vm-syscall-qagame-world-ml-1523462301"></a>
### surfaceFlags

```ml
surfaceFlags
```

SURF_* flags of the surface involved in the collision or movement result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L54)
