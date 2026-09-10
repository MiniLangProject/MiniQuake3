import mq3.audio.channel_paint as channel

function samples()
  result=array(2048,0)
  for i=0 to 1023
    result[i]=((i*97+13)%65536)-32768
    result[1024+i]=((i*193+71)%65536)-32768
  end for
  return result
end function
function buffer()
  result=array(8192,0)
  for i=0 to 4095 result[i*2]=100+i*3;result[i*2+1]=-200-i*5 end for
  return result
end function
function show(label,data,offset,count)
  line=label
  for i=offset to offset+count-1 line=line+"|"+str(data[i*2])+"|"+str(data[i*2+1]) end for
  print(line)
end function
function run(label,count,sampleOffset,bufferOffset,left,right,volume,doppler,scale,oldScale)
  data=channel.paint16(samples(),count,sampleOffset,bufferOffset,left,right,volume,doppler,scale,oldScale,buffer())
  show(label,data,bufferOffset,count)
end function
function main(args)
  run("linear",6,0,2,255,128,255,false,1.0,1.0)
  run("chunk-cross",7,1021,0,200,75,128,false,1.0,1.0)
  run("initial-wrap",5,2050,1,64,192,255,false,1.0,1.0)
  run("silent-left",4,77,3,0,255,200,false,1.0,1.0)
  run("doppler-one",5,1019,0,180,90,220,true,1.0,1.25)
  run("doppler-fast",8,1018,2,210,111,240,true,1.5,1.0)
  run("doppler-old",6,20,0,155,233,199,true,0.75,1.5)
  return 0
end function
