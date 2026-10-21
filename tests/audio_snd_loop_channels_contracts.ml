import mq3.audio.snd_loop_channels as loops

function req(ok,message) if not ok then return error(7665,message) end if;return 1 end function
function entry(id,handle,origin,realLoop,doppler,active) return loops.Entry(id,handle,origin,realLoop,doppler,1.25,1.0,active) end function
function main(args)
  count=0;listener=[0.0,0.0,0.0];axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  count=count+req(len(loops.build([],listener,axis))==0,"empty loops")
  group=loops.build([entry(1,1,[0.0,100.0,0.0],false,false,true),entry(2,1,[0.0,-100.0,0.0],false,false,true)],listener,axis)[0]
  count=count+req(group.handle==1 and group.ids==[1,2],"identical effects merged")
  count=count+req(group.left==124 and group.right==124,"opposite positions sum")
  real=loops.build([entry(1,2,[0.0,0.0,0.0],true,false,true)],listener,axis)[0]
  count=count+req(real.left==45 and real.right==45,"real loop uses Baseq3 sphere volume 90")
  normal=loops.build([entry(1,2,[0.0,0.0,0.0],false,false,true)],listener,axis)[0]
  count=count+req(normal.left==63 and normal.right==63,"ordinary loop uses volume 127")
  doppler=loops.build([entry(1,3,[0.0,0.0,0.0],false,false,true),entry(2,3,[0.0,0.0,0.0],false,true,true)],listener,axis)
  count=count+req(len(doppler)==2,"doppler secondary is not merged")
  count=count+req(doppler[0].ids==[1] and doppler[1].ids==[2],"doppler group identity")
  primaryDoppler=loops.build([entry(1,3,[0.0,0.0,0.0],false,true,true),entry(2,3,[0.0,0.0,0.0],false,false,true)],listener,axis)
  count=count+req(len(primaryDoppler)==1 and primaryDoppler[0].ids==[1,2],"Baseq3 merges nondoppler secondary into doppler primary")
  capped=loops.build([entry(1,4,[0.0,80.0,0.0],false,false,true),entry(2,4,[0.0,80.0,0.0],false,false,true),entry(3,4,[0.0,80.0,0.0],false,false,true)],listener,axis)[0]
  count=count+req(capped.left==255 and capped.right==0,"summed channel volume capped at 255")
  count=count+req(len(loops.build([entry(1,5,[2000.0,0.0,0.0],false,false,true)],listener,axis))==0,"inaudible group omitted")
  count=count+req(len(loops.build([entry(1,5,[0.0,0.0,0.0],false,false,false)],listener,axis))==0,"inactive loop omitted")
  separate=loops.build([entry(1,6,[0.0,0.0,0.0],false,false,true),entry(2,7,[0.0,0.0,0.0],false,false,true)],listener,axis)
  count=count+req(len(separate)==2 and separate[0].handle==6 and separate[1].handle==7,"different effects remain separate")
  entries=[];for i=0 to 99 entries=entries+[entry(i,10+i,[0.0,0.0,0.0],false,false,true)] end for
  count=count+req(len(loops.build(entries,listener,axis))==96,"loop channel limit")
  count=count+req(try(loops.build([entry(1,1,[0.0,0.0],false,false,true)],listener,axis)) is error,"invalid origin rejected")
  count=count+req(try(loops.build([entry(1,1,[0.0,0.0,0.0],false,false,true)],listener,[[1.0,0.0,0.0]])) is error,"invalid listener axis rejected")
  mixed=loops.build([entry(1,8,[0.0,0.0,0.0],false,false,true),entry(2,8,[0.0,0.0,0.0],true,false,true)],listener,axis)[0]
  count=count+req(mixed.left==108 and mixed.right==108,"ordinary and real volumes accumulate")
  count=count+req(mixed.primary==1,"first entity owns merged channel")
  print("PASS: "+str(count)+" snd loop-channel contracts");return 0
end function
