import mq3.renderer.tr_font_runtime as font
import mq3.compat.numeric as n
function show(label,value) print(label+"|"+str(value.left)+","+str(value.right)+","+str(value.width)+","+str(value.top)+","+str(value.bottom)+","+str(value.height)+","+str(value.pitch)) end function
function main(args)
  cursor=font.createCursor(bytes([0x78,0x56,0x34,0x12,0xff,0xff,0xff,0xff]));a=font.readInt(cursor);b=font.readInt(cursor);print("int|"+str(a)+","+str(b)+","+str(cursor.offset))
  cursor=font.createCursor(bytes([0,0,0x80,0x3f,0,0,0x20,0xc0]));a=n.floatBits(font.readFloat(cursor));b=n.floatBits(font.readFloat(cursor));print("float|"+str(a)+","+str(b)+","+str(cursor.offset))
  show("metric",font.R_GetGlyphInfo(font.Metrics(65,130,127,129,192)));show("negative",font.R_GetGlyphInfo(font.Metrics(-65,64,-1,64,64)))
  tga=font.tgaBytes(bytes([1,2,3,4,10,20,30,40]),2,1);line="tga|"+str(len(tga));for each value in tga line=line+","+str(value) end for;print(line);return 0
end function
