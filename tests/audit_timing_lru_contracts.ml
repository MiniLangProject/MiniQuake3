// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.frame_timing as timing
import mq3.botlib.cache_lru as lru
function require(ok,label) if not ok then return error(7792,label) end if;return 1 end function
function main(args)
  checks=0;bins=timing.histogram()
  checks=checks+require(timing.percentile(bins,0,95)=="0","empty percentile")
  for index=1 to 90 timing.record(bins,150) end for
  for index=1 to 10 timing.record(bins,5000) end for
  checks=checks+require(timing.percentile(bins,100,50)=="150","normal median")
  checks=checks+require(timing.percentile(bins,100,95)=="5000","long stalls do not saturate at 1000ms")
  checks=checks+require(timing.percentile(bins,100,99)=="5000","exact long-tail percentile")
  for index=1 to 100 timing.record(bins,120000) end for
  checks=checks+require(timing.percentile(bins,200,95)==">=60000","explicit overflow lower bound")
  checks=checks+require(timing.remaining(100,110,16)==6 and timing.remaining(100,140,16)==0,"sleep only remaining frame budget")
  checks=checks+require(timing.elapsed(2147483640,-2147483640)==16,"signed native timer wrap")
  checks=checks+require(timing.elapsed(4294967290,10)==16,"unsigned timer wrap")
  state=lru.create(2)
  checks=checks+require(lru.reserve(state,"a")==0 and lru.reserve(state,"b")==1,"stable initial slots")
  checks=checks+require(lru.touch(state,"a")==0 and state.oldest==1,"hit promotes entry")
  checks=checks+require(lru.reserve(state,"c")==1 and lru.touch(state,"b")==-1,"evict least recent entry")
  checks=checks+require(lru.reserve(state,"d")==0 and lru.touch(state,"a")==-1,"second eviction")
  checks=checks+require(lru.reserve(state,"c")==1 and state.count==2,"reserve existing key does not allocate")
  lru.clear(state)
  checks=checks+require(state.count==0 and state.oldest==-1 and state.newest==-1 and lru.touch(state,"c")==-1,"reset clears indices")
  checks=checks+require(lru.reserve(state,"e")==0,"reuse cleared slot")
  one=lru.create(1);lru.reserve(one,"a");lru.reserve(one,"b")
  checks=checks+require(one.oldest==0 and one.newest==0 and lru.touch(one,"a")==-1 and lru.touch(one,"b")==0,"single-entry LRU")
  print("PASS: "+str(checks)+" audit timing/LRU contracts");return 0
end function
