import mq3.audio.snd_compressed_paint as compressed

function line(name,paint,count)
  text=name;for i=0 to count-1 text=text+" "+str(paint[i*2])+" "+str(paint[i*2+1]) end for;print(text);return void
end function

function main(args)
  raw=bytes(2048,0);for i=0 to 2047 raw[i]=(i*37+18)&255 end for
  ad=compressed.Compressed(compressed.METHOD_ADPCM,[compressed.Block(raw,4096,0,0)],4096)
  mu=compressed.Compressed(compressed.METHOD_MULAW,[compressed.Block(raw,2048,0,0)],2048)
  wave=compressed.Compressed(compressed.METHOD_WAVELET,[compressed.Block(raw,2048,0,0)],2048)
  paint=array(12,0);compressed.paint(paint,ad,6,3,0,127,73,204,false,1.0,1.0);line("adpcm",paint,6)
  paint=array(10,0);compressed.paint(paint,ad,5,4,0,127,73,204,true,1.0,1.5);line("adpcm_doppler",paint,5)
  paint=array(12,0);compressed.paint(paint,mu,6,5,0,127,73,204,false,1.0,1.0);line("mulaw",paint,6)
  paint=array(12,0);compressed.paint(paint,mu,6,5,0,127,73,204,true,1.75,1.0);line("mulaw_doppler",paint,6)
  paint=array(12,0);compressed.paint(paint,wave,6,7,0,127,73,204,false,1.0,1.0);line("wavelet",paint,6)
  return 0
end function
