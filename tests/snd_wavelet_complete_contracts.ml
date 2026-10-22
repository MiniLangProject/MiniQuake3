import mq3.audio.snd_wavelet_runtime as wave

function req(ok,message) if not ok then return error(7671,message) end if;return 1 end function
function main(args)
  checks=0
  encodedZero=wave.MuLawEncode(0);decodedZero=wave.MuLawDecode(encodedZero);checks=checks+req(decodedZero>=(-4) and decodedZero<=4,"MuLaw zero")
  checks=checks+req(wave.MuLawEncode(1000)!=wave.MuLawEncode(-1000) and wave.MuLawDecode(wave.MuLawEncode(1000))>0,"MuLaw sign")
  values=[1.0,2.0,3.0,4.0];original=values+[];wave.daub4(values,4,1);wave.daub4(values,4,-1)
  checks=checks+req(values[0]>0.99 and values[0]<1.01 and values[3]>3.99 and values[3]<4.01,"daub4 roundtrip")
  values=[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0];wave.wt1(values,8,1);wave.wt1(values,8,-1)
  checks=checks+req(values[1]>1.99 and values[1]<2.01 and values[7]>7.99 and values[7]<8.01,"wt1 roundtrip")
  stream=wave.Stream([],0);wave.NXPutc(stream,300);wave.NXPutc(stream,-1);checks=checks+req(stream.count==2 and stream.data==[44,255],"NX stream append")
  samples=[1000,-2000,3000,-4000,5000,-6000,7000,-8000]
  encoded=wave.encodeWavelet(samples);checks=checks+req(encoded.length==8 and len(encoded.blocks)==1,"wavelet encoding")
  decoded=wave.decodeWavelet(encoded.blocks[0]);checks=checks+req(len(decoded)==8,"wavelet decoding")
  mulaw=wave.encodeMuLaw(samples);checks=checks+req(mulaw.length==8 and len(mulaw.blocks)==1,"MuLaw encoding")
  decoded=wave.decodeMuLaw(mulaw.blocks[0]);checks=checks+req(len(decoded)==8 and decoded[0]>0 and decoded[1]<0,"MuLaw decoding")
  many=array(2050,0);chunked=wave.encodeMuLaw(many);checks=checks+req(len(chunked.blocks)==2 and chunked.blocks[0].size==2048 and chunked.blocks[1].size==2,"MuLaw chunking")
  short=wave.encodeWavelet([100,200]);checks=checks+req(short.length==2 and short.blocks[0].size==4,"short wavelet safe padding")
  checks=checks+req(try(wave.decodeMuLaw(void)) is error,"invalid block rejected")
  print("PASS: "+str(checks)+" complete snd_wavelet contracts");return 0
end function
