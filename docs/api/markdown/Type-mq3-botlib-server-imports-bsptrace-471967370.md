# `mq3.botlib.server_imports.BspTrace`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-imports-ml-1126004744.md)

<a id="struct-struct-mq3-botlib-server-imports-bsptrace-struct-bsptrace-src-mq3-botlib-server-imports-ml-1178225157"></a>
## BspTrace

```ml
struct BspTrace
```

`BspTrace` record for server imports, containing `allsolid`, `startsolid`, `fraction`, `endpos` and `planeDist` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L182)

## Members

<a id="field-field-mq3-botlib-server-imports-bsptrace-allsolid-allsolid-src-mq3-botlib-server-imports-ml-1852238407"></a>
### allsolid

```ml
allsolid
```

True when the entire trace begins and remains within solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L184)

<a id="field-field-mq3-botlib-server-imports-bsptrace-contents-contents-src-mq3-botlib-server-imports-ml-816172383"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L208)

<a id="field-field-mq3-botlib-server-imports-bsptrace-endpos-endpos-src-mq3-botlib-server-imports-ml-110430581"></a>
### endpos

```ml
endpos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L190)

<a id="field-field-mq3-botlib-server-imports-bsptrace-ent-ent-src-mq3-botlib-server-imports-ml-1671357855"></a>
### ent

```ml
ent
```

Number of entity hit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L202)

<a id="field-field-mq3-botlib-server-imports-bsptrace-expdist-expdist-src-mq3-botlib-server-imports-ml-1953725567"></a>
### expDist

```ml
expDist
```

Expanded plane distance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L204)

<a id="field-field-mq3-botlib-server-imports-bsptrace-fraction-fraction-src-mq3-botlib-server-imports-ml-1934945343"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace segment completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L188)

<a id="field-field-mq3-botlib-server-imports-bsptrace-planedist-planedist-src-mq3-botlib-server-imports-ml-128429727"></a>
### planeDist

```ml
planeDist
```

Distance term of the plane reported by the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L192)

<a id="field-field-mq3-botlib-server-imports-bsptrace-planenormal-planenormal-src-mq3-botlib-server-imports-ml-993987563"></a>
### planeNormal

```ml
planeNormal
```

Normal vector of the plane reported by the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L194)

<a id="field-field-mq3-botlib-server-imports-bsptrace-planesignbits-planesignbits-src-mq3-botlib-server-imports-ml-692870915"></a>
### planeSignbits

```ml
planeSignbits
```

Sign-bit mask of the trace plane's normal components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L196)

<a id="field-field-mq3-botlib-server-imports-bsptrace-planetype-planetype-src-mq3-botlib-server-imports-ml-1099296111"></a>
### planeType

```ml
planeType
```

Axis classification of the plane reported by the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L198)

<a id="field-field-mq3-botlib-server-imports-bsptrace-sidenum-sidenum-src-mq3-botlib-server-imports-ml-124645783"></a>
### sidenum

```ml
sidenum
```

Number of the brush side hit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L206)

<a id="field-field-mq3-botlib-server-imports-bsptrace-startsolid-startsolid-src-mq3-botlib-server-imports-ml-1431053097"></a>
### startsolid

```ml
startsolid
```

True when the initial trace position lies inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L186)

<a id="field-field-mq3-botlib-server-imports-bsptrace-surfacevalue-surfacevalue-src-mq3-botlib-server-imports-ml-2017098863"></a>
### surfaceValue

```ml
surfaceValue
```

Surface value associated with the trace result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L200)
