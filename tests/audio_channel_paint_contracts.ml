import mq3.audio.channel_paint as channel

function require(ok,text) if not ok then return error(7251,text) end if;return 1 end function
function source(value) return array(1024,value) end function
function main(args)
  count=0
  count=count+require(channel.SND_CHUNK_SIZE==1024,"Baseq3 chunk size")
  count=count+require(channel.validSamples(array(1024,0)),"single complete chunk")
  count=count+require(channel.validSamples(array(2048,0)),"multiple complete chunks")
  count=count+require(not channel.validSamples([]),"empty sample data rejected by predicate")
  count=count+require(not channel.validSamples(array(1023,0)),"partial chunk rejected by predicate")
  count=count+require(channel.sourceIndex(array(1024,0),0)==0,"zero source index")
  count=count+require(channel.sourceIndex(array(1024,0),1023)==1023,"last source index")
  count=count+require(channel.sourceIndex(array(1024,0),1024)==0,"forward source wrap")
  count=count+require(channel.sourceIndex(array(2048,0),2051)==3,"multi-chunk source wrap")
  count=count+require(channel.sourceIndex(array(1024,0),-1)==1023,"negative source wrap")

  paint=[10,20];channel.addScaled(paint,0,256,128,64)
  count=count+require(paint==[138,84],"scaled stereo addition")
  paint=[0,0];channel.addScaled(paint,0,-257,128,64)
  count=count+require(paint==[-129,-65],"negative arithmetic shift")
  paint=[2147483640,0];channel.addScaled(paint,0,256,16,0)
  count=count+require(paint[0]==-2147483640,"signed accumulation wraps")

  s=source(0);s[0]=256;s[1]=-256;s[2]=512
  result=channel.paint16(s,3,0,0,128,64,2,false,1.0,1.0,array(6,0))
  count=count+require(result==[256,128,-256,-128,512,256],"linear stereo painting")
  result=channel.paint16(s,2,0,1,128,64,2,false,1.0,1.0,array(8,9))
  count=count+require(result==[9,9,265,137,-247,-119,9,9],"paintbuffer offset and accumulation")
  result=channel.paint16(s,2,0,0,0,64,2,false,1.0,1.0,array(4,7))
  count=count+require(result==[7,135,7,-121],"silent left channel")
  result=channel.paint16(s,2,0,0,128,0,2,false,1.0,1.0,array(4,7))
  count=count+require(result==[263,7,-249,7],"silent right channel")
  result=channel.paint16(s,2,0,0,128,64,0,false,1.0,1.0,array(4,7))
  count=count+require(result==[7,7,7,7],"zero mixer volume")

  s=source(0);s[1023]=111;s[0]=222
  result=channel.paint16(s,2,1023,0,256,256,1,false,1.0,1.0,array(4,0))
  count=count+require(result==[111,111,222,222],"chunk ring crossing")
  s=source(0);s[2]=333
  result=channel.paint16(s,1,1026,0,256,256,1,false,1.0,1.0,array(2,0))
  count=count+require(result==[333,333],"initial offset normalization")
  result=channel.paint16(s,1,1,0,256,256,1,true,1.0,2.0,array(2,0))
  count=count+require(result==[333,333],"old Doppler scale selects start")

  s=source(0);s[0]=256;s[1]=512;s[2]=768;s[3]=1024
  result=channel.paint16(s,2,0,0,256,128,1,true,1.5,1.0,array(4,0))
  count=count+require(result==[256,128,640,320],"Doppler interval averaging")
  result=channel.paint16(s,1,0,1,128,256,2,true,2.0,1.0,array(4,10))
  count=count+require(result==[10,10,394,778],"Doppler stereo volume and destination")
  s=source(-32768)
  result=channel.paint16(s,1,0,0,255,255,255,true,2.0,1.0,array(2,0))
  count=count+require(result==[-8323200,-8323200],"Doppler negative sample")

  count=count+require(try(channel.paint16([],0,0,0,1,1,1,false,1.0,1.0,[])) is error,"empty source rejected")
  count=count+require(try(channel.paint16(array(1023,0),0,0,0,1,1,1,false,1.0,1.0,[])) is error,"partial source rejected")
  count=count+require(try(channel.paint16(source(0),-1,0,0,1,1,1,false,1.0,1.0,[])) is error,"negative count rejected")
  count=count+require(try(channel.paint16(source(0),1,-1,0,1,1,1,false,1.0,1.0,array(2,0))) is error,"negative source offset rejected")
  count=count+require(try(channel.paint16(source(0),1,0,-1,1,1,1,false,1.0,1.0,array(2,0))) is error,"negative buffer offset rejected")
  count=count+require(try(channel.paint16(source(0),2,0,0,1,1,1,false,1.0,1.0,array(2,0))) is error,"truncated paintbuffer rejected")
  count=count+require(try(channel.paint16(source(0),1,0,0,1,1,1,true,0.0,1.0,array(2,0))) is error,"zero Doppler scale rejected")
  count=count+require(try(channel.paint16(source(0),1,0,0,1,1,1,true,1.0,-1.0,array(2,0))) is error,"negative old Doppler scale rejected")
  print("PASS: "+str(count)+" audio channel-paint contracts")
  return 0
end function
