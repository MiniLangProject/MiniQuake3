import mq3.shared.q_shared_header as h
import mq3.game.playerstate as ps
import mq3.game.entitystate as es
import mq3.vm.syscall_qagame_world as qworld

function req(ok,text) if not ok then return error(7882,"q_shared.h: "+text) end if;return 1 end function
function main(args)
  count=0
  count=count+req(h.qfalse==0 and h.qtrue==1,"qboolean")
  count=count+req(h.MAX_STRING_CHARS==1024 and h.MAX_TOKEN_CHARS==1024 and h.MAX_INFO_STRING==1024 and h.BIG_INFO_STRING==8192,"text constants")
  count=count+req(h.MAX_QPATH==64 and h.MAX_NAME_LENGTH==32 and h.MAX_SAY_TEXT==150,"path/name constants")
  count=count+req(h.MAX_CLIENTS==64 and h.MAX_GENTITIES==1024 and h.GENTITYNUM_BITS==10,"entity constants")
  count=count+req(h.ENTITYNUM_NONE==1023 and h.ENTITYNUM_WORLD==1022 and h.ENTITYNUM_MAX_NORMAL==1022,"entity sentinels")
  count=count+req(h.MAX_MODELS==256 and h.MAX_SOUNDS==256 and h.MAX_CONFIGSTRINGS==1024 and h.MAX_GAMESTATE_CHARS==16000,"protocol limits")
  count=count+req(h.PATH_SEP==92,"Win32 path separator")
  count=count+req(h.ppcLwbrx(bytes([0x12,0x34,0x56,0x78]),0)==0x12345678 and h.ppcLhbrx(bytes([0xab,0xcd]),0)==0xabcd,"PowerPC byte-reverse equivalents")
  count=count+req(h.ppcFctiw(2.5)==2 and h.ppcFctiw(3.5)==4 and h.ppcFctiw(-2.5)==-2 and h.ppcFctiw(-3.5)==-4,"PowerPC fctiw equivalent")
  count=count+req(ps.BYTE_SIZE==468,"playerState_t size")
  count=count+req(es.BYTE_SIZE==208,"entityState_t size")
  count=count+req(qworld.USERCMD_SIZE==24,"usercmd_t size")
  print("PASS: "+str(count)+" q_shared.h ABI contracts")
  return 0
end function
