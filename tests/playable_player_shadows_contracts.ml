import mq3.client.playable_player_shadows as shadows
import mq3.collision.world as collision
import mq3.collision.brush as brush

struct TraceContext fraction normal startsolid allsolid calls start finish mins maxs end struct
function fakeTrace(context,startPoint,endPoint,mins,maxs)
  context.calls=context.calls+1;context.start=startPoint;context.finish=endPoint;context.mins=mins;context.maxs=maxs
  value=brush.Trace(context.fraction,context.normal,0.0,0,0,context.startsolid,context.allsolid,0);endpos=[];for axis=0 to 2 endpos=endpos+[startPoint[axis]+context.fraction*(endPoint[axis]-startPoint[axis])] end for;return collision.Result(value,endpos)
end function
function require(ok,text) if not ok then return error(7671,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function
function context(fraction,normal,startsolid,allsolid) return TraceContext(fraction,normal,startsolid,allsolid,0,void,void,void,void) end function
function main(args)
  count=0;ctx=context(0.25,[0.0,0.0,1.0],false,false);shadow=shadows.traceWith(fakeTrace,ctx,[10.0,20.0,100.0],90.0)
  count=count+require(ctx.calls==1 and ctx.finish==[10.0,20.0,-28.0],"shadow traces 128 units down")
  count=count+require(ctx.mins==[-15.0,-15.0,0.0] and ctx.maxs==[15.0,15.0,2.0],"shadow uses Baseq3 trace bounds")
  count=count+require(shadow.origin==[10.0,20.0,68.0] and shadow.radius==24.0 and shadow.orientation==90.0,"shadow keeps hit point radius and legs yaw")
  count=count+require(near(shadow.alpha,0.75) and shadows.color(shadow)==[191,191,191,255],"height fraction fades shadow")
  basis=shadows.axes(shadow);count=count+require(near(basis[0][2],0.0) and near(basis[1][2],0.0),"shadow axes lie on hit plane")
  miss=context(1.0,[0.0,0.0,1.0],false,false);count=count+require(shadows.traceWith(fakeTrace,miss,[0.0,0.0,0.0],0.0)==void,"full-distance trace has no shadow")
  solid=context(0.0,[0.0,0.0,1.0],true,false);count=count+require(shadows.traceWith(fakeTrace,solid,[0.0,0.0,0.0],0.0)==void,"startsolid trace has no shadow")
  allsolid=context(0.0,[0.0,0.0,1.0],false,true);count=count+require(shadows.traceWith(fakeTrace,allsolid,[0.0,0.0,0.0],0.0)==void,"allsolid trace has no shadow")
  badNormal=context(0.5,[0.0,0.0,0.0],false,false);count=count+require(shadows.traceWith(fakeTrace,badNormal,[0.0,0.0,0.0],0.0)==void,"degenerate ground plane is ignored")
  print("PASS: "+str(count)+" playable player-shadow contracts");return 0
end function
