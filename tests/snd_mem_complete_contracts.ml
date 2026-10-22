import mq3.audio.snd_mem_runtime as runtime

struct Context wav reads frees time encoded diagnostics end struct
function req(ok,message) if not ok then return error(7761,message) end if;return 1 end function
function readFile(context,name) context.reads=context.reads+[name];return context.wav end function
function freeFile(context,data) context.frees=context.frees+1 end function
function millis(context) return context.time end function
function encode(context,sfx,pcm) context.encoded=context.encoded+1;return ["adpcm",len(pcm)] end function
function encodeError(context,sfx,pcm) return error(7761,"encode failed") end function
function diag(context,message) context.diagnostics=context.diagnostics+[message] end function
function put16(data,offset,value) data[offset]=value&255;data[offset+1]=(value>>8)&255 end function
function put32(data,offset,value) put16(data,offset,value&65535);put16(data,offset+2,(value>>16)&65535) end function
function putText(data,offset,text) raw=bytes(text);for index=0 to len(raw)-1 data[offset+index]=raw[index] end for end function
function pcm16(values) data=bytes(len(values)*2,0);for index=0 to len(values)-1 put16(data,index*2,values[index]) end for;return data end function
function wav(channels,rate,width,pcm)
  data=bytes(44+len(pcm),0);putText(data,0,"RIFF");put32(data,4,36+len(pcm));putText(data,8,"WAVE");putText(data,12,"fmt ");put32(data,16,16);put16(data,20,1);put16(data,22,channels);put32(data,24,rate);put32(data,28,rate*channels*width);put16(data,32,channels*width);put16(data,34,width*8);putText(data,36,"data");put32(data,40,len(pcm));for index=0 to len(pcm)-1 data[44+index]=pcm[index] end for;return data
