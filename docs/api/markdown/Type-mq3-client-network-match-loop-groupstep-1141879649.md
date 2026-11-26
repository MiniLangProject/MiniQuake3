# `mq3.client.network_match_loop.GroupStep`

[Home](README.md) · [Source file](File-src-mq3-client-network-match-loop-ml-1892407048.md)

<a id="struct-struct-mq3-client-network-match-loop-groupstep-struct-groupstep-src-mq3-client-network-match-loop-ml-886829933"></a>
## GroupStep

```ml
struct GroupStep
```

Stores network match loop group step record, including `processed`, `runtimeIndex`, `step`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L71)

## Members

<a id="field-field-mq3-client-network-match-loop-groupstep-processed-processed-src-mq3-client-network-match-loop-ml-1957956434"></a>
### processed

```ml
processed
```

When constructing this record, `pumpGroupOnce` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L73)

<a id="field-field-mq3-client-network-match-loop-groupstep-runtimeindex-runtimeindex-src-mq3-client-network-match-loop-ml-1344483734"></a>
### runtimeIndex

```ml
runtimeIndex
```

When constructing this record, `pumpGroupOnce` supplies `index` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L75)

<a id="field-field-mq3-client-network-match-loop-groupstep-step-step-src-mq3-client-network-match-loop-ml-1913438518"></a>
### step

```ml
step
```

When constructing this record, `pumpGroupOnce` supplies `step` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L77)
