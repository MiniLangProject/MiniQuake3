# `mq3.vm.cgame_collision_cache.Fifo`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-collision-cache-ml-322754460.md)

<a id="struct-struct-mq3-vm-cgame-collision-cache-fifo-struct-fifo-src-mq3-vm-cgame-collision-cache-ml-2135347715"></a>
## Fifo

```ml
struct Fifo
```

Fifo record for vm.cgame_collision_cache, containing `table`, `keys`, `next`, `used`, `capacity`, `hits`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L16)

## Members

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-capacity-capacity-src-mq3-vm-cgame-collision-cache-ml-1231733283"></a>
### capacity

```ml
capacity
```

Maximum number of entries that the cache/table can retain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L26)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-evictions-evictions-src-mq3-vm-cgame-collision-cache-ml-176514167"></a>
### evictions

```ml
evictions
```

Number of cache entries removed to make room for newer results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L32)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-hits-hits-src-mq3-vm-cgame-collision-cache-ml-1737903415"></a>
### hits

```ml
hits
```

Number of successful lookups served from the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L28)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-keys-keys-src-mq3-vm-cgame-collision-cache-ml-379333203"></a>
### keys

```ml
keys
```

Circular eviction-order array of cached query keys.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L20)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-misses-misses-src-mq3-vm-cgame-collision-cache-ml-675095607"></a>
### misses

```ml
misses
```

Number of lookups that required a new result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L30)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-next-next-src-mq3-vm-cgame-collision-cache-ml-1627000085"></a>
### next

```ml
next
```

Index of the next circular eviction slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L22)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-table-table-src-mq3-vm-cgame-collision-cache-ml-958311691"></a>
### table

```ml
table
```

Hash table mapping serialized query keys to cached results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L18)

<a id="field-field-mq3-vm-cgame-collision-cache-fifo-used-used-src-mq3-vm-cgame-collision-cache-ml-54677505"></a>
### used

```ml
used
```

Number of currently occupied cache/table entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L24)
