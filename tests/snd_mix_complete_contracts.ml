import mq3.audio.snd_mix_runtime as mix
import mq3.audio.snd_compressed_paint as compressed
import mq3.audio.wav as wav

function req(ok,message) if not ok then return error(7669,message) end if;return 1 end function
function sound16(values) data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for;return wav.Sound(22050,1,16,2,44100,data) end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function

function main(args)
  checks=0
  blast=mix.S_WriteLinearBlastStereo16([256,-256,8388608,-8388864],2)
  checks=checks+req(read16(blast,0)==1 and read16(blast,2)==-1 and read16(blast,4)==32767 and read16(blast,6)==-32768,"linear stereo blast")
  ring=array(8,0);mix.S_TransferStereo16([256,512,768,1024],1,3,8,ring)
  checks=checks+req(ring[2]==1 and ring[3]==2 and ring[4]==3 and ring[5]==4,"stereo DMA ring transfer")
  mono=array(4,0);mix.S_TransferPaintBuffer([256,999,512,999],0,2,16,1,4,mono)
  checks=checks+req(mono[0]==1 and mono[1]==2,"generic mono transfer")
  samples=array(1024,0);samples[0]=1000;samples[1]=-2000;paint=array(4,0)
  result=mix.S_PaintChannelFrom16(paint,samples,2,0,0,127,63,204,false,1.0,1.0)
  checks=checks+req(not (result is error) and paint[0]>0 and paint[2]<0,"PCM channel paint")
  adpcmBlock=compressed.Block(bytes([0,0]),4,0,0);adpcm=compressed.Compressed(compressed.METHOD_ADPCM,[adpcmBlock],4);paint=array(8,0)
  checks=checks+req(not (mix.S_PaintChannelFromADPCM(paint,adpcm,4,0,0,127,127,204,false,1.0,1.0) is error),"ADPCM channel paint")
  mulawBlock=compressed.Block(bytes([255,127,0,128]),4,0,0);mulaw=compressed.Compressed(compressed.METHOD_MULAW,[mulawBlock],4);paint=array(8,0)
  checks=checks+req(not (mix.S_PaintChannelFromMuLaw(paint,mulaw,4,0,0,127,127,204,false,1.0,1.0) is error),"MuLaw channel paint")
  waveletBlock=compressed.Block(bytes([255,127,0,128]),4,0,0);wavelet=compressed.Compressed(compressed.METHOD_WAVELET,[waveletBlock],4);paint=array(8,0)
  checks=checks+req(not (mix.S_PaintChannelFromWavelet(paint,wavelet,4,0,0,127,127,204,false,1.0,1.0) is error),"wavelet channel paint")
  pcm=sound16([1000,-2000,3000]);paint=array(12,0)
  checks=checks+req(mix.S_PaintChannels(paint,pcm,void,0,6,0,127,127,204,true,false,1.0,1.0)==6 and paint[0]>0 and paint[2]<0,"complete looping channel pass")
  checks=checks+req(try(mix.S_PaintChannels(array(2,0),pcm,void,3,2,0,1,1,204,false,false,1.0,1.0)) is error,"invalid time rejected")
  checks=checks+req(try(mix.S_PaintChannelFromWavelet(array(8,0),mulaw,4,0,0,1,1,204,false,1.0,1.0)) is error,"compression mismatch rejected")
  print("PASS: "+str(checks)+" complete snd_mix contracts");return 0
end function
