import mq3.client.ui_servers2 as u

function signum(value)
  if value<0 then return -1 end if
  if value>0 then return 1 end if
  return 0
end function

function main(args)
  print("max|50|"+str(u.arenaServersMaxPing(50)))
  print("max|250|"+str(u.arenaServersMaxPing(250)))
  print("max|150.9|"+str(u.arenaServersMaxPing(150.9)))
  left=u.node("","Alpha","Arena",7,8,50,3,"",0,0,0,false)
  right=u.node("","Bravo","Bravo",2,8,100,1,"",0,0,0,false)
  for key=0 to 4 print("compare|"+str(key)+"|"+str(signum(u.arenaServersCompare(left,right,key)))) end for
  right.pingTime=50
  print("ping-tie|"+str(signum(u.arenaServersCompare(left,right,u.SORT_PING))))
  return 0
end function
