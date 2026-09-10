import mq3.platform.playable_audio as audio
import mq3.audio.wav as wav

function main(args)
  // Keep both sides of the typed boundary reachable without opening a device.
  if wav.MAX_PCM_BYTES<1 then ignored=audio.playLoop(void);audio.shutdown() end if
  return 0
end function
