// SPDX-License-Identifier: Apache-2.0
// Bounded allocator regressions derived from MiniLang a40d726 memory_fragmentation*.ml.
// QPC timings are observational; payload, GC reuse and live-blocker checks are exact.
extern function allocatorBenchCounter(output as bytes) from "kernel32.dll" symbol "QueryPerformanceCounter" returns i32
extern function allocatorBenchFrequency(output as bytes) from "kernel32.dll" symbol "QueryPerformanceFrequency" returns i32
function allocatorBenchRead64(buffer)
 value=0;for index=0 to 7 value=value|(buffer[index]<<(index*8)) end for;return value
end function
function allocatorBenchTick(buffer) allocatorBenchCounter(buffer);return allocatorBenchRead64(buffer) end function
function allocatorBenchHoles(count,holeSize)
 blockers=array(count,void);holes=array(count,void)
 for index=0 to count-1 holes[index]=bytes(holeSize,index%251);blockers[index]=bytes(8,19) end for
 return blockers
end function
function main(args)
 if len(args)!=1 then return 2 end if
 mode=args[0];count=12000;holeSize=8192;requestSize=4096;requestCount=count
 if mode=="small" then count=20000;holeSize=72;requestSize=40;requestCount=count end if
 if mode=="nofit" then count=20000;holeSize=32;requestSize=8192;requestCount=3000 end if
 if mode=="cursor" then count=4000;requestCount=count end if
 timer=bytes(8,0);allocatorBenchFrequency(timer);perSecond=allocatorBenchRead64(timer)
 blockers=allocatorBenchHoles(count,holeSize);results=array(requestCount,void);gc_collect()
 freeBefore=heap_free_blocks();footprint=heap_bytes_used();started=allocatorBenchTick(timer)
 for index=0 to requestCount-1 results[index]=bytes(requestSize,index%251) end for
 elapsed=allocatorBenchTick(timer)-started
 for index=0 to requestCount-1 if results[index][requestSize-1]!=index%251 then return 3 end if end for
 for index=0 to count-1 if blockers[index][0]!=19 or blockers[index][7]!=19 then return 4 end if end for
 if mode!="nofit" and heap_bytes_used()>footprint+131072 then return error(499,"miss cache prevented reuse after GC") end if
 if mode=="cursor" then
  for round=0 to 3
   for index=0 to count-1 if index%3==round%3 then results[index]=void end if end for
   gc_collect()
   if heap_free_blocks()<0 then return 6 end if
   for index=0 to count-1 if results[index]==void then size=32+((index*997)%9000);results[index]=bytes(size,index%251) end if end for
   for index=0 to count-1 if results[index][len(results[index])-1]!=index%251 or blockers[index][0]!=19 then return 7 end if end for
  end for
 end if
 print "ALLOCATOR_OK mode="+mode+" allocations="+str(requestCount)+" holes="+str(count)+" free_before="+str(freeBefore)+" elapsed_us="+str(elapsed*1000000.0/perSecond)
 return 0
end function
