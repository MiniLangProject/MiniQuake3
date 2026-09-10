import mq3.audio.mixer_transfer as mixer

function require(ok,text) if not ok then return error(7241,text) end if;return 1 end function
function fresh(size,value) return array(size,value) end function
function main(args)
  count=0
  count=count+require(mixer.clamp16(40000)==32767,"positive clipping")
  count=count+require(mixer.clamp16(-40000)==-32768,"negative clipping")
  count=count+require(mixer.clamp16(32767)==32767,"positive boundary")
  count=count+require(mixer.clamp16(-32768)==-32768,"negative boundary")
  count=count+require(mixer.clamp16(-1)==-1,"interior sample")
  p=[-8388864,-8388608,-256,0,256,8388608]
  count=count+require(mixer.transfer(p,0,3,16,2,8,fresh(8,9))==[-32768,-32768,-1,0,1,32767,9,9],"stereo signed-16 saturation")
  count=count+require(mixer.transfer(p,0,3,8,2,8,fresh(8,9))==[0,0,127,128,128,255,9,9],"stereo unsigned-8 conversion")
  count=count+require(mixer.transfer(p,0,3,16,1,4,fresh(4,9))==[-32768,-1,1,9],"mono selects left paint channel")
  count=count+require(mixer.transfer(p,0,3,8,1,4,fresh(4,9))==[0,127,128,9],"8-bit mono selects left paint channel")
  count=count+require(mixer.transfer([256,512,768,1024],3,5,16,2,8,fresh(8,0))==[3,4,0,0,0,0,1,2],"stereo ring wrap")
  count=count+require(mixer.transfer([256,512,768,1024],3,5,16,1,4,fresh(4,0))==[3,0,0,1],"mono ring wrap")
  dmaOut=fresh(4,7);result=mixer.transfer([],2,2,16,2,4,dmaOut)
  count=count+require(result==[7,7,7,7],"empty interval leaves output intact")
  count=count+require(dmaOut==[7,7,7,7],"DMA output is retained in place")
  count=count+require(try(mixer.transfer([],0,0,24,2,8,fresh(8,0))) is error,"unsupported sample width rejected")
  count=count+require(try(mixer.transfer([],0,0,16,3,8,fresh(8,0))) is error,"unsupported channel count rejected")
  count=count+require(try(mixer.transfer([],0,0,16,2,7,fresh(7,0))) is error,"non-power-of-two ring rejected")
  count=count+require(try(mixer.transfer([],4,3,16,2,8,fresh(8,0))) is error,"backward interval rejected")
  count=count+require(try(mixer.transfer([1,2],0,2,16,2,8,fresh(8,0))) is error,"truncated paintbuffer rejected")
  count=count+require(try(mixer.transfer([],0,0,16,2,8,fresh(7,0))) is error,"truncated DMA buffer rejected")
  count=count+require(mixer.powerOfTwo(1) and mixer.powerOfTwo(1024) and not mixer.powerOfTwo(0) and not mixer.powerOfTwo(6),"power-of-two validation")
  print("PASS: "+str(count)+" audio mixer-transfer contracts")
  return 0
end function
