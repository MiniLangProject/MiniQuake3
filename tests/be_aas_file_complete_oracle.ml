import mq3.format.aas as aas

function hex8(value)
  digits=bytes("0123456789abcdef");text="";shift=28;while shift>=0 text=text+decode(bytes([digits[(value>>shift)&15]]));shift=shift-4 end while;return text
end function
function main(args)
  data=bytes(16,0);for index=0 to 15 data[index]=index*13+7 end for;coded=aas.ddata(data);checksum=0;for each value in coded checksum=(checksum*33+value)&0xffffffff end for
  print("abi|"+hex8(aas.AAS_ID)+"|"+str(aas.AAS_VERSION_OLD)+"|"+str(aas.AAS_VERSION)+"|"+str(aas.LUMP_COUNT)+"|32,12,20,8,4,24,4,48,28,44,12,20")
  print("tail|4,16,124|"+str(aas.PRESENCE_NONE)+","+str(aas.PRESENCE_NORMAL)+","+str(aas.PRESENCE_CROUCH)+"|"+str(aas.MAX_TRAVELTYPES)+","+hex8(aas.TRAVELTYPE_MASK)+","+hex8(aas.AREACONTENTS_MODELNUM)+"|"+str(checksum));return 0
end function
