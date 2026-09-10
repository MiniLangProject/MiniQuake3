import mq3.audio.mixer_transfer as mixer

function show(label,data)
  line=label;for each value in data line=line+"|"+str(value) end for;print(line)
end function
function output(size,value) return array(size,value) end function
function samples()
  return [-8388864,-8388608,-65536,-256,0,255,256,65536,8388352,8388608,16777216,-16777216]
end function
function main(args)
  p=samples()
  show("s16-stereo-linear",mixer.transfer(p,0,6,16,2,16,output(16,1234)))
  show("s16-stereo-wrap",mixer.transfer(p,3,9,16,2,16,output(16,1234)))
  show("s16-mono-wrap",mixer.transfer(p,6,12,16,1,8,output(8,1234)))
  show("u8-stereo-linear",mixer.transfer(p,0,6,8,2,16,output(16,17)))
  show("u8-stereo-wrap",mixer.transfer(p,3,9,8,2,16,output(16,17)))
  show("u8-mono-wrap",mixer.transfer(p,6,12,8,1,8,output(8,17)))
  show("empty",mixer.transfer([],4,4,16,2,8,output(8,-7)))
  return 0
end function
