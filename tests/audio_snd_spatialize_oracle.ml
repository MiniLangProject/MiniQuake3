import mq3.audio.snd_spatialize as spatial

function show(label,origin,listener,axis,master,channels)
  value=spatial.spatialize(origin,listener,axis,master,channels);print(label+"|"+str(value.left)+"|"+str(value.right));return void
end function
function main(args)
  listener=[10.0,-20.0,30.0];axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  show("coincident",[10.0,-20.0,30.0],listener,axis,127,2);show("front",[90.0,-20.0,30.0],listener,axis,127,2)
  show("left",[10.0,80.0,30.0],listener,axis,127,2);show("right",[10.0,-120.0,30.0],listener,axis,127,2)
  show("near-left",[10.0,20.0,30.0],listener,axis,90,2);show("far-front",[1340.0,-20.0,30.0],listener,axis,127,2)
  show("beyond",[2010.0,-20.0,30.0],listener,axis,127,2);show("mono",[10.0,180.0,30.0],listener,axis,127,1)
  axis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
  show("yaw90-front",[10.0,180.0,30.0],listener,axis,127,2);show("yaw90-left",[-90.0,-20.0,30.0],listener,axis,127,2)
  show("diagonal",[110.0,80.0,130.0],listener,axis,127,2);show("quiet",[110.0,80.0,30.0],listener,axis,17,2)
  return 0
end function
