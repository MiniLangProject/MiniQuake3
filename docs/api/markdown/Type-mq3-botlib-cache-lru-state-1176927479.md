# `mq3.botlib.cache_lru.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-cache-lru-ml-148626408.md)

<a id="struct-struct-mq3-botlib-cache-lru-state-struct-state-src-mq3-botlib-cache-lru-ml-822750715"></a>
## State

```ml
struct State
```

`State` record for cache lru, containing `positions`, `keys`, `previous`, `next` and `oldest` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L7)

## Members

<a id="field-field-mq3-botlib-cache-lru-state-capacity-capacity-src-mq3-botlib-cache-lru-ml-317525072"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L23)

<a id="field-field-mq3-botlib-cache-lru-state-count-count-src-mq3-botlib-cache-lru-ml-47970092"></a>
### count

```ml
count
```

Number of valid entries represented by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L21)

<a id="field-field-mq3-botlib-cache-lru-state-keys-keys-src-mq3-botlib-cache-lru-ml-1750076936"></a>
### keys

```ml
keys
```

Cache keys stored in each ordering slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L11)

<a id="field-field-mq3-botlib-cache-lru-state-newest-newest-src-mq3-botlib-cache-lru-ml-1906133632"></a>
### newest

```ml
newest
```

Most recently used live slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L19)

<a id="field-field-mq3-botlib-cache-lru-state-next-next-src-mq3-botlib-cache-lru-ml-1193359206"></a>
### next

```ml
next
```

Next slot in the least-recently-used ordering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L15)

<a id="field-field-mq3-botlib-cache-lru-state-oldest-oldest-src-mq3-botlib-cache-lru-ml-861363318"></a>
### oldest

```ml
oldest
```

Least recently used live slot, selected first for eviction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L17)

<a id="field-field-mq3-botlib-cache-lru-state-positions-positions-src-mq3-botlib-cache-lru-ml-216382804"></a>
### positions

```ml
positions
```

Lookup from cache keys to their linked-list slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L9)

<a id="field-field-mq3-botlib-cache-lru-state-previous-previous-src-mq3-botlib-cache-lru-ml-1030006566"></a>
### previous

```ml
previous
```

Previous slot in the least-recently-used ordering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/cache_lru.ml#L13)
