import mq3.audio.snd_loop_channels as loops

function entry(id,handle,x,y,z,realLoop,doppler) return loops.Entry(id,handle,[x,y,z],realLoop,doppler,1.25,1.0,true) end function
function show(label,entries)
  axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];groups=loops.build(entries,[0.0,0.0,0.0],axis);text=label+"|"+str(len(groups));for each group in groups text=text+"|"+str(group.handle)+"|"+str(group.left)+"|"+str(group.right) end for;print(text);return void
end function
function main(args)
  show("merge",[entry(1,1,0.0,100.0,0.0,false,false),entry(2,1,0.0,-100.0,0.0,false,false)])
  show("real",[entry(1,2,0.0,0.0,0.0,true,false),entry(2,2,0.0,0.0,0.0,true,false)])
  show("doppler",[entry(1,3,0.0,100.0,0.0,false,false),entry(2,3,0.0,-100.0,0.0,false,true),entry(3,3,0.0,0.0,0.0,false,false)])
  entries=[];for i=0 to 3 entries=entries+[entry(i,4,0.0,80.0,0.0,false,false)] end for;show("cap",entries)
  show("inaudible",[entry(1,5,2000.0,0.0,0.0,false,false)])
  entries=[];for i=0 to 99 entries=entries+[entry(i,10+i,0.0,0.0,0.0,false,false)] end for;show("channel-limit",entries)
  return 0
end function
