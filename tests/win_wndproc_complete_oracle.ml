import mq3.platform.win_wndproc_runtime as win
function hexDigit(value) chars=bytes("0123456789abcdef");return decode(slice(chars,value&15,1)) end function
function hex8(value) result="";shift=28;while shift>=0 result=result+hexDigit(value>>shift);shift=shift-4 end while;return result end function
function main(args)
  values=[0x00100000,0x01480000,0x00480000,0x011c0000,0x01350000,0x01450000,0x003b0000,0x00580000,0x00800000]
  for each value in values print(hex8(value)+"|"+str(win.MapKey(value))) end for
end function
