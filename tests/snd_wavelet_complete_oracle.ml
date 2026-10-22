import mq3.audio.snd_wavelet_runtime as wave
function main(args)
  for each value in [-32768,-30000,-1000,-1,0,1,1000,30000,32767] print(str(value)+" "+str(wave.MuLawEncode(value))) end for
  return 0
end function
