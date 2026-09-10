import mq3.renderer.draw_surfs as draw

function require(ok,text) if not ok then return error(7350,text) end if;return 1 end function
function surfaces(keys)
  result=[];for i=0 to len(keys)-1 result=result+[draw.DrawSurf(keys[i],i,i)] end for;return result
end function

function main(args)
  c=0
  c=c+require(draw.MAX_SHADERS==16384 and draw.MAX_DRAWSURFS==65536,"Baseq3 limits")
  c=c+require(draw.QSORT_SHADERNUM_SHIFT==17 and draw.QSORT_ENTITYNUM_SHIFT==7 and draw.QSORT_FOGNUM_SHIFT==2,"sort shifts")
  c=c+require(draw.pack(0,0,0,0)==0,"zero key")
  c=c+require(draw.pack(1,2,3,1)==131341,"mixed key")
  c=c+require(draw.pack(16383,1023,31,3)==2147483647,"maximum key")
  f=draw.decompose(2147483647)
  c=c+require(f.shaderIndex==16383 and f.entityNum==1023 and f.fogNum==31 and f.dlightMap==3,"maximum decomposition")
  f=draw.decompose(draw.pack(511,513,17,2))
  c=c+require(f.shaderIndex==511 and f.entityNum==513 and f.fogNum==17 and f.dlightMap==2,"round trip")
  c=c+require(try(draw.pack(-1,0,0,0)) is error,"negative shader rejected")
  c=c+require(try(draw.pack(16384,0,0,0)) is error,"large shader rejected")
  c=c+require(try(draw.pack(0,-1,0,0)) is error,"negative entity rejected")
  c=c+require(try(draw.pack(0,1024,0,0)) is error,"large entity rejected")
  c=c+require(try(draw.pack(0,0,-1,0)) is error,"negative fog rejected")
  c=c+require(try(draw.pack(0,0,32,0)) is error,"large fog rejected")
  c=c+require(try(draw.pack(0,0,0,-1)) is error,"negative dlight rejected")
  c=c+require(try(draw.pack(0,0,0,4)) is error,"large dlight rejected")
  c=c+require(try(draw.create(0)) is error,"zero capacity rejected")
  c=c+require(try(draw.create(3)) is error,"non-power-of-two capacity rejected")
  c=c+require(try(draw.create(131072)) is error,"oversized capacity rejected")
  q=draw.create(4)
  c=c+require(draw.add(q,"a",2,3,4,1)==0 and draw.add(q,"b",1,2,3,0)==1,"admission indexes")
  c=c+require(q.numDrawSurfs==2 and draw.count(q)==2 and q.nextOrdinal==2,"admission counters")
  c=c+require(draw.values(q)[0].surface=="a" and draw.values(q)[1].surface=="b","admission values")
  draw.add(q,"c",0,0,0,0);draw.add(q,"d",0,0,0,1);draw.add(q,"e",0,0,0,2)
  c=c+require(q.numDrawSurfs==5 and draw.count(q)==4,"ring count clamps")
  c=c+require(draw.values(q)[0].surface=="e" and draw.values(q)[1].surface=="b","ring wraps with masked index")
  c=c+require(draw.values(q)[0].ordinal==4 and draw.values(q)[3].ordinal==3,"submission ordinal retained")
  ordered=draw.sortStable(surfaces([9,1,8,2,7,3,6,4,5,0]))
  good=true;for i=0 to 9 if ordered[i].sort!=i then good=false end if end for
  c=c+require(good,"more-than-cutoff ordering")
  tied=draw.sortStable(surfaces([5,2,5,1,5,2]))
  c=c+require(tied[0].surface==3 and tied[1].surface==1 and tied[2].surface==5,"ascending groups")
  c=c+require(tied[3].surface==0 and tied[4].surface==2 and tied[5].surface==4,"stable equal-key order")
  empty=draw.sortStable([]);c=c+require(len(empty)==0,"empty ordering")
  one=draw.sortStable(surfaces([7]));c=c+require(len(one)==1 and one[0].surface==0,"single ordering")
  c=c+require(try(draw.sortStable([void])) is error,"empty surface rejected")
  sorted=draw.sortQueue(q);good=true
  for i=1 to len(sorted)-1 if sorted[i-1].sort>sorted[i].sort then good=false end if end for
  c=c+require(good,"queue sorted")
  c=c+require(q.drawSurfs[0]==sorted[0] and q.drawSurfs[3]==sorted[3],"queue stores ordering")
  c=c+require(try(draw.values(void)) is error,"missing value queue rejected")
  c=c+require(try(draw.add(void,0,0,0,0,0)) is error,"missing admission queue rejected")
  print("PASS: "+str(c)+" draw-surface contracts");return 0
end function
