import mq3.audio.snd_loop_doppler as doppler
import mq3.compat.numeric as n

function show(name,value) active=0;if value.active then active=1 end if;print(name+" "+str(active)+" "+str(n.floatBits(value.scale))+" "+str(n.floatBits(value.oldScale)));return void end function
function main(args)
  listener=[0.0,0.0,0.0];origin=[10.0,0.0,0.0];fast=[100.0,0.0,0.0]
  first=doppler.update(listener,origin,fast,1.0,false,true);show("first",first)
  consecutive=doppler.update(listener,origin,fast,first.scale,true,true);show("consecutive",consecutive)
  gap=doppler.update(listener,origin,fast,consecutive.scale,false,true);show("gap",gap)
  show("slow",doppler.update(listener,origin,[1.0,0.0,0.0],1.0,false,true))
  show("stationary",doppler.update(listener,origin,[0.0,0.0,0.0],1.0,false,true));return 0
end function
