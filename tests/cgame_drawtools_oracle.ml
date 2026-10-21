import mq3.client.cgame_drawtools as draw
import mq3.compat.numeric as n
function bits(value) return str(n.u32(n.floatBits(value))) end function
function four(name,value) print(name+"|"+bits(value[0])+"|"+bits(value[1])+"|"+bits(value[2])+"|"+bits(value[3]));return void end function
function boolean(value) if value then return "1" end if;return "0" end function
function main(args)
  s=draw.create();s.screenXScale=1.5;s.screenYScale=2.0;four("adjust",draw.adjustFrom640(s,3.25,-2.0,10.0,11.5))
  print("strlen|"+str(draw.drawStrlen("A^1B^^C"))+"|"+str(draw.drawStrlen("^7hello"))+"|"+str(draw.drawStrlen("plain")))
  s.time=1000;four("fade-active",draw.fadeColor(s,850,300));print("fade-null|"+boolean(draw.fadeColor(s,0,300)==void)+"|"+boolean(draw.fadeColor(s,700,300)==void))
  four("team-red",draw.teamColor(draw.TEAM_RED));four("team-blue",draw.teamColor(draw.TEAM_BLUE));four("team-spec",draw.teamColor(draw.TEAM_SPECTATOR));four("team-other",draw.teamColor(99))
  four("health-dead",draw.getColorForHealth(0,100));four("health-low",draw.getColorForHealth(20,0));four("health-mid",draw.getColorForHealth(50,0));four("health-66",draw.getColorForHealth(66,0));four("health-armor",draw.getColorForHealth(40,100));four("health-full",draw.getColorForHealth(100,0))
  print("scale|"+bits(draw.proportionalSizeScale(0))+"|"+bits(draw.proportionalSizeScale(draw.UI_SMALLFONT)));return 0
end function
