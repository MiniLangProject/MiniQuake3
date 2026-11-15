// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.baseq3_match_display as display
import mq3.compat.numeric as n
import mq3.platform.playable_window as window
import std.fs as fs
function req(value,text) if not value then return error(7586,text) end if;return 1 end function
function main(args)
  count=0;media=display.Media("synthetic",void,5,void);batch=display.beginGlyphBatch(media)
  count=count+req(batch.count==0 and batch.capacity>=8,"persistent glyph batch starts empty")
  drawn=display.appendString(media,"^1A^2B",0,0,8,16,1.0,1.0,255,255,255,true);if drawn is error then return drawn end if
  count=count+req(media.glyphBatch.count==8,"two shadows and two colored glyphs")
  data=media.glyphBatch.data;stride=window.TRIANGLE_BATCH_RECORD_BYTES
  count=count+req(n.readI32(data,0)==5 and n.readI32(data,4)== -1,"charset texture and no lightmap")
  count=count+req(n.readU32(data,20)==n.floatBits(2.0) and n.readU32(data,24)==n.floatBits(18.0) and n.readU32(data,52)==n.floatBits(2.0) and n.readU32(data,56)==n.floatBits(2.0),"RB_StretchPic indexes and shadow offset")
  count=count+req(n.readU32(data,32)==n.floatBits(0.0625) and n.readU32(data,36)==n.floatBits(0.3125),"retail atlas glyph UV")
  count=count+req(data[116]==0 and data[117]==0 and data[118]==0 and data[119]==255,"black vertex shadow with full texture alpha")
  at=4*stride+116;count=count+req(data[at]==255 and data[at+1]==0 and data[at+2]==0 and data[at+3]==255,"first inline color escape")
  at=6*stride+116;count=count+req(data[at]==0 and data[at+1]==255 and data[at+2]==0 and data[at+3]==255,"second inline color escape")
  if len(args)>0 then written=fs.writeAllBytes(args[0],slice(data,0,8*stride));if written is error then return written end if end if
  before=media.glyphBatch.count;display.appendGlyphCode(media,32,0,0,8,16,1.0,1.0,255,255,255)
  count=count+req(media.glyphBatch.count==before,"spaces advance layout without native geometry")
  previous=media.glyphBatch;display.beginGlyphBatch(media);count=count+req(media.glyphBatch==previous and media.glyphBatch.count==0,"frame reset reuses batch storage")
  for index=0 to 299 drawn=display.appendGlyphCode(media,65,index*8,0,8,16,1.0,1.0,255,255,255);if drawn is error then return drawn end if end for
  count=count+req(media.glyphBatch.count==600 and media.glyphBatch.capacity>=600,"geometric batch growth retains all glyphs")
  count=count+req(n.readU32(media.glyphBatch.data,20)==n.floatBits(0.0) and n.readU32(media.glyphBatch.data,598*stride+20)==n.floatBits(299*8.0),"batch growth preserves prefix and suffix")
  count=count+req(try(display.appendString(media,"A",0,0,0,16,1.0,1.0,255,255,255,false)) is error,"character dimensions remain checked")
  display.beginGlyphBatch(media);count=count+req(display.flushGlyphBatch(media)==0,"empty batch makes no native draw")
  print "PASS: "+str(count)+" Baseq3 glyph-batch contracts";return 0
end function
