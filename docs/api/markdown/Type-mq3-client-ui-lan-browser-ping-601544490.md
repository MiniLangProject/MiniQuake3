# `mq3.client.ui_lan_browser.Ping`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)

<a id="struct-struct-mq3-client-ui-lan-browser-ping-struct-ping-src-mq3-client-ui-lan-browser-ml-825149785"></a>
## Ping

```ml
struct Ping
```

Stores UI LAN browser ping record, including `address`, `time`, `info`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L64)

## Members

<a id="field-field-mq3-client-ui-lan-browser-ping-address-address-src-mq3-client-ui-lan-browser-ml-43259297"></a>
### address

```ml
address
```

When constructing this record, `ping` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L66)

<a id="field-field-mq3-client-ui-lan-browser-ping-info-info-src-mq3-client-ui-lan-browser-ml-805725645"></a>
### info

```ml
info
```

When constructing this record, `ping` supplies `text` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L70)

<a id="field-field-mq3-client-ui-lan-browser-ping-time-time-src-mq3-client-ui-lan-browser-ml-780910031"></a>
### time

```ml
time
```

Ping timing value used to record latency or completion of the browser request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L68)
