import mq3.audio.snd_spatialize as spatial

function req(ok,message) if not ok then return error(7663,message) end if;return 1 end function
function close(a,b) value=a-b;if value<0.0 then value=0.0-value end if;return value<0.0001 end function

function main(args)
  count=0;listener=[0.0,0.0,0.0];axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  center=spatial.spatialize(listener,listener,axis,127,2)
  count=count+req(center.left==63 and center.right==63,"coincident stereo integer split")
  count=count+req(center.distance==0.0 and center.attenuation==1.0,"coincident distance")
  left=spatial.spatialize([0.0,100.0,0.0],listener,axis,127,2)
  count=count+req(left.left==124 and left.right==0,"Baseq3 axis[1] points to listener left")
  count=count+req(close(left.attenuation,0.984),"distance attenuation after full-volume radius")
  right=spatial.spatialize([0.0,-100.0,0.0],listener,axis,127,2)
  count=count+req(right.left==0 and right.right==124,"right pan")
  front=spatial.spatialize([100.0,0.0,0.0],listener,axis,127,2)
  count=count+req(front.left==62 and front.right==62,"front centered with integer truncation")
  near=spatial.spatialize([80.0,0.0,0.0],listener,axis,90,2)
  count=count+req(near.left==45 and near.right==45,"full-volume radius inclusive")
  far=spatial.spatialize([1330.0,0.0,0.0],listener,axis,127,2)
  count=count+req(far.left==0 and far.right==0,"attenuation reaches silence")
  beyond=spatial.spatialize([2000.0,0.0,0.0],listener,axis,127,2)
  count=count+req(beyond.left==0 and beyond.right==0 and beyond.attenuation==0.0,"negative distant volumes clamp")
  mono=spatial.spatialize([0.0,100.0,0.0],listener,axis,127,1)
  count=count+req(mono.left==124 and mono.right==124,"mono disables stereo separation but retains distance")
  quiet=spatial.spatialize([0.0,0.0,0.0],listener,axis,0,2)
  count=count+req(quiet.left==0 and quiet.right==0,"zero master volume")
  gains=spatial.gains([0.0,100.0,0.0],listener,axis,127)
  count=count+req(close(gains[0],124.0/127.0) and gains[1]==0.0,"normalized mixer gains retain integer channel volume")
  zeroGains=spatial.gains(listener,listener,axis,0)
  count=count+req(zeroGains[0]==0.0 and zeroGains[1]==0.0,"zero-volume gains avoid division")
  yaw=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
  rotated=spatial.spatialize([-100.0,0.0,0.0],listener,yaw,127,2)
  count=count+req(rotated.left==124 and rotated.right==0,"listener axis rotates stereo field")
  count=count+req(try(spatial.spatialize([0.0,0.0],listener,axis,127,2)) is error,"short origin rejected")
  count=count+req(try(spatial.spatialize(listener,listener,[[1.0,0.0,0.0]],127,2)) is error,"short axis rejected")
  count=count+req(try(spatial.spatialize(listener,listener,axis,-1,2)) is error,"negative master rejected")
  count=count+req(try(spatial.spatialize(listener,listener,axis,256,2)) is error,"large master rejected")
  count=count+req(try(spatial.spatialize(listener,listener,axis,127,3)) is error,"unsupported channel count rejected")
  print("PASS: "+str(count)+" snd spatialize contracts");return 0
end function
