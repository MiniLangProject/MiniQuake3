import mq3.platform.input_events as input
struct Clock now end struct
function clock(c) return c.now end function
function main(args)
  c=Clock(1234);q=input.create(c,clock);input.keyEvent(q,0,10,true);input.charEvent(q,77,65)
  a=input.poll(q);b=input.poll(q);print "basic|"+str(a.time)+"|"+str(a.type)+"|"+str(a.value)+"|"+str(a.value2)+"|"+str(b.time)+"|"+str(b.type)+"|"+str(b.value)+"|"+str(b.value2)
  q=input.create(c,clock);for i=0 to 257 input.keyEvent(q,2000+i,i,(i&1)==1) end for
  first=input.poll(q);last=first;while input.queued(q)>0 last=input.poll(q) end while
  print "overflow|"+str(q.head)+"|"+str(q.tail)+"|"+str(q.overflows)+"|"+str(first.time)+"|"+str(first.value)+"|"+str(last.time)+"|"+str(last.value)
  return 0
end function
