# `src/mq3/client/desktop_video.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.desktop_video`](Package-mq3-client-desktop-video-1611114295.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/renderer/tr_init.ml` as `renderer` → [src/mq3/renderer/tr_init.ml](File-src-mq3-renderer-tr-init-ml-1583039474.md)

## Declarations

- [mq3.client.desktop_video.ActiveMode](Type-mq3-client-desktop-video-activemode-1444839650.md) — struct
<a id="function-function-mq3-client-desktop-video-apply-function-apply-registry-togglefullscreen-src-mq3-client-desktop-video-ml-716197428"></a>
### apply

```ml
function apply(registry, toggleFullscreen)
```

Calls `mq3.client.desktop_video.requestedMode`, `mq3.qcommon.cvar.get`, `mq3.platform.playable_window.setMode` and additional helpers from desktop video `apply`. The final path returns `ActiveMode(active.width,active.height,active.fullscreen,picmip)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `mode=requestedMode(registry,toggleFullscreen)`. |
| `toggleFullscreen` | `dynamic` | — | Value used by `mode=requestedMode(registry,toggleFullscreen)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_video.ml#L32)

<a id="function-function-mq3-client-desktop-video-open-function-open-registry-src-mq3-client-desktop-video-ml-738329123"></a>
### open

```ml
function open(registry)
```

Calls `mq3.client.desktop_video.requestedMode`, `mq3.platform.playable_window.open`, `mq3.client.desktop_video.apply` from desktop video `open`. The final path returns `apply(registry,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `mode=requestedMode(registry,false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_video.ml#L49)

<a id="function-function-mq3-client-desktop-video-requestedmode-function-requestedmode-registry-togglefullscreen-src-mq3-client-desktop-video-ml-913823046"></a>
### requestedMode

```ml
function requestedMode(registry, toggleFullscreen)
```

Calls `mq3.qcommon.cvar.get`, `mq3.qcommon.cvar.set2`, `mq3.renderer.tr_init.getModeInfo` and additional helpers from desktop video `requestedMode`. The final path returns `window.DisplayMode(dimensions[0],dimensions[1],fullscreen)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `mode=cvar.get(registry,"r_mode","-1",cvar.ARCHIVE).integer`. |
| `toggleFullscreen` | `dynamic` | — | Value used by `if toggleFullscreen then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_video.ml#L14)
