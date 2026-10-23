import mq3.collision.winding as w
import mq3.compat.numeric as n

function req(ok,label) if not ok then return error(3505,"winding complete: "+label) end if;return 1 end function
function near(a,b) value=a-b;if value<0.0 then value=-value end if;return value<0.001 end function
function main(args)
  count=0
  managed=w.AllocWinding(8);count=count+req(not (managed is error) and managed.capacity==8 and len(managed.points)==0,"managed allocation")
  w.FreeWinding(managed);count=count+req(managed.freed,"managed free")
  count=count+req(try(w.FreeWinding(managed)) is error,"double free guard")
  square=[[-2.0,-2.0,0.0],[2.0,-2.0,0.0],[2.0,2.0,0.0],[-2.0,2.0,0.0]]
  count=count+req(near(w.WindingArea(square),16.0),"area")
  value=w.WindingBounds(square);count=count+req(value[0]==[-2.0,-2.0,0.0] and value[1]==[2.0,2.0,0.0],"bounds")
  count=count+req(w.WindingCenter(square)==[0.0,0.0,0.0],"center")
  plane=w.WindingPlane(square);count=count+req(near(plane[0][2],-1.0) and near(plane[1],0.0),"plane")
  copied=w.CopyWinding(square);copied[0][0]=99.0;count=count+req(w.ReverseWinding(square)[0]==square[3] and square[0][0]==-2.0,"copy and reverse")
  split=w.ClipWindingEpsilon(square,[1.0,0.0,0.0],0.0,0.1);count=count+req(len(split[0])==4 and len(split[1])==4,"front/back clip")
  count=count+req(w.ChopWinding(square,[1.0,0.0,0.0],0.0)==split[0],"chop front")
  count=count+req(w.WindingOnPlaneSide(square,[1.0,0.0,0.0],0.0)==w.SIDE_CROSS,"crossing side")
  count=count+req(w.WindingOnPlaneSide(square,[1.0,0.0,0.0],-3.0)==w.SIDE_FRONT,"front side")
  count=count+req(w.WindingOnPlaneSide(square,[1.0,0.0,0.0],3.0)==w.SIDE_BACK,"back side")
  count=count+req(w.WindingOnPlaneSide(square,[0.0,0.0,1.0],0.0)==w.SIDE_ON,"on side")
  colinear=[[0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0]];clean=w.RemoveColinearPoints(colinear);count=count+req(len(clean)==4 and clean[0]==colinear[0] and clean[1]==colinear[2],"remove colinear")
  base=w.BaseWindingForPlane([0.0,0.0,1.0],2.0);count=count+req(len(base)==4 and base[0][2]==2.0 and base[2][2]==2.0,"base winding")
  count=count+req(w.CheckWinding(base)==true,"valid winding")
  count=count+req(try(w.CheckWinding([[0.0,0.0,0.0],[1.0,0.0,0.0]])) is error,"invalid winding")
  hull=w.AddWindingToConvexHull([[3.0,0.0,0.0]],square,[0.0,0.0,-1.0]);count=count+req(not (hull is error) and len(hull)>=4,"convex hull insertion")
  count=count+req(len(w.pw(square))==4,"print winding surface")
  count=count+req(w.ChopWinding(square,[1.0,0.0,0.0],3.0)==void,"fully clipped winding")
  print("PASS: "+str(count)+" complete winding contracts");return 0
end function
