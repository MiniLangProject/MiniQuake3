// SPDX-License-Identifier: GPL-2.0-or-later
// Fixed storage hash chains over an existing FIFO cache ring. Hash collisions
// are resolved by the caller's complete key comparison, never by hash alone.
package mq3.renderer.md3_cache_index
import mq3.compat.numeric as md3IndexNumeric
struct Index heads links hashes mask end struct
function create(capacity)
  buckets=1;while buckets<capacity*2 buckets=buckets*2 end while
  return Index(array(buckets,-1),array(capacity,-1),array(capacity,-1),buckets-1)
end function
function mix(hash,value)
  mixed=md3IndexNumeric.i32((hash^value)*16777619)
  // Fold high bits into bucket bits: integer-valued binary32 coordinates
  // often have zero low mantissa bits and otherwise collapse into one chain.
  return mixed^(mixed>>16)
end function
function floatKey(value) if value==0 then return 0 end if;return md3IndexNumeric.floatBits(value) end function
function frameHash(model,surface,frame,oldFrame,backlerp)
  hash=mix(2166136261,model);hash=mix(hash,surface);hash=mix(hash,frame);hash=mix(hash,oldFrame);return mix(hash,floatKey(backlerp))
end function
function transformHash(model,surface,frame,oldFrame,backlerp,origin,axis)
  hash=frameHash(model,surface,frame,oldFrame,backlerp)
  for component=0 to 2 hash=mix(hash,floatKey(origin[component])) end for
  for row=0 to 2 for component=0 to 2 hash=mix(hash,floatKey(axis[row][component])) end for end for
  return hash
end function
function first(index,hash) return index.heads[hash&index.mask] end function
function next(index,slot) return index.links[slot] end function
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
