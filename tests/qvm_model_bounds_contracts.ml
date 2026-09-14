import mq3.format.md3 as md3
import mq3.renderer.model_bounds as bounds

function require(condition,message)
  if not condition then return error(9910,message) end if
  return true
end function

function main(args)
  first=md3.Frame([-1.0,-2.0,-3.0],[4.0,5.0,6.0],[0.0,0.0,0.0],8.0,"first")
  second=md3.Frame([-100.0,-200.0,-300.0],[400.0,500.0,600.0],[0.0,0.0,0.0],800.0,"second")
  model=md3.Model("animated.md3",0,2,0,0,0,[first,second],[[],[]],[],[second.mins,second.maxs])
  selected=bounds.md3(model);if selected is error then return selected end if
  check=require(selected[0]==[-1.0,-2.0,-3.0] and selected[1]==[4.0,5.0,6.0],"R_ModelBounds must use MD3 frame zero");if check is error then return check end if
  selected[0][0]=77.0;check=require(first.mins[0]==-1.0,"R_ModelBounds must return copied vectors");if check is error then return check end if
  empty=md3.Model("empty.md3",0,0,0,0,0,[],[],[],[[1.0,1.0,1.0],[2.0,2.0,2.0]])
  check=require(bounds.md3(empty)==[[0.0,0.0,0.0],[0.0,0.0,0.0]],"missing frames must return zero bounds");if check is error then return check end if
  malformed=md3.Model("bad.md3",0,1,0,0,0,[md3.Frame([1.0],[2.0,3.0,4.0],[0.0,0.0,0.0],1.0,"bad")],[[]],[],[[0.0,0.0,0.0],[0.0,0.0,0.0]])
  check=require(try(bounds.md3(malformed)) is error,"malformed frame bounds must be rejected");if check is error then return check end if
  print("PASS qvm model bounds contracts 4")
  return 0
end function