end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function main(args)
  count=0;sampleWav=wav(1,22050,2,pcm16([-32768,-1,0,1,32767]));context=Context(sampleWav,[],0,99,0,[]);host=runtime.Services(readFile,freeFile,millis,encode,void,diag,context);state=runtime.create(22050,host)
  count=count+req(runtime.SND_CHUNK_SIZE==1024 and runtime.BUFFER_BYTES==2052,"sound buffer ABI")
  count=count+req(runtime.SND_setup(state,1)==1536 and len(state.freelist)==1536,"SND_setup buffer count")
  count=count+req(state.inUse==1536*runtime.BUFFER_BYTES and state.totalInUse==0 and len(state.scratch)==8192,"SND_setup accounting and scratch")
  buffer=runtime.SND_malloc(state);count=count+req(buffer!=void and len(state.freelist)==1535,"SND_malloc pops freelist")
  count=count+req(state.inUse==1535*runtime.BUFFER_BYTES and state.totalInUse==runtime.BUFFER_BYTES,"SND_malloc accounting")
  runtime.SND_free(state,buffer);count=count+req(len(state.freelist)==1536 and state.inUse==1536*runtime.BUFFER_BYTES,"SND_free accounting")
  memory=runtime.S_DisplayFreeMemory(state);count=count+req(memory==[state.inUse,state.totalInUse] and len(context.diagnostics)==2,"memory diagnostics")
  little=bytes(6,0);little[0]=52;little[1]=18;little[2]=255;little[3]=255;little[4]=255;little[5]=127;reader=runtime.reader(little);count=count+req(runtime.GetLittleShort(reader)==4660,"GetLittleShort")
  count=count+req(runtime.GetLittleLong(reader)==2147483647 and reader.dataPos==6,"GetLittleLong")
  chunks=bytes(24,0);putText(chunks,0,"one1");put32(chunks,4,3);chunks[8]=1;chunks[9]=2;chunks[10]=3;putText(chunks,12,"two2");put32(chunks,16,4)
  cr=runtime.reader(chunks);count=count+req(runtime.FindChunk(cr,"one1")==0 and cr.chunkLen==3 and cr.lastChunk==12,"FindChunk padded")
  count=count+req(runtime.FindNextChunk(cr,"two2")==12 and cr.chunkLen==4,"FindNextChunk")
  count=count+req(runtime.FindNextChunk(cr,"none")==-1 and cr.dataPos==-1,"missing chunk")
  info=runtime.GetWavinfo("sample",sampleWav,len(sampleWav));count=count+req(info.format==1 and info.channels==1 and info.rate==22050,"GetWavinfo format")
  count=count+req(info.width==2 and info.samples==5 and info.dataofs==44,"GetWavinfo payload")
  bad=bytes(sampleWav);bad[0]=0;count=count+req(runtime.GetWavinfo("bad",bad,len(bad)).format==0,"missing RIFF returns empty")
  count=count+req(try(runtime.GetWavinfo("bad",sampleWav,len(sampleWav)+1)) is error,"WAV length validated")
  raw=runtime.ResampleSfxRaw(state,22050,2,5,slice(sampleWav,44,10));count=count+req(len(raw)==10 and read16(raw,0)==-32768 and read16(raw,8)==32767,"ResampleSfxRaw same rate")
  up=runtime.ResampleSfxRaw(state,11025,2,2,pcm16([100,200]));count=count+req(len(up)==8 and read16(up,0)==100 and read16(up,2)==100,"ResampleSfxRaw upsample")
  many=[];for index=0 to 1024 many=many+[index-512] end for;effect=runtime.Sfx("bulk",false,0,void,1025,0);loaded=runtime.ResampleSfx(state,effect,22050,2,pcm16(many),false)
  count=count+req(loaded==1025 and effect.soundLength==1025,"ResampleSfx length")
  count=count+req(effect.soundData!=void and effect.soundData.next!=void and effect.soundData.next.next==void,"ResampleSfx chunk chain")
  count=count+req(read16(effect.soundData.samples,0)==-512 and read16(effect.soundData.next.samples,0)==512,"chunk sample content")
  sfx=runtime.Sfx("sound/test.wav",false,0,void,0,0);count=count+req(runtime.S_LoadSound(state,sfx),"S_LoadSound PCM")
  count=count+req(sfx.soundCompressionMethod==0 and sfx.soundLength==5 and sfx.soundData!=void,"PCM load fields")
  count=count+req(sfx.lastTimeUsed==100 and context.reads==["sound/test.wav"] and context.frees==1,"load lifecycle")
  compressed=runtime.Sfx("sound/compressed.wav",true,0,void,0,0);count=count+req(runtime.S_LoadSound(state,compressed),"S_LoadSound compressed")
  count=count+req(compressed.soundCompressionMethod==1 and compressed.soundLength==5 and compressed.soundData==["adpcm",10] and context.encoded==1,"compressed encode path")
  noEncoderContext=Context(sampleWav,[],0,99,0,[]);noEncoder=runtime.create(22050,runtime.Services(readFile,freeFile,millis,void,void,diag,noEncoderContext));runtime.SND_setup(noEncoder,1);count=count+req(try(runtime.S_LoadSound(noEncoder,runtime.Sfx("sound/no-encoder.wav",true,0,void,0,0))) is error and noEncoderContext.frees==1,"compressed load requires encoder and releases file")
  errorContext=Context(sampleWav,[],0,99,0,[]);errorEncoder=runtime.create(22050,runtime.Services(readFile,freeFile,millis,encodeError,void,diag,errorContext));runtime.SND_setup(errorEncoder,1);count=count+req(try(runtime.S_LoadSound(errorEncoder,runtime.Sfx("sound/encode-error.wav",true,0,void,0,0))) is error and errorContext.frees==1,"encoder failure releases file")
  count=count+req(not runtime.S_LoadSound(state,runtime.Sfx("*death1.wav",false,0,void,0,0)),"player sound deferred")
  context.wav=wav(2,22050,2,pcm16([1,2]));count=count+req(not runtime.S_LoadSound(state,runtime.Sfx("stereo.wav",false,0,void,0,0)),"stereo rejected")
  context.wav=void;count=count+req(not runtime.S_LoadSound(state,runtime.Sfx("missing.wav",false,0,void,0,0)),"missing file rejected")
  empty=runtime.create(22050,void);count=count+req(try(runtime.SND_malloc(empty)) is error,"exhausted allocator rejected")
  count=count+req(try(runtime.create(0,void)) is error,"DMA rate validated")
  print("PASS: "+str(count)+" complete snd_mem contracts")
  return 0
end function
