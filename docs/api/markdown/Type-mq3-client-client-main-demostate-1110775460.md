# `mq3.client.client_main.DemoState`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-demostate-struct-demostate-src-mq3-client-client-main-ml-1067192109"></a>
## DemoState

```ml
struct DemoState
```

Stores client main demo state record, including `recording`, `playing`, `file`, `name`, `nextDemo`, `serverMessageSequence` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L151)

## Members

<a id="field-field-mq3-client-client-main-demostate-file-file-src-mq3-client-client-main-ml-466375161"></a>
### file

```ml
file
```

Open demo-recording handle passed to the host's write and close callbacks; absent before recording starts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L158)

<a id="field-field-mq3-client-client-main-demostate-name-name-src-mq3-client-client-main-ml-1884269563"></a>
### name

```ml
name
```

Virtual filename identifying the current demo recording or playback stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L160)

<a id="field-field-mq3-client-client-main-demostate-nextdemo-nextdemo-src-mq3-client-client-main-ml-2006842513"></a>
### nextDemo

```ml
nextDemo
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L162)

<a id="field-field-mq3-client-client-main-demostate-offset-offset-src-mq3-client-client-main-ml-581866163"></a>
### offset

```ml
offset
```

Current byte position retained for demo playback and reset when playback starts or completes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L166)

<a id="field-field-mq3-client-client-main-demostate-playing-playing-src-mq3-client-client-main-ml-1661495425"></a>
### playing

```ml
playing
```

True while the client is consuming a recorded demo instead of a live server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L155)

<a id="field-field-mq3-client-client-main-demostate-recording-recording-src-mq3-client-client-main-ml-573070117"></a>
### recording

```ml
recording
```

True while outgoing demo records are being written to the open recording file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L153)

<a id="field-field-mq3-client-client-main-demostate-servermessagesequence-servermessagesequence-src-mq3-client-client-main-ml-1299937797"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L164)
