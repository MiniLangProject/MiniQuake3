import mq3.audio.snd_adpcm_runtime as adpcm

function req(ok,message) if not ok then return error(7670,message) end if;return 1 end function
function main(args)
  checks=0;samples=[0,1000,-1000,3000,-3000,32767,-32768,1234,-4567]
  state=adpcm.State(0,0);encoded=adpcm.S_AdpcmEncode(samples,state)
  checks=checks+req(not (encoded is error) and len(encoded.data)==5,"packed nibble extent")
  checks=checks+req(state.index>=0 and state.index<=88 and state.sample>=(-32768) and state.sample<=32767,"encoder state bounds")
  decodeState=adpcm.State(0,0);decoded=adpcm.S_AdpcmDecode(encoded.data,len(samples),decodeState)
  checks=checks+req(len(decoded)==len(samples) and decodeState.sample==state.sample and decodeState.index==state.index,"encode/decode terminal state")
  block=adpcm.S_AdpcmEncodeSound(samples);checks=checks+req(block.length==len(samples) and len(block.blocks)==1,"sound block encoding")
  fetched=adpcm.S_AdpcmGetSamples(block.blocks[0]);checks=checks+req(len(fetched)==len(samples),"block sample decoding")
  many=array(5000,0);for i=0 to 4999 many[i]=(i*97)%65536-32768 end for;chunked=adpcm.S_AdpcmEncodeSound(many)
  checks=checks+req(len(chunked.blocks)==2 and chunked.blocks[0].size==4096 and chunked.blocks[1].size==904,"4096-sample chunking")
  checks=checks+req(adpcm.S_AdpcmMemoryNeeded(22050,4096,22050)==2056,"memory size one block")
  checks=checks+req(adpcm.memory(44100,8192,22050)==2056,"resampled memory alias")
  checks=checks+req(try(adpcm.S_AdpcmEncode([],adpcm.State(0,89))) is error,"invalid index rejected")
  checks=checks+req(try(adpcm.S_AdpcmDecode(bytes([]),1,adpcm.State(0,0))) is error,"truncated input rejected")
  print("PASS: "+str(checks)+" complete snd_adpcm contracts");return 0
end function
