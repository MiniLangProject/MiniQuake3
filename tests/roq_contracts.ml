import mq3.format.roq as roq
import mq3.video.roq_video as video

function req(ok,text) if not ok then return error(7693,text) end if;return 1 end function
function le16(value) return bytes([value&255,(value>>8)&255]) end function
function le32(value) return bytes([value&255,(value>>8)&255,(value>>16)&255,(value>>24)&255]) end function
function chunk(id,flags,payload) return le16(id)+le32(len(payload))+le16(flags)+payload end function
function movieBytes()
  header=le16(roq.MAGIC)+bytes([255,255,255,255])+le16(30)
  info=le16(16)+le16(16)+le16(8)+le16(4)
  codebook=bytes([64,96,128,160,128,128,0,0,0,0])
  vq=bytes([0,170,0,0,0,0])
  skipped=bytes([0,0]);motion=bytes([0,85,136,136,136,136])
  return header+chunk(roq.QUAD_INFO,0,info)+chunk(roq.CODEBOOK,0x0101,codebook)+chunk(roq.SOUND_MONO,0,bytes([1,2,128]))+chunk(roq.SOUND_STEREO,0x8080,bytes([1,2]))+chunk(roq.QUAD_VQ,0,vq)+chunk(roq.QUAD_VQ,0,skipped)+chunk(roq.QUAD_VQ,0,motion)
end function
function read16(data,at) value=data[at]|(data[at+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function main(args)
  count=0;data=movieBytes();movie=roq.parse(data);if movie is error then return movie end if
  count=count+req(movie.fps==30 and len(movie.chunks)==7 and movie.videoFrames==3 and movie.audioChunks==2,"container index")
  count=count+req(movie.chunks[0].id==roq.QUAD_INFO and movie.chunks[6].id==roq.QUAD_VQ,"chunk IDs and order")
  mono=roq.decodeAudio(movie,movie.chunks[2]);count=count+req(mono.frames==3 and len(mono.samples)==12 and read16(mono.samples,0)==1 and read16(mono.samples,4)==5 and read16(mono.samples,8)==5,"mono DPCM to stereo")
  stereo=roq.decodeAudio(movie,movie.chunks[3]);count=count+req(stereo.frames==1 and read16(stereo.samples,0)==-32767 and read16(stereo.samples,2)==-32764,"stereo DPCM")
  decoder=video.create();video.process(decoder,movie,movie.chunks[0]);video.process(decoder,movie,movie.chunks[1]);frame=video.process(decoder,movie,movie.chunks[4]);if frame is error then return frame end if
  count=count+req(frame.width==16 and frame.height==16 and frame.number==1 and len(frame.pixels)==1024,"decoded RGBA frame")
  count=count+req(frame.pixels[3]==255 and frame.pixels[0]>0 and decoder.q2[0]!=void and decoder.q8[0]!=void,"YUV codebook and VQ cells")
  skipped=video.process(decoder,movie,movie.chunks[5]);count=count+req(skipped.number==2 and skipped.pixels==frame.pixels,"skip blocks retain the reference frame")
  moved=video.process(decoder,movie,movie.chunks[6]);count=count+req(moved.number==3 and moved.pixels==frame.pixels,"zero-displacement motion copies the previous frame")
  count=count+req(try(roq.parse(bytes([1,2,3]))) is error,"truncated header rejected")
  bad=data;bad[0]=0;count=count+req(try(roq.parse(bad)) is error,"signature rejected")
  count=count+req(try(video.process(video.create(),movie,movie.chunks[4])) is error,"VQ before dimensions rejected")
  count=count+req(try(video.create().latest.width) is error,"empty decoder has no frame")
  many=bytes(8+4096*8,0);many[0]=roq.MAGIC&255;many[1]=roq.MAGIC>>8;many[6]=30
  for index=0 to 4095 offset=8+index*8;many[offset]=roq.QUAD_HANG&255;many[offset+1]=roq.QUAD_HANG>>8 end for
  indexed=roq.parse(many)
  count=count+req(len(indexed.chunks)==4096 and indexed.chunks[4095].dataOffset==8+4096*8,"large RoQ index retains all chunk offsets")
  print("PASS: "+str(count)+" RoQ media contracts");return 0
end function
