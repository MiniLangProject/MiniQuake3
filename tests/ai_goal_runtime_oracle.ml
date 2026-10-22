import mq3.botlib.ai_goal_runtime as runtime
import mq3.botlib.ai_resource_pools as pools
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  goal=pools.Goal([10.0,20.0,30.0],1,[-2.0,-3.0,-4.0],[2.0,3.0,4.0],0,7,0,0)
  print("TOUCH "+str(bit(runtime.botTouchingGoal([10.0,20.0,30.0],goal)))+" "+str(bit(runtime.botTouchingGoal([-7.0,20.0,30.0],goal)))+" "+str(bit(runtime.botTouchingGoal([27.0,20.0,30.0],goal)))+" "+str(bit(runtime.botTouchingGoal([10.0,0.0,30.0],goal)))+" "+str(bit(runtime.botTouchingGoal([10.0,20.0,60.0],goal))))
  return 0
end function
