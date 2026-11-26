// SPDX-License-Identifier: GPL-2.0-or-later
// Shared wall-clock arithmetic and bounded, honest frame-time reporting.
package mq3.client.frame_timing
import mq3.compat.numeric as numeric

// Exact millisecond buckets through 59,999 ms. The final bucket is explicitly
// reported as a lower bound; an arbitrarily long pause is never called 60 s.
const OVERFLOW_MS=60000
/// Creates an array from `OVERFLOW_MS+1, 0` for frame timing `histogram`.
function histogram() return array(OVERFLOW_MS+1,0) end function
/// Computes `(finished-started)&0xffffffff` for frame timing `elapsed`.
/// @param started Value used by `return (finished-started)&0xffffffff`.
/// @param finished Value used by `return (finished-started)&0xffffffff`.
function elapsed(started,finished) return (finished-started)&0xffffffff end function
/// Calls `mq3.client.frame_timing.elapsed` from frame timing `remaining`. The final path returns `budget-used`.
/// @param started Value used by `used=elapsed(started,finished)`.
/// @param finished Value used by `used=elapsed(started,finished)`.
/// @param budget Value used by `if used>=budget then return 0 end if`.
function remaining(started,finished,budget)
  used=elapsed(started,finished)
  if used>=budget then return 0 end if
  return budget-used
end function
/// Updates `bins[bucket]` during frame timing `record`.
/// @param bins Mutable sequence; this routine writes `bins[bucket]`.
/// @param milliseconds Time interval in milliseconds.
function record(bins,milliseconds)
  if milliseconds<0 then return error(7790,"negative frame duration") end if
  bucket=numeric.trunc32(milliseconds)
  if milliseconds>=len(bins)-1 then bucket=len(bins)-1 end if
  bins[bucket]=bins[bucket]+1;return void
end function
/// Calls `mq3.compat.numeric.trunc32` from frame timing `percentile`.
/// @param bins Sequence read at `bins[index]`.
/// @param count Value tested by `count<1` before the calculation continues.
/// @param percent Value used by `if percent<1 or percent>100 then return error(7790,"invalid frame percentile") end if`.
function percentile(bins,count,percent)
  if count<1 then return "0" end if
  if percent<1 or percent>100 then return error(7790,"invalid frame percentile") end if
  wanted=numeric.trunc32((count*percent+99)/100);seen=0
  for index=0 to len(bins)-1
    seen=seen+bins[index]
    if seen>=wanted then
      if index==len(bins)-1 then return ">="+str(index) end if
      return str(index)
    end if
  end for
  return error(7790,"frame histogram count mismatch")
end function
