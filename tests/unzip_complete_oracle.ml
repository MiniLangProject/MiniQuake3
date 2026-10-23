import mq3.format.unzip as unzip

function main(args)
  print("cmp "+str(unzip.strcmpcasenosensitive_internal("maps/Q3DM1.BSP","MAPS/q3dm1.bsp"))+" "+str(unzip.unzStringFileNameCompare("A","a",1))+" "+str(unzip.unzStringFileNameCompare("A","a",2)))
  date=unzip.unzlocal_DosDateToTmuDate((44<<25)|(7<<21)|(9<<16)|(13<<11)|(27<<5)|15)
  print("date "+str(date.tmYear)+" "+str(date.tmMon)+" "+str(date.tmMday)+" "+str(date.tmHour)+" "+str(date.tmMin)+" "+str(date.tmSec))
  print("adler "+str(unzip.adler32(1,bytes("Wikipedia")))+" "+str(unzip.adler32(1,bytes("Quake III Arena"))))
  data=bytes([0x34,0x12,0x78,0x56,0x34,0x12]);short=unzip.unzlocal_getShort(data,0);long=unzip.unzlocal_getLong(data,2)
  print("little "+str(short[1])+" "+str(long[1]))
end function
