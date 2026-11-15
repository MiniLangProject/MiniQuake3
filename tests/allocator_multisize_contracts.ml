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
 mode=args[0];count=16000;holeSize=80;sizeKinds=2;withTiny=false;large=false
 if mode=="four" then sizeKinds=4 end if
 if mode=="sixteen" then sizeKinds=16;holeSize=512 end if
 if mode=="seventeen" then sizeKinds=17;holeSize=512 end if
 if mode=="tiny" then withTiny=true end if
 if mode=="large" or mode=="large-tiny" then count=4000;holeSize=60000;large=true end if
 if mode=="large-tiny" then withTiny=true end if
 timer=bytes(8,0);allocatorBenchFrequency(timer);perSecond=allocatorBenchRead64(timer)
 blockers=allocatorBenchHoles(count,holeSize);results=array(count,void);tiny=array(count,void);gc_collect()
 freeBefore=heap_free_blocks();footprint=heap_bytes_used();started=allocatorBenchTick(timer)
 for index=0 to count-1
  size=40+8*(index%sizeKinds)
  if large then size=8192;phase=index%3;if phase==1 then size=32768 else if phase==2 then size=53776 end if end if
  results[index]=bytes(size,index%251)
  if withTiny then tiny[index]=bytes(8,index%251) end if
 end for
 elapsed=allocatorBenchTick(timer)-started
 for index=0 to count-1
  if results[index][0]!=index%251 or results[index][len(results[index])-1]!=index%251 then return 3 end if
  if withTiny then if len(tiny[index])!=8 or tiny[index][0]!=index%251 or tiny[index][7]!=index%251 then return 4 end if end if
  if blockers[index][0]!=19 or blockers[index][7]!=19 then return 5 end if
 end for
 if heap_bytes_used()>footprint+131072 then return error(499,"multisize hints prevented free-list reuse") end if
 print "ALLOCATOR_MATRIX_OK mode="+mode+" allocations="+str(count)+" holes="+str(count)+" tiny="+str(withTiny)+" free_before="+str(freeBefore)+" elapsed_us="+str(elapsed*1000000.0/perSecond)
 return 0
end function
