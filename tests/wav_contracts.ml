import mq3.audio.wav as wav

function require(ok,text) if not ok then return error(7500,text) end if;return 1 end function
function le16(value) return bytes([value&255,(value>>8)&255]) end function
function le32(value) return bytes([value&255,(value>>8)&255,(value>>16)&255,(value>>24)&255]) end function
function chunk(name,payload)
  result=bytes(name)+le32(len(payload))+payload
  if (len(payload)&1)!=0 then result=result+bytes([0]) end if
  return result
end function
function formatPayload(code,channels,rate,bits,align,byteRate)
  if align<0 then align=channels*(bits/8) end if
  if byteRate<0 then byteRate=rate*align end if
  return le16(code)+le16(channels)+le32(rate)+le32(byteRate)+le16(align)+le16(bits)
end function
function wave(chunks)
  body=bytes("WAVE")+chunks
  return bytes("RIFF")+le32(len(body))+body
end function
function pcm(channels,rate,bits,samples)
  return wave(chunk("fmt ",formatPayload(1,channels,rate,bits,-1,-1))+chunk("data",bytes(samples)))
end function
function same(data,values)
  if len(data)!=len(values) then return false end if
  if len(data)>0 then for i=0 to len(data)-1 if data[i]!=values[i] then return false end if end for end if
  return true
end function

function main(args)
  count=0
  sound=wav.decode(pcm(1,11025,8,[0,64,128,255]))
  count=count+require(sound.sampleRate==11025 and sound.channels==1 and sound.bitsPerSample==8,"mono format fields")
  count=count+require(sound.blockAlign==1 and sound.byteRate==11025,"mono derived rates")
  count=count+require(same(sound.samples,[0,64,128,255]),"PCM samples copied")
  source=pcm(1,11025,8,[1,2]);copied=wav.decode(source);source[len(source)-1]=99
  count=count+require(same(copied.samples,[1,2]),"PCM owns a safe copy")
  sound=wav.decode(pcm(2,44100,16,[1,2,3,4,5,6,7,8]))
  count=count+require(sound.channels==2 and sound.bitsPerSample==16 and sound.blockAlign==4 and sound.byteRate==176400,"stereo sixteen-bit format")
  reversed=wave(chunk("data",bytes([7,8]))+chunk("fmt ",formatPayload(1,1,8000,8,-1,-1)))
  count=count+require(same(wav.decode(reversed).samples,[7,8]),"data may precede fmt")
  odd=wave(chunk("JUNK",bytes([1,2,3]))+chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("data",bytes([9])))
  count=count+require(wav.decode(odd).samples[0]==9,"odd unknown chunk and padding skipped")
  extended=formatPayload(1,1,8000,8,-1,-1)+bytes([0,0])
  count=count+require(wav.decode(wave(chunk("fmt ",extended)+chunk("data",bytes([4])))).sampleRate==8000,"extended fmt accepted")
  trailing=pcm(1,8000,8,[3])+bytes([99,98,97])
  count=count+require(wav.decode(trailing).samples[0]==3,"bytes after RIFF ignored")
  duplicateData=wave(chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("data",bytes([1]))+chunk("data",bytes([2])))
  count=count+require(wav.decode(duplicateData).samples[0]==1,"first data chunk wins")
  unknown=wave(chunk("LIST",bytes([1,2,3,4]))+chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("fact",bytes([5,6]))+chunk("data",bytes([42])))
  count=count+require(wav.decode(unknown).samples[0]==42,"unknown even chunks skipped")

  count=count+require(try(wav.decode(void)) is error,"void rejected")
  count=count+require(try(wav.decode(bytes([1,2,3]))) is error,"short header rejected")
  bad=pcm(1,8000,8,[1]);bad[0]=88;count=count+require(try(wav.decode(bad)) is error,"RIFF signature required")
  bad=pcm(1,8000,8,[1]);bad[8]=88;count=count+require(try(wav.decode(bad)) is error,"WAVE signature required")
  bad=pcm(1,8000,8,[1]);bad[4]=3;bad[5]=0;bad[6]=0;bad[7]=0;count=count+require(try(wav.decode(bad)) is error,"minimum RIFF size checked")
  bad=pcm(1,8000,8,[1]);bad[4]=255;bad[5]=255;bad[6]=255;bad[7]=127;count=count+require(try(wav.decode(bad)) is error,"advertised RIFF truncation checked")
  body=bytes("WAVE")+bytes([65,66,67]);bad=bytes("RIFF")+le32(len(body))+body;count=count+require(try(wav.decode(bad)) is error,"partial chunk header rejected")
  body=bytes("WAVEfmt ")+le32(20)+formatPayload(1,1,8000,8,-1,-1);bad=bytes("RIFF")+le32(len(body))+body;count=count+require(try(wav.decode(bad)) is error,"truncated chunk payload rejected")
  body=bytes("WAVE")+bytes("JUNK")+le32(1)+bytes([1]);bad=bytes("RIFF")+le32(len(body))+body;count=count+require(try(wav.decode(bad)) is error,"missing odd chunk padding rejected")
  count=count+require(try(wav.decode(wave(chunk("data",bytes([1]))))) is error,"missing fmt rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",bytes(15,0))+chunk("data",bytes([1]))))) is error,"short fmt rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))))) is error,"missing data rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("data",bytes(0,0))))) is error,"empty data rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(3,1,8000,8,-1,-1))+chunk("data",bytes([1]))))) is error,"float format rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,0,8000,8,1,8000))+chunk("data",bytes([1]))))) is error,"zero channels rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,3,8000,8,3,24000))+chunk("data",bytes([1,2,3]))))) is error,"surround channels rejected")
  count=count+require(try(wav.decode(pcm(1,3999,8,[1]))) is error,"low sample rate rejected")
  count=count+require(try(wav.decode(pcm(1,192001,8,[1]))) is error,"high sample rate rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,1,8000,24,3,24000))+chunk("data",bytes([1,2,3]))))) is error,"unsupported bit depth rejected")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,2,8000,16,2,16000))+chunk("data",bytes([1,2]))))) is error,"block alignment checked")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,1,8000,8,1,7999))+chunk("data",bytes([1]))))) is error,"byte rate checked")
  count=count+require(try(wav.decode(wave(chunk("fmt ",formatPayload(1,2,8000,16,-1,-1))+chunk("data",bytes([1,2,3]))))) is error,"partial frame rejected")
  firstBad=chunk("fmt ",formatPayload(3,1,8000,8,-1,-1))+chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("data",bytes([1]))
  count=count+require(try(wav.decode(wave(firstBad))) is error,"first fmt chunk wins")
  firstEmpty=chunk("fmt ",formatPayload(1,1,8000,8,-1,-1))+chunk("data",bytes(0,0))+chunk("data",bytes([1]))
  count=count+require(try(wav.decode(wave(firstEmpty))) is error,"first empty data chunk wins")
  print("PASS: "+str(count)+" WAV contracts")
  return 0
end function
