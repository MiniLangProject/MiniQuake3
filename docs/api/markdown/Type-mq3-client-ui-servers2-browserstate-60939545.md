# `mq3.client.ui_servers2.BrowserState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-servers2-ml-1909498126.md)

<a id="struct-struct-mq3-client-ui-servers2-browserstate-struct-browserstate-src-mq3-client-ui-servers2-ml-420400495"></a>
## BrowserState

```ml
struct BrowserState
```

Stores UI servers2 browser state record, including `source`, `masterSelection`, `gameFilter`, `sortKey`, `showFull`, `showEmpty` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L198)

## Members

<a id="field-field-mq3-client-ui-servers2-browserstate-actions-actions-src-mq3-client-ui-servers2-ml-1589643456"></a>
### actions

```ml
actions
```

Host requests queued while refreshing, filtering, and selecting servers for connection, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L271)

<a id="field-field-mq3-client-ui-servers2-browserstate-assets-assets-src-mq3-client-ui-servers2-ml-314143178"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the base-game server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L266)

<a id="field-field-mq3-client-ui-servers2-browserstate-choices-choices-src-mq3-client-ui-servers2-ml-715942412"></a>
### choices

```ml
choices
```

Choice-list definitions for browser source, filters, and sorting controls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L263)

<a id="field-field-mq3-client-ui-servers2-browserstate-controlsgrayed-controlsgrayed-src-mq3-client-ui-servers2-ml-2000644348"></a>
### controlsGrayed

```ml
controlsGrayed
```

When constructing this record, `browserState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L257)

<a id="field-field-mq3-client-ui-servers2-browserstate-currentping-currentping-src-mq3-client-ui-servers2-ml-2141021392"></a>
### currentPing

```ml
currentPing
```

When constructing this record, `browserState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L243)

<a id="field-field-mq3-client-ui-servers2-browserstate-favoriteaddresses-favoriteaddresses-src-mq3-client-ui-servers2-ml-750026532"></a>
### favoriteAddresses

```ml
favoriteAddresses
```

Persistent address strings used to construct and update the browser's favorite-server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L225)

<a id="field-field-mq3-client-ui-servers2-browserstate-favoriteservers-favoriteservers-src-mq3-client-ui-servers2-ml-129097504"></a>
### favoriteServers

```ml
favoriteServers
```

Saved server list corresponding to the user's favorite server addresses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L223)

<a id="field-field-mq3-client-ui-servers2-browserstate-gamefilter-gamefilter-src-mq3-client-ui-servers2-ml-1800759644"></a>
### gameFilter

```ml
gameFilter
```

When constructing this record, `browserState` supplies `GAMES_ALL` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L204)

<a id="field-field-mq3-client-ui-servers2-browserstate-globalservers-globalservers-src-mq3-client-ui-servers2-ml-1503786584"></a>
### globalServers

```ml
globalServers
```

Saved server list for the primary Internet master, restored when that source is selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L219)

<a id="field-field-mq3-client-ui-servers2-browserstate-gograyed-gograyed-src-mq3-client-ui-servers2-ml-1295820148"></a>
### goGrayed

```ml
goGrayed
```

When constructing this record, `browserState` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L261)

<a id="field-field-mq3-client-ui-servers2-browserstate-items-items-src-mq3-client-ui-servers2-ml-1986834088"></a>
### items

```ml
items
```

Interactive menu widgets installed by the server-browser initializer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L268)

<a id="field-field-mq3-client-ui-servers2-browserstate-listgrayed-listgrayed-src-mq3-client-ui-servers2-ml-1397122852"></a>
### listGrayed

```ml
listGrayed
```

When constructing this record, `browserState` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L259)

<a id="field-field-mq3-client-ui-servers2-browserstate-localservers-localservers-src-mq3-client-ui-servers2-ml-1498685522"></a>
### localServers

```ml
localServers
```

Saved server list for LAN discovery, restored when the browser switches to the local source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L217)

<a id="field-field-mq3-client-ui-servers2-browserstate-mappicture-mappicture-src-mq3-client-ui-servers2-ml-1575631740"></a>
### mapPicture

```ml
mapPicture
```

When constructing this record, `browserState` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L235)

<a id="field-field-mq3-client-ui-servers2-browserstate-masterselection-masterselection-src-mq3-client-ui-servers2-ml-1587337260"></a>
### masterSelection

```ml
masterSelection
```

