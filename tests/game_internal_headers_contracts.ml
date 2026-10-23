// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.game_internal_headers as h

function req(value,label) if not value then return error(7812,"game internal header contract: "+label) end if;return 1 end function
function has(values,name) for each value in values if value==name then return true end if end for;return false end function

function main(args)
  count=0
  count=count+req(h.headerCounts()==[17,3,31,6,12,5,14,257],"inventory counts")
  count=count+req(h.CHAR_BIT==8 and h.SCHAR_MIN==-128 and h.UCHAR_MAX==255,"character limits")
  count=count+req(h.SHRT_MIN==-32768 and h.SHRT_MAX==32767 and h.USHRT_MAX==65535,"short limits")
  count=count+req(h.INT_MIN==-2147483648 and h.INT_MAX==2147483647 and h.UINT_MAX==-1,"integer limits")
  count=count+req(len(h.bgLibMacroNames())==17 and has(h.bgLibMacroNames(),"va_arg"),"VM libc macros")
  count=count+req(len(h.bgLibTypeNames())==3 and has(h.bgLibTypeNames(),"cmp_t"),"VM libc types")
  count=count+req(len(h.bgLibFunctionNames())==31 and has(h.bgLibFunctionNames(),"qsort") and has(h.bgLibFunctionNames(),"acos"),"VM libc declarations")
  count=count+req(h.MIN_WALK_NORMAL==0.7 and h.STEPSIZE==18 and h.JUMP_VELOCITY==270,"movement constants")
  count=count+req(h.TIMER_LAND==130 and h.TIMER_GESTURE==2294 and h.OVERCLIP==1.001,"movement timing")
  count=count+req(len(h.pmlFieldNames())==12 and has(h.pmlFieldNames(),"groundTrace"),"pml fields")
  count=count+req(len(h.bgLocalFunctionNames())==5 and has(h.bgLocalFunctionNames(),"PM_SlideMove"),"movement declarations")
  count=count+req(len(h.bgLocalGlobalNames())==14 and has(h.bgLocalGlobalNames(),"pm_flightfriction"),"movement globals")
  count=count+req(len(h.rankingKeyNames())==257 and len(h.rankingKeyValues())==257,"ranking inventory")
  count=count+req(h.QGR_KEY_MATCH_RATING==1112000001 and h.QGR_KEY_FLAG_CAPTURE==1111110001,"base ranking keys")
  count=count+req(h.QGR_KEY_FRAG_NAILGIN==1211021200 and h.QGR_KEY_ROUNDS_CHAINGUN_AMMO==1111031101,"missionpack ranking keys")
  count=count+req(h.QGR_KEY_AMMOREGEN==1111160803 and h.QGR_KEY_HAZARD_MISC==1111080900,"extended ranking keys")
  print("PASS: "+str(count)+" game internal header contracts")
  return 0
end function
