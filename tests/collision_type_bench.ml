// Isolated timing workload for the two collision helpers called from the
// productive QVM host. Run identical source against untyped and typed builds.
import mq3.collision.brush as brush
import mq3.collision.visibility as visibility

function main(args)
  if len(args)!=1 then return error(3503,"usage: collision_type_bench <pvs|brush>") end if
  count=50000000
  if args[0]=="pvs" then
    state=visibility.Visibility([],[],2,0,1,bytes([1,2]),true,[],[],false)
    hits=0
    for index=0 to count-1
      if visibility.clusterVisible(state,index&1,(index>>1)&1) then hits=hits+1 end if
    end for
    print "pvs "+str(hits)
  else if args[0]=="brush" then
    normal=[1.0,-2.0,0.5];mins=[-1.0,-2.0,-3.0];maxs=[4.0,5.0,6.0];total=0.0
    for index=0 to count-1
      total=total+brush.boxSupportDot(normal,mins,maxs)
    end for
    print "brush "+str(total)
  else return error(3503,"unknown collision benchmark") end if
  return 0
end function
