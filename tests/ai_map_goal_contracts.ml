import mq3.botlib.ai_map_goals as mapGoals
import mq3.botlib.ai_map_goal_syscalls as traps
import mq3.botlib.aas_runtime as aasRuntime
import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7599,"AI map goals: "+label) end if;return 1 end function
function entity(values) return values end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function put(vm,address,value) data=bytes(value);copyBytes(vm.data,address,data,0,len(data));vm.data[address+len(data)]=0;return void end function
function vector(data,address) return [n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))] end function
function sentinels(data,address) n.writeU32(data,address+44,111);n.writeU32(data,address+48,222);n.writeU32(data,address+52,333);return void end function
function main(args)
  if len(args)!=1 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));runtime=aasRuntime.create(map);state=mapGoals.create()
  entities=[[],entity([["classname","target_location"],["message","Hall"],["origin","10 20 30"]]),entity([["classname","info_camp"],["message","Alpha"],["origin","1 2 3"],["range","128"],["weight","2.5"]]),entity([["classname","target_location"],["message","Hall"],["origin","40 50 60"]]),entity([["classname","info_camp"],["message","Beta"],["origin","4 5 6"],["wait","7"],["random","8"]]),entity([["classname","other"],["origin","9 9 9"]])]
  counts=mapGoals.initialize(state,runtime,entities);checks=0;checks=checks+require(counts==[2,2] and state.locations[0].name=="Hall" and state.campSpots[0].name=="Beta","info entities insert at list head")
  location=mapGoals.mapLocationGoal(state,"hALL");checks=checks+require(location!=void and location.origin==[40.0,50.0,60.0] and location.areaNum==1 and location.mins==[-8.0,-8.0,-8.0] and location.maxs==[8.0,8.0,8.0],"map location case-insensitive goal")
  checks=checks+require(mapGoals.mapLocationGoal(state,"missing")==void,"unknown map location")
  first=mapGoals.nextCampSpotGoal(state,-4);second=mapGoals.nextCampSpotGoal(state,1);checks=checks+require(first.next==1 and first.goal.origin==[4.0,5.0,6.0] and second.next==2 and second.goal.origin==[1.0,2.0,3.0],"camp cursor and negative normalization")
  checks=checks+require(mapGoals.nextCampSpotGoal(state,2).next==0,"camp cursor exhaustion")

  vm=Machine(bytes(1024,0),1023);base=900;sentinels(vm.data,200);arg(vm,base,1,0);arg(vm,base,2,200);checks=checks+require(traps.dispatch(state,vm,base,mapGoals.OP_GET_NEXT_CAMP_SPOT_GOAL)==1 and vector(vm.data,200)==[4.0,5.0,6.0] and n.readI32(vm.data,212)==1,"op567 cursor and goal ABI")
  checks=checks+require(n.readI32(vm.data,244)==111 and n.readI32(vm.data,248)==222 and n.readI32(vm.data,252)==333,"op567 preserves unspecified goal fields")
  put(vm,100,"HALL");sentinels(vm.data,300);arg(vm,base,1,100);arg(vm,base,2,300);checks=checks+require(traps.dispatch(state,vm,base,mapGoals.OP_GET_MAP_LOCATION_GOAL)==1 and vector(vm.data,300)==[40.0,50.0,60.0] and n.readI32(vm.data,344)==111,"op568 string and partial goal ABI")
  put(vm,100,"missing");n.writeU32(vm.data,300,0x12345678);checks=checks+require(traps.dispatch(state,vm,base,mapGoals.OP_GET_MAP_LOCATION_GOAL)==0 and n.readU32(vm.data,300)==0x12345678,"failed op568 leaves output untouched")
  mapGoals.clear(state);checks=checks+require(not state.initialized and len(state.locations)==0 and len(state.campSpots)==0,"map reset clears info entities")
  print("PASS: "+str(checks)+" AI map-goal contracts");return 0
end function
