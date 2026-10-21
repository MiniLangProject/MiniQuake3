import mq3.client.cgame_players as p
import mq3.compat.numeric as n
function main(args)
  for each value in ["0","1","2","3","4","5","6","7","8"] color=p.colorFromString(value);print("color|"+value+"|"+str(n.trunc32(color[0]))+"|"+str(n.trunc32(color[1]))+"|"+str(n.trunc32(color[2]))) end for
  for each row in [[90.0,0.0,1],[10.0,0.0,0],[350.0,10.0,1]] result=p.swingAngles(16,row[0],25.0,90.0,0.3,row[1],row[2]!=0);print("swing|"+str(n.trunc32(result[0]*1000.0))+"|"+str(result[1])) end for
  return 0
end function
