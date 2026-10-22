import mq3.audio.snd_adpcm_runtime as adpcm
function runCase(name,samples,sample,index)
  state=adpcm.State(sample,index);value=adpcm.S_AdpcmEncode(samples,state);line=name+" "+str(state.sample)+" "+str(state.index)
  for each byte in value.data line=line+" "+str(byte) end for
  print(line);return void
end function
function main(args)
  runCase("zero",[0,1000,-1000,3000,-3000,32767,-32768,1234,-4567],0,0)
  runCase("edge",[32767,32767,0,-32768,-1,1,12000,-12000],-1234,44)
  runCase("odd",[100,101,99,98,102],100,5)
  return 0
end function
