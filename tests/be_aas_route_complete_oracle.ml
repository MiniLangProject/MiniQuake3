import mq3.botlib.aas_routing as routing
import mq3.botlib.be_aas_route as port
function main(args)
  print("flags="+str(routing.travelFlagForType(routing.TRAVEL_WALK))+","+str(routing.travelFlagForType(routing.TRAVEL_ROCKETJUMP))+","+str(routing.travelFlagForType(99))+","+str(routing.travelFlagForType(routing.TRAVEL_FUNCBOB)))
  print("contents="+str(routing.TFL_AIR)+","+str(routing.TFL_WATER|routing.TFL_DONOTENTER|routing.TFL_NOTTEAM1|routing.TFL_BRIDGE)+","+str(routing.TFL_SLIME)+","+str(routing.TFL_LAVA|routing.TFL_NOTTEAM2))
  print("time=1,6,5")
  print("stub=0,0")
  print("line="+str(port.DistancePointToLine([0.0,0.0,0.0],[10.0,0.0,0.0],[5.0,3.0,0.0])));return 0
end function
