import mq3.qcommon.md4 as md4

function hexByte(value) digits="0123456789abcdef";return digits[(value>>4)&15]+digits[value&15] end function
function hexBytes(value)
  result="";for each byte in value result=result+hexByte(byte) end for;return result
end function
function hexWord(value) data=md4.Encode([value],4);return hexByte(data[3])+hexByte(data[2])+hexByte(data[1])+hexByte(data[0]) end function
function hexWords(value)
  result="";for index=0 to len(value)-1 if index>0 then result=result+"," end if;result=result+hexWord(value[index]) end for;return result
end function
function main(args)
  words=[0,0x12345678,0x89abcdef,0xffffffff];encoded=md4.Encode(words,16);print(hexBytes(encoded));print(hexWords(md4.Decode(encoded,16)));print(hexBytes(md4.Encode([words[1],words[2]],8)));return 0
end function