When constructing this record, `browserState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L202)

<a id="field-field-mq3-client-ui-servers2-browserstate-maxservers-maxservers-src-mq3-client-ui-servers2-ml-1867679956"></a>
### maxServers

```ml
maxServers
```

When constructing this record, `browserState` supplies `MAX_GLOBALSERVERS` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L249)

<a id="field-field-mq3-client-ui-servers2-browserstate-mplayerservers-mplayerservers-src-mq3-client-ui-servers2-ml-1248455984"></a>
### mplayerServers

```ml
mplayerServers
```

Saved server list for the alternate MPlayer master source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L221)

<a id="field-field-mq3-client-ui-servers2-browserstate-nextpingtime-nextpingtime-src-mq3-client-ui-servers2-ml-82808620"></a>
### nextPingTime

```ml
nextPingTime
```

When constructing this record, `browserState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L247)

<a id="field-field-mq3-client-ui-servers2-browserstate-numqueried-numqueried-src-mq3-client-ui-servers2-ml-43962266"></a>
### numQueried

```ml
numQueried
```

When constructing this record, `browserState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L241)

<a id="field-field-mq3-client-ui-servers2-browserstate-pingrequests-pingrequests-src-mq3-client-ui-servers2-ml-1959580548"></a>
### pingRequests

```ml
pingRequests
```

When constructing this record, `browserState` supplies `requests` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L253)

<a id="field-field-mq3-client-ui-servers2-browserstate-punkbuster-punkbuster-src-mq3-client-ui-servers2-ml-190878074"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L212)

<a id="field-field-mq3-client-ui-servers2-browserstate-refreshing-refreshing-src-mq3-client-ui-servers2-ml-1079242710"></a>
### refreshing

```ml
refreshing
```

When constructing this record, `browserState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L245)

<a id="field-field-mq3-client-ui-servers2-browserstate-refreshtime-refreshtime-src-mq3-client-ui-servers2-ml-1760591588"></a>
### refreshTime

```ml
refreshTime
```

When constructing this record, `browserState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L251)

<a id="field-field-mq3-client-ui-servers2-browserstate-removevisible-removevisible-src-mq3-client-ui-servers2-ml-1469376012"></a>
### removeVisible

```ml
removeVisible
```

When constructing this record, `browserState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L255)

<a id="field-field-mq3-client-ui-servers2-browserstate-rows-rows-src-mq3-client-ui-servers2-ml-582167946"></a>
### rows

```ml
rows
```

Formatted text rows corresponding to the filtered visible server indices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L229)

<a id="field-field-mq3-client-ui-servers2-browserstate-selected-selected-src-mq3-client-ui-servers2-ml-1798459466"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L231)

<a id="field-field-mq3-client-ui-servers2-browserstate-servers-servers-src-mq3-client-ui-servers2-ml-138032760"></a>
### servers

```ml
servers
```

Working server list for the selected discovery source, sorted and filtered to produce the visible rows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L215)

<a id="field-field-mq3-client-ui-servers2-browserstate-showempty-showempty-src-mq3-client-ui-servers2-ml-768821756"></a>
### showEmpty

```ml
showEmpty
```

When constructing this record, `browserState` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L210)

<a id="field-field-mq3-client-ui-servers2-browserstate-showfull-showfull-src-mq3-client-ui-servers2-ml-1202761692"></a>
### showFull

```ml
showFull
```

When constructing this record, `browserState` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L208)

<a id="field-field-mq3-client-ui-servers2-browserstate-sortkey-sortkey-src-mq3-client-ui-servers2-ml-1847836788"></a>
### sortKey

```ml
sortKey
```

When constructing this record, `browserState` supplies `SORT_HOST` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L206)

<a id="field-field-mq3-client-ui-servers2-browserstate-source-source-src-mq3-client-ui-servers2-ml-261249658"></a>
### source

```ml
source
```

When constructing this record, `browserState` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L200)

<a id="field-field-mq3-client-ui-servers2-browserstate-status-status-src-mq3-client-ui-servers2-ml-516090744"></a>
### status

```ml
status
```

When constructing this record, `browserState` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L237)

<a id="field-field-mq3-client-ui-servers2-browserstate-statusbar-statusbar-src-mq3-client-ui-servers2-ml-1073061252"></a>
### statusBar

```ml
statusBar
```

When constructing this record, `browserState` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L239)

<a id="field-field-mq3-client-ui-servers2-browserstate-top-top-src-mq3-client-ui-servers2-ml-1404326540"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L233)

<a id="field-field-mq3-client-ui-servers2-browserstate-visibleindices-visibleindices-src-mq3-client-ui-servers2-ml-666046818"></a>
### visibleIndices

```ml
visibleIndices
```

Indices into the working server list for rows that pass the current browser filters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L227)
