import mq3.renderer.tr_font_runtime as font
import mq3.format.pk3 as pk3
import mq3.compat.numeric as n
import std.fs as fs

struct Capture names end struct
struct Generator rasters images imageName alpha end struct
function shader(capture,name) capture.names=capture.names+[name];return 200+len(capture.names) end function
function rasterize(generator,source,pointSize,index) generator.rasters=generator.rasters+1;return font.Raster(font.Metrics(0,64,64,64,64),font.FT_OUTLINE,bytes([index&255,0,0,0]),font.PIXEL_MODE_GRAY) end function
function createImage(generator,name,rgba,width,height) generator.images=generator.images+1;generator.imageName=name;generator.alpha=rgba[3];return 900+generator.images end function
function req(ok,label) if not ok then return error(7799,"tr_font contract: "+label) end if;return 1 end function

function main(args)
  if len(args)!=2 then return 2 end if
  count=0
  cursor=font.createCursor(bytes([0x78,0x56,0x34,0x12,0xff,0xff,0xff,0xff]));count=count+req(font.readInt(cursor)==0x12345678 and font.readInt(cursor)==-1 and cursor.offset==8,"little-endian signed integers")
  count=count+req((try(font.readInt(cursor))) is error,"integer truncation")
  cursor=font.createCursor(bytes([0,0,0x80,0x3f,0,0,0x20,0xc0]));count=count+req(n.floatBits(font.readFloat(cursor))==0x3f800000 and n.floatBits(font.readFloat(cursor))==0xc0200000 and cursor.offset==8,"little-endian binary32")
  count=count+req((try(font.readFloat(cursor))) is error,"float truncation")

  metrics=font.Metrics(65,130,127,129,192);bounds=font.R_GetGlyphInfo(metrics)
  count=count+req(bounds.left==64 and bounds.right==256 and bounds.width==3 and bounds.top==128 and bounds.bottom==-64 and bounds.height==3 and bounds.pitch==4,"FreeType 26.6 ceil floor and pitch")
  negative=font.R_GetGlyphInfo(font.Metrics(-65,64,-1,64,64));count=count+req(negative.left==-128 and negative.right==0 and negative.width==2 and negative.top==0 and negative.bottom==-128 and negative.height==2,"negative FreeType metrics")
  coverage=bytes([1,2,3,4,5,6,7,8,9,10,11,12]);rendered=font.R_RenderGlyph(metrics,font.FT_OUTLINE,coverage,font.PIXEL_MODE_GRAY)
  count=count+req(rendered.bitmap.width==3 and rendered.bitmap.rows==3 and rendered.bitmap.pitch==4 and rendered.bitmap.buffer==coverage and rendered.bitmap.numGrays==256,"outline coverage bitmap")
  count=count+req(rendered.glyph.height==3 and rendered.glyph.pitch==4 and rendered.glyph.top==2 and rendered.glyph.bottom==-64 and rendered.glyph.xSkip==0,"render glyph metrics")
  count=count+req(font.R_RenderGlyph(metrics,0,bytes([]),font.PIXEL_MODE_GRAY).bitmap==void,"non-outline glyph rejected like C")
  count=count+req((try(font.R_RenderGlyph(metrics,font.FT_OUTLINE,bytes([1]),font.PIXEL_MODE_GRAY))) is error,"coverage extent checked")

  small=font.Metrics(0,128,64,64,128);atlas=bytes(256*256,0);calc=font.RE_ConstructGlyphInfo(atlas,5,7,0,small,font.FT_OUTLINE,bytes([9,8,7,6]),font.PIXEL_MODE_GRAY,true)
  count=count+req(not calc.placed and calc.x==5 and calc.y==7 and calc.maxHeight==1 and calc.glyph.xSkip==3 and atlas[7*256+5]==0,"height pass without atlas mutation")
  placed=font.RE_ConstructGlyphInfo(atlas,5,7,0,small,font.FT_OUTLINE,bytes([9,8,7,6]),font.PIXEL_MODE_GRAY,false)
  count=count+req(placed.placed and placed.x==10 and placed.y==7 and atlas[7*256+5]==9 and atlas[7*256+8]==6,"grayscale atlas placement")
  count=count+req(placed.glyph.imageWidth==4 and placed.glyph.imageHeight==1 and placed.glyph.s==5.0/256.0 and placed.glyph.t==7.0/256.0 and placed.glyph.s2==9.0/256.0 and placed.glyph.t2==8.0/256.0,"glyph atlas coordinates")
  monoMetrics=font.Metrics(0,512,64,64,64);monoAtlas=bytes(256*256,0);monoCoverage=bytes([0xa0,0,0,0,0,0,0,0]);mono=font.RE_ConstructGlyphInfo(monoAtlas,0,0,0,monoMetrics,font.FT_OUTLINE,monoCoverage,font.PIXEL_MODE_MONO,false)
  count=count+req(mono.placed and monoAtlas[0]==255 and monoAtlas[1]==0 and monoAtlas[2]==255 and monoAtlas[3]==0,"monochrome bit expansion")
  wrapped=font.RE_ConstructGlyphInfo(bytes(256*256,0),246,2,1,monoMetrics,font.FT_OUTLINE,monoCoverage,font.PIXEL_MODE_MONO,false);count=count+req(wrapped.placed and wrapped.x==9 and wrapped.y==4,"atlas row wrapping")
  full=font.RE_ConstructGlyphInfo(bytes(256*256,0),246,253,1,monoMetrics,font.FT_OUTLINE,monoCoverage,font.PIXEL_MODE_MONO,false);count=count+req(not full.placed and full.x==-1 and full.y==-1,"atlas page exhaustion")
  count=count+req((try(font.RE_ConstructGlyphInfo(bytes(4,0),0,0,0,small,font.FT_OUTLINE,bytes([0,0,0,0]),font.PIXEL_MODE_GRAY,false))) is error,"atlas extent checked")

  rgba=bytes([1,2,3,4,10,20,30,40]);tga=font.tgaBytes(rgba,2,1);count=count+req(len(tga)==26 and tga[2]==2 and tga[12]==2 and tga[14]==1 and tga[16]==32,"TGA header")
  count=count+req(slice(tga,18,8)==bytes([3,2,1,4,30,20,10,40]),"TGA RGBA to BGRA conversion")
  count=count+req((try(font.tgaBytes(bytes([1]),1,1))) is error,"TGA extent checked")
  written=font.WriteTGA(args[1],rgba,2,1);disk=fs.readAllBytes(args[1]);count=count+req(written==26 and disk==tga,"TGA productive filesystem write")

  archive=pk3.open(args[0]);if archive is error then return archive end if;state=font.create(archive);capture=Capture([])
  count=count+req(font.R_InitFreeType(state,true) and state.freeTypeInitialized and state.registeredFontCount==0,"FreeType lifecycle init")
  first=font.RE_RegisterFont(state,capture,shader,"fonts/example.ttf",0);count=count+req(first.found and first.path=="fonts/fontImage_12.dat" and state.registeredFontCount==1,"pre-rendered default point size")
  cached=font.RE_RegisterFont(state,capture,shader,"ignored.ttf",12);count=count+req(cached.found and state.registeredFontCount==1 and len(capture.names)==1,"font point-size cache")
  sizes=[16,20,24,32,48];for each size in sizes loaded=font.RE_RegisterFont(state,capture,shader,"ignored.ttf",size);if not loaded.found then return error(7799,"font size missing") end if end for
  count=count+req(state.registeredFontCount==font.MAX_FONTS,"six-font registry capacity")
  capped=font.RE_RegisterFont(state,capture,shader,"ignored.ttf",72);count=count+req(not capped.found and capped.path=="fonts/fontImage_72.dat" and state.registeredFontCount==6,"seventh font rejected")
  font.R_DoneFreeType(state);count=count+req(not state.freeTypeInitialized and state.registeredFontCount==0 and len(state.registry.fonts)==0,"FreeType lifecycle shutdown")
  generatedState=font.create(archive);generator=Generator(0,0,"",0);backend=font.createBackend(generator,rasterize,createImage,false,"");count=count+req(font.R_InitFreeType(generatedState,backend),"FreeType raster backend init")
  generated=font.RE_RegisterFont(generatedState,Capture([]),shader,"fonts/test.ttf",18);count=count+req(generated.found and generated.registeredGlyphs==255 and generatedState.registeredFontCount==1,"runtime font generation")
  count=count+req(generator.rasters==510 and generator.images==1 and generator.imageName=="fonts/fontImage_0_18.tga" and generator.alpha==0,"all glyphs rasterized into one page")
  count=count+req(n.readI32(generated.data,16)==2 and n.readI32(generated.data,44)==901 and fontAbiName(generated.data,48,32)==generator.imageName,"generated glyph ABI")
  count=count+req(n.floatBits(n.bitsFloat(n.readU32(generated.data,20480)))==n.floatBits(48.0/18.0),"generated glyph scale")
  print("PASS: "+str(count)+" complete tr_font contracts");return 0
end function

function fontAbiName(data,offset,capacity) count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while;return decode(slice(data,offset,count)) end function
