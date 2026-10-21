import mq3.audio.snd_compressed_paint as compressed

function req(ok,message) if not ok then return error(7669,message) end if;return 1 end function

function main(args)
  count=0
  count=count+req(compressed.muLawDecode(255)==4 and compressed.muLawDecode(127)==-4,"MuLaw zero codes preserve Baseq3 bias")
  count=count+req(compressed.muLawDecode(0)==31612 and compressed.muLawDecode(128)==-31612,"MuLaw extrema preserve Baseq3 sign convention")
  adpcm=compressed.adpcmDecode(bytes([0x12,0xF8,0x70]),6,0,0)
  count=count+req(adpcm==[1,4,-7,-9,16,19],"IMA ADPCM consumes high nibble first")
  clipped=compressed.adpcmDecode(bytes([0x77,0x77]),4,32760,88)
  count=count+req(clipped==[32767,32767,32767,32767],"IMA ADPCM predictor clips to signed 16-bit")
  count=count+req(try(compressed.adpcmDecode(bytes([0]),3,0,0)) is error and try(compressed.adpcmDecode(bytes([0]),1,0,89)) is error,"ADPCM rejects malformed blocks")
  muBlock=compressed.Block(bytes([255,127,0,128]),4,0,0);mu=compressed.Compressed(compressed.METHOD_MULAW,[muBlock],4)
  count=count+req(compressed.decodedSamples(mu)==[4,-4,31612,-31612],"MuLaw blocks decode through shared sfx representation")
  paint=array(8,0);painted=compressed.paint(paint,mu,4,0,0,127,64,204,false,1.0,1.0)
  count=count+req(painted==4 and paint==[404,204,-405,-204,3199233,1612212,-3199234,-1612212],"MuLaw paint uses Baseq3 24.8 volume arithmetic")
  doppler=array(4,0);compressed.paint(doppler,mu,2,0,0,127,127,204,true,2.0,1.0)
  count=count+req(doppler==[404,404,3199233,3199233],"MuLaw Doppler uses nearest source sample")
  adBlock=compressed.Block(bytes([0x12,0xF8,0x70]),6,0,0);ad=compressed.Compressed(compressed.METHOD_ADPCM,[adBlock],6)
  adPaint=array(4,0);compressed.paint(adPaint,ad,2,1,0,10,20,100,false,1.0,1.0)
  count=count+req(adPaint==[15,31,-28,-55],"ADPCM paint applies independent channel volumes")
  waveBlock=compressed.Block(bytes([255,127,255,127]),4,0,0);wave=compressed.Compressed(compressed.METHOD_WAVELET,[waveBlock],4)
  waveSamples=compressed.decodedSamples(wave)
  count=count+req(len(waveSamples)==4,"wavelet inverse emits declared block size")
  wavePaint=array(8,0);count=count+req(compressed.paint(wavePaint,wave,4,0,0,127,127,204,false,1.0,1.0)==4,"wavelet paint reaches common paintbuffer")
  count=count+req(try(compressed.paint(array(2,0),mu,2,3,0,1,1,1,false,1.0,1.0)) is error,"paint rejects source overflow")
  count=count+req(try(compressed.decodedSamples(compressed.Compressed(99,[muBlock],4))) is error,"unknown compression rejected")
  count=count+req(compressed.METHOD_ADPCM==1 and compressed.METHOD_WAVELET==2 and compressed.METHOD_MULAW==3,"Baseq3 sfx compression tags")
  print("PASS: "+str(count)+" compressed paint contracts");return 0
end function
