// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.shared.q_shared_runtime as q
function joinBytes(value) result="";for index=0 to len(value)-1 if index>0 then result=result+"," end if;result=result+str(value[index]) end for;return result end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  print("clamp="+str(q.com_Clamp(0.0,1.0,-2.0))+","+str(q.com_Clamp(0.0,1.0,2.0))+","+str(q.com_Clamp(0.0,1.0,0.5)))
  print("path="+q.com_SkipPath("a/b/c.tga"))
  print("strip="+q.com_StripExtension("a.b.c"))
  print("short="+str(q.shortSwap(0x1234))+","+str(q.shortSwap(-2)))
  print("long="+str(n.u32(q.longSwap(0x12345678)))+","+str(q.longNoSwap(-1)))
  print("long64="+joinBytes(q.long64Swap(bytes([1,2,3,4,5,6,7,8]))))
  source=n.bitsFloat(0x12345678);print("float="+str(n.floatBits(q.floatSwap(source)))+","+str(n.floatBits(q.floatNoSwap(source))))
  print("class="+str(bit(q.q_isprint(32)))+","+str(bit(q.q_isprint(127)))+","+str(bit(q.q_islower(97)))+","+str(bit(q.q_isupper(90)))+","+str(bit(q.q_isalpha(66))))
  print("rchr="+str(q.q_strrchr("abca",97))+","+str(q.q_strrchr("abc",0))+","+str(q.q_strrchr("abc",120)))
  print("compare="+str(q.q_stricmpn("abc","ABd",2))+","+str(q.q_stricmpn("abc","ABd",3))+","+str(q.q_strncmp("abc","abd",3))+","+str(q.q_stricmp(void,"x")))
  print("case="+q.q_strlwr("AbC1")+","+q.q_strupr("aBc1"))
  print("color="+str(q.q_PrintStrlen("^1Red^^caret"))+","+q.q_CleanStr("^1Red\n\t^^caret"))
  print("valid="+str(bit(q.info_Validate("\\name\\Sarge")))+","+str(bit(q.info_Validate("\\x\\bad;value")))+","+str(bit(q.info_Validate("\\x\\bad\"value"))))
  return 0
end function
