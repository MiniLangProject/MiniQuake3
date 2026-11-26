// SPDX-License-Identifier: GPL-2.0-or-later
// Fixed storage hash chains over an existing FIFO cache ring. Hash collisions
// are resolved by the caller's complete key comparison, never by hash alone.
package mq3.renderer.md3_cache_index
import mq3.compat.numeric as md3IndexNumeric
/// Data record for `mq3.renderer.md3_cache_index.Index`; groups `heads`, `links`, `hashes`, `mask`.
struct Index
  /// Head entry of each hash bucket in the cache index.
  heads
  /// Next-entry links used to traverse collisions in a hash bucket.
  links
  /// Stored hash value associated with each cache entry.
  hashes
  /// Bit mask used to select relevant values or wrap a bounded index.
  mask
end struct
/// Builds `mq3.renderer.md3_cache_index.Index` for `mq3.renderer.md3_cache_index.create`.
/// @param capacity Argument 1 supplied to `array`.
function create(capacity)
  buckets=1;while buckets<capacity*2 buckets=buckets*2 end while
  return Index(array(buckets,-1),array(capacity,-1),array(capacity,-1),buckets-1)
end function
/// Computes `mix` from `mixed^(mixed>>16)` using `mq3.compat.numeric.i32`.
/// @param hash Input used by `mixed=md3IndexNumeric.i32((hash^value)*16777619)`.
/// @param value Input used by `mixed=md3IndexNumeric.i32((hash^value)*16777619)`.
function mix(hash,value)
  mixed=md3IndexNumeric.i32((hash^value)*16777619)
  // Fold high bits into bucket bits: integer-valued binary32 coordinates
  // often have zero low mantissa bits and otherwise collapse into one chain.
  return mixed^(mixed>>16)
end function
/// Returns `md3IndexNumeric.floatBits(value)` from `mq3.renderer.md3_cache_index.floatKey`; earlier branches return `0`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.floatBits`.
function floatKey(value) if value==0 then return 0 end if;return md3IndexNumeric.floatBits(value) end function
/// Returns `mix(hash,floatKey(backlerp))` from `mq3.renderer.md3_cache_index.frameHash`.
/// @param model Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`.
/// @param surface Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`.
/// @param frame Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`.
/// @param oldFrame Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`.
/// @param backlerp Value forwarded as `value` to `mq3.renderer.md3_cache_index.floatKey`.
function frameHash(model,surface,frame,oldFrame,backlerp)
  hash=mix(2166136261,model);hash=mix(hash,surface);hash=mix(hash,frame);hash=mix(hash,oldFrame);return mix(hash,floatKey(backlerp))
end function
/// Computes `transformHash` from `frameHash(model,surface,frame,oldFrame,backlerp)` using `mq3.renderer.md3_cache_index.frameHash`, `mq3.renderer.md3_cache_index.mix`, `mq3.renderer.md3_cache_index.floatKey`.
/// @param model Value forwarded as `model` to `mq3.renderer.md3_cache_index.frameHash`.
/// @param surface Value forwarded as `surface` to `mq3.renderer.md3_cache_index.frameHash`.
/// @param frame Value forwarded as `frame` to `mq3.renderer.md3_cache_index.frameHash`.
/// @param oldFrame Value forwarded as `oldFrame` to `mq3.renderer.md3_cache_index.frameHash`.
/// @param backlerp Value forwarded as `backlerp` to `mq3.renderer.md3_cache_index.frameHash`.
/// @param origin Indexed input read at `component`.
/// @param axis Nested indexed data; outer entries read at `row`.
function transformHash(model,surface,frame,oldFrame,backlerp,origin,axis)
  hash=frameHash(model,surface,frame,oldFrame,backlerp)
  for component=0 to 2 hash=mix(hash,floatKey(origin[component])) end for
  for row=0 to 2 for component=0 to 2 hash=mix(hash,floatKey(axis[row][component])) end for end for
  return hash
end function
/// Computes `index.heads[hash&index.mask]` for `mq3.renderer.md3_cache_index.first`.
/// @param index Record providing `index.heads`, `index.mask`.
/// @param hash Input used in the result expression `index.heads[hash&index.mask]`.
function first(index,hash) return index.heads[hash&index.mask] end function
/// Computes `index.links[slot]` for `mq3.renderer.md3_cache_index.next`.
/// @param index Record providing `index.links`.
/// @param slot Input used in the result expression `index.links[slot]`.
function next(index,slot) return index.links[slot] end function
/// Updates `index.heads[bucket]`, `index.links[previous]`, `index.links[slot]`, `index.hashes[slot]` in `mq3.renderer.md3_cache_index.store`.
/// @param index Mutable record or buffer; this call updates `index.heads[bucket]`, `index.links[previous]`, `index.links[slot]`, `index.hashes[slot]`.
/// @param slot Value assigned to `index.heads[bucket]`.
/// @param hash Input used by `bucket=hash&index.mask`.
function store(index,slot,hash)
  // hashes stores the masked bucket, with -1 meaning never occupied.
  bucket=index.hashes[slot]
  if bucket>=0 then
    previous=-1;current=index.heads[bucket]
    while current>=0
      if current==slot then
        if previous<0 then index.heads[bucket]=index.links[current] else index.links[previous]=index.links[current] end if
        break
      end if
      previous=current;current=index.links[current]
    end while
  end if
  bucket=hash&index.mask;index.links[slot]=index.heads[bucket];index.heads[bucket]=slot;index.hashes[slot]=bucket;return void
end function
