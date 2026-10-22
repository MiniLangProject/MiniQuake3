import mq3.client.cl_ui_runtime as clui
import mq3.compat.numeric as n
function sample(bits) print(str(bits)+"|"+str(clui.FloatAsInt(n.bitsFloat(bits)))) end function
function main(args) sample(0);sample(0x80000000);sample(0x3f800000);sample(0xc0200000);sample(0x7f800000);sample(0x7fc12345);return 0 end function
