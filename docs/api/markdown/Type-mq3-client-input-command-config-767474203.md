# `mq3.client.input_command.Config`

[Home](README.md) · [Source file](File-src-mq3-client-input-command-ml-1980603655.md)

<a id="struct-struct-mq3-client-input-command-config-struct-config-src-mq3-client-input-command-ml-1995942327"></a>
## Config

```ml
struct Config
```

Stores input command config record, including `forwardSpeed`, `sideSpeed`, `upSpeed`, `yawSpeed`, `pitchSpeed`, `angleSpeedKey` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L35)

## Members

<a id="field-field-mq3-client-input-command-config-anglespeedkey-anglespeedkey-src-mq3-client-input-command-ml-45094287"></a>
### angleSpeedKey

```ml
angleSpeedKey
```

When constructing this record, `defaults` supplies `1.5` for this member. Used by `adjustAngles` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L50)

<a id="field-field-mq3-client-input-command-config-filter-filter-src-mq3-client-input-command-ml-933589515"></a>
### filter

```ml
filter
```

When constructing this record, `defaults` supplies `false` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L56)

<a id="field-field-mq3-client-input-command-config-forwardspeed-forwardspeed-src-mq3-client-input-command-ml-348441735"></a>
### forwardSpeed

```ml
forwardSpeed
```

When constructing this record, `defaults` supplies `127.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L37)

<a id="field-field-mq3-client-input-command-config-freelook-freelook-src-mq3-client-input-command-ml-49836617"></a>
### freelook

```ml
freelook
```

When constructing this record, `defaults` supplies `true` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L77)

<a id="field-field-mq3-client-input-command-config-mouseaccel-mouseaccel-src-mq3-client-input-command-ml-569362361"></a>
### mouseAccel

```ml
mouseAccel
```

When constructing this record, `defaults` supplies `0.0` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L62)

<a id="field-field-mq3-client-input-command-config-mouseforward-mouseforward-src-mq3-client-input-command-ml-776370119"></a>
### mouseForward

```ml
mouseForward
```

When constructing this record, `defaults` supplies `0.25` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L71)

<a id="field-field-mq3-client-input-command-config-mousepitch-mousepitch-src-mq3-client-input-command-ml-1998140529"></a>
### mousePitch

```ml
mousePitch
```

When constructing this record, `defaults` supplies `0.022` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L68)

<a id="field-field-mq3-client-input-command-config-mouseside-mouseside-src-mq3-client-input-command-ml-284325091"></a>
### mouseSide

```ml
mouseSide
```

When constructing this record, `defaults` supplies `0.25` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L74)

<a id="field-field-mq3-client-input-command-config-mouseyaw-mouseyaw-src-mq3-client-input-command-ml-1018038679"></a>
### mouseYaw

```ml
mouseYaw
```

When constructing this record, `defaults` supplies `0.022` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L65)

<a id="field-field-mq3-client-input-command-config-pitchspeed-pitchspeed-src-mq3-client-input-command-ml-129291605"></a>
### pitchSpeed

```ml
pitchSpeed
```

When constructing this record, `defaults` supplies `140.0` for this member. Used by `adjustAngles` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L47)

<a id="field-field-mq3-client-input-command-config-run-run-src-mq3-client-input-command-ml-2082717071"></a>
### run

```ml
run
```

When constructing this record, `defaults` supplies `true` for this member. Used by `keyMove` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L53)

<a id="field-field-mq3-client-input-command-config-sensitivity-sensitivity-src-mq3-client-input-command-ml-966569315"></a>
### sensitivity

```ml
sensitivity
```

When constructing this record, `defaults` supplies `5.0` for this member. Used by `mouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L59)

<a id="field-field-mq3-client-input-command-config-sidespeed-sidespeed-src-mq3-client-input-command-ml-1399986455"></a>
### sideSpeed

```ml
sideSpeed
```

When constructing this record, `defaults` supplies `127.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L39)

<a id="field-field-mq3-client-input-command-config-upspeed-upspeed-src-mq3-client-input-command-ml-2114174723"></a>
### upSpeed

```ml
upSpeed
```

When constructing this record, `defaults` supplies `127.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L41)

<a id="field-field-mq3-client-input-command-config-yawspeed-yawspeed-src-mq3-client-input-command-ml-1627317827"></a>
### yawSpeed

```ml
yawSpeed
```

When constructing this record, `defaults` supplies `140.0` for this member. Used by `adjustAngles` and `joystickMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L44)
