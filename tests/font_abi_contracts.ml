import mq3.vm.font_abi as font
import mq3.format.pk3 as pk3
import mq3.compat.numeric as n

struct Capture names end struct
function shader(capture,name) capture.names=capture.names+[name];return 100+len(capture.names) end function
function req(ok,message) if not ok then return error(7693,message) end if;return 1 end function

function main(args)
  if len(args)!=1 then return 2 end if
  count=0;archive=pk3.open(args[0]);if archive is error then return archive end if;registry=font.create(archive);capture=Capture([])
  count=count+req(font.FONT_INFO_SIZE==20548 and font.GLYPH_SIZE==80 and font.GLYPH_SCALE_OFFSET==20480,"fontInfo_t layout constants")
  result=font.load(registry,capture,shader,"fonts/arial.ttf",16);count=count+req(result.found and result.path=="fonts/fontImage_16.dat","point-size cache file loaded")
  count=count+req(len(result.data)==font.FONT_INFO_SIZE and result.registeredGlyphs==2,"complete font structure returned")
  count=count+req(capture.names==["fonts/fontImage_16_0.tga","fonts/fontImage_16_1.tga"],"glyph shader names registered")
  count=count+req(n.readI32(result.data,font.GLYPH_HANDLE_OFFSET)==101 and n.readI32(result.data,font.GLYPH_SIZE+font.GLYPH_HANDLE_OFFSET)==102,"glyph handles rebound")
  count=count+req(n.readI32(result.data,255*font.GLYPH_SIZE+font.GLYPH_HANDLE_OFFSET)==777,"glyph 255 retains cached handle like Baseq3")
  count=count+req(font.cString(result.data,font.FONT_NAME_OFFSET,font.FONT_NAME_BYTES)=="fonts/fontImage_16.dat","font cache name rewritten")
  cached=font.load(registry,capture,shader,"ignored.ttf",16);count=count+req(cached.found and len(capture.names)==2 and cached.data==result.data,"registered point size cached")
  missing=font.load(registry,capture,shader,"missing.ttf",72);count=count+req(not missing.found and missing.data==void and missing.path=="fonts/fontImage_72.dat","missing font leaves QVM output untouched")
  count=count+req(font.pathFor(0)=="fonts/fontImage_12.dat","invalid point size defaults to 12")
  print("PASS: "+str(count)+" font ABI contracts");return 0
end function
