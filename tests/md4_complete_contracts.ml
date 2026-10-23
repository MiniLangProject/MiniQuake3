import mq3.qcommon.md4 as md4

function req(ok,label) if not ok then return error(7822,"MD4 complete: "+label) end if;return 1 end function
function main(args)
  count=0;words=[0,0x12345678,0x89abcdef,0xffffffff];encoded=md4.Encode(words,16)
  count=count+req(encoded==bytes([0,0,0,0,0x78,0x56,0x34,0x12,0xef,0xcd,0xab,0x89,0xff,0xff,0xff,0xff]),"Encode little endian")
  count=count+req(md4.Encode(md4.Decode(encoded,16),16)==encoded,"Decode roundtrip")
  count=count+req(md4.Encode(words,0)==bytes(0,0) and md4.Decode(bytes(0,0),0)==[],"zero length")
  count=count+req(try(md4.Encode(words,3)) is error,"Encode alignment")
  count=count+req(try(md4.Encode(words,20)) is error,"Encode bounds")
  count=count+req(try(md4.Decode(encoded,6)) is error,"Decode alignment")
  count=count+req(try(md4.Decode(encoded,20)) is error,"Decode bounds")
  count=count+req(md4.blockChecksum(bytes("abc"))==1570836014,"productive checksum")
  count=count+req(len(md4.digest(bytes("retail")))==16,"productive digest")
  print("PASS: "+str(count)+" complete md4 contracts");return 0
end function
