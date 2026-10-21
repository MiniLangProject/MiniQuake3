import mq3.audio.snd_mem_resample as sndmem

function pcm16(values)
  data=bytes(len(values)*2,0)
  for index=0 to len(values)-1 data[index*2]=values[index]&255;data[index*2+1]=(values[index]>>8)&255 end for
  return data
end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function show(label,data)
  text=label+"|"+str(len(data)/2)
  for index=0 to len(data)/2-1 text=text+"|"+str(read16(data,index*2)) end for
  print(text);return void
end function
function run16(label,inputRate,outputRate,values) show(label,sndmem.resampleRaw(pcm16(values),inputRate,2,len(values),outputRate)) end function
function run8(label,inputRate,outputRate,values) show(label,sndmem.resampleRaw(bytes(values),inputRate,1,len(values),outputRate)) end function

function main(args)
  ramp16=[-32768,-20000,-1,0,1,12345,30000,32767];odd16=[17,-29,511,-1025,4097,-8193,16383];ramp8=[0,1,64,127,128,129,192,254,255]
  run16("same16",22050,22050,ramp16);run16("up16",11025,22050,odd16);run16("down16",44100,22050,ramp16);run16("third16",32000,22050,ramp16);run16("fraction16",16000,22050,odd16)
  run8("same8",22050,22050,ramp8);run8("up8",8000,22050,ramp8);run8("down8",48000,22050,ramp8)
  return 0
end function
