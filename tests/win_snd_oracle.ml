import mq3.platform.win_snd as snd
function main(args)
  print(snd.DSoundError(snd.DSERR_BUFFERLOST));print(snd.DSoundError(snd.DSERR_INVALIDCALL));print(snd.DSoundError(snd.DSERR_INVALIDPARAM));print(snd.DSoundError(snd.DSERR_PRIOLEVELNEEDED));print(snd.DSoundError(17));return 0
end function
