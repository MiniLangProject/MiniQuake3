# `mq3.botlib.aas_client_movement.Movement`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)

<a id="struct-struct-mq3-botlib-aas-client-movement-movement-struct-movement-src-mq3-botlib-aas-client-movement-ml-1762148935"></a>
## Movement

```ml
struct Movement
```

`Movement` record for aas client movement, containing `success`, `endpos`, `endarea`, `velocity` and `trace` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L119)

## Members

<a id="field-field-mq3-botlib-aas-client-movement-movement-endarea-endarea-src-mq3-botlib-aas-client-movement-ml-1434489688"></a>
### endarea

```ml
endarea
```

Area at end of movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L125)

<a id="field-field-mq3-botlib-aas-client-movement-movement-endcontents-endcontents-src-mq3-botlib-aas-client-movement-ml-1340260024"></a>
### endcontents

```ml
endcontents
```

Contents at the end of movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L135)

<a id="field-field-mq3-botlib-aas-client-movement-movement-endpos-endpos-src-mq3-botlib-aas-client-movement-ml-1556949250"></a>
### endpos

```ml
endpos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L123)

<a id="field-field-mq3-botlib-aas-client-movement-movement-frames-frames-src-mq3-botlib-aas-client-movement-ml-71893560"></a>
### frames

```ml
frames
```

Number of frames predicted ahead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L139)

<a id="field-field-mq3-botlib-aas-client-movement-movement-presencetype-presencetype-src-mq3-botlib-aas-client-movement-ml-2085696450"></a>
### presencetype

```ml
presencetype
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L131)

<a id="field-field-mq3-botlib-aas-client-movement-movement-stopevent-stopevent-src-mq3-botlib-aas-client-movement-ml-252484304"></a>
### stopevent

```ml
stopevent
```

Event that made the prediction stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L133)

<a id="field-field-mq3-botlib-aas-client-movement-movement-success-success-src-mq3-botlib-aas-client-movement-ml-1076584580"></a>
### success

```ml
success
```

True when movement prediction reached its requested stopping condition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L121)

<a id="field-field-mq3-botlib-aas-client-movement-movement-time-time-src-mq3-botlib-aas-client-movement-ml-1131122446"></a>
### time

```ml
time
```

Total time simulated by this movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L137)

<a id="field-field-mq3-botlib-aas-client-movement-movement-trace-trace-src-mq3-botlib-aas-client-movement-ml-1420410120"></a>
### trace

```ml
trace
```

Collision trace result or active trace state for this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L129)

<a id="field-field-mq3-botlib-aas-client-movement-movement-velocity-velocity-src-mq3-botlib-aas-client-movement-ml-731278154"></a>
### velocity

```ml
velocity
```

World-space linear velocity associated with the moving entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L127)
