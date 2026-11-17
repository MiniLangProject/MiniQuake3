// SPDX-License-Identifier: GPL-2.0-or-later
// Shared wall-clock arithmetic and bounded, honest frame-time reporting.
package mq3.client.frame_timing
import mq3.compat.numeric as numeric

// Exact millisecond buckets through 59,999 ms. The final bucket is explicitly
// reported as a lower bound; an arbitrarily long pause is never called 60 s.
const OVERFLOW_MS=60000
function histogram() return array(OVERFLOW_MS+1,0) end function
function elapsed(started,finished) return (finished-started)&0xffffffff end function
function remaining(started,finished,budget)
  used=elapsed(started,finished)
  if used>=budget then return 0 end if
  return budget-used
end function
function record(bins,milliseconds)
  if milliseconds<0 then return error(7790,"negative frame duration") end if
  bucket=numeric.trunc32(milliseconds)
  if milliseconds>=len(bins)-1 then bucket=len(bins)-1 end if
  bins[bucket]=bins[bucket]+1;return void
end function
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
