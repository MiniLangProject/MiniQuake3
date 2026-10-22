import mq3.qcommon.common as common
function bit(value) if value then return 1 end if;return 0 end function
function filter(pattern,name,sensitive) print("filter:"+pattern+":"+name+":"+str(sensitive)+"="+str(bit(common.Com_Filter(pattern,name,sensitive!=0))));return void end function
function main(args)
  print("contains="+str(common.Com_StringContains("AbCdEf","cde",false)));print("contains="+str(common.Com_StringContains("AbCdEf","xyz",false)))
  filter("maps/*.bsp","maps/q3dm1.bsp",0);filter("foo?bar","fooXbar",1);filter("a[0-3]","a9",1);filter("[[abc","[abc",1)
  print("path="+str(bit(common.Com_FilterPath("maps\\*.bsp","maps:q3dm1.bsp",false))))
  print("hash="+str(common.Com_HashKey("abc",3))+","+str(common.Com_HashKey(decode(bytes([228,120])),2)))
  print("acos="+str(common.Q_acos(1.0))+","+str(common.Q_acos(0.0)))
  field=common.Field("text",7,9);common.Field_Clear(field);first=0;if len(field.buffer)>0 then first=bytes(field.buffer)[0] end if;print("field="+str(first)+","+str(field.cursor)+","+str(field.scroll));return 0
end function
