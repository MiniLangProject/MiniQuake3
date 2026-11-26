// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 main-menu presentation using the original pak0.pk3 font artwork.
package mq3.client.playable_menu
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.compat.numeric as numeric
import std.string as strings

/// Number of texture slots required by the module's fixed media layout.
const REQUIRED_TEXTURES=4
/// Width of the native UI's virtual coordinate space before scaling to the display.
const VIRTUAL_WIDTH=640.0
/// Height of the native UI's virtual coordinate space before scaling to the display.
const VIRTUAL_HEIGHT=480.0
/// Prop font metric controlling height in virtual UI coordinates.
const PROP_HEIGHT=27.0
/// Prop font metric controlling gap width in virtual UI coordinates.
const PROP_GAP_WIDTH=3.0
/// Height of a banner-font glyph in virtual menu coordinates.
const BANNER_HEIGHT=36.0
/// Horizontal gap between adjacent banner-font glyphs.
const BANNER_GAP_WIDTH=4.0
/// Stores playable menu asset record, including `key`, `imageName`, `image`, `slot`.
struct Asset
  /// When constructing this record, `load` supplies `item[0]` for this member. Used by `find` during
  /// subsequent processing.
  key
  /// Resolved menu artwork path associated with the loaded image and native texture slot.
  imageName
  /// When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload`
  /// during subsequent processing.
  image
  /// Texture or media-cache slot assigned to this asset for renderer submission.
  slot
end struct
/// Stores playable menu catalog record, including `assets`, `firstTextureSlot`, `textureCount`.
struct Catalog
  /// Loaded menu artwork entries used to draw the playable menu's choices and background.
  assets
  /// First texture-cache slot reserved for this module's media resources.
  firstTextureSlot
  /// Number of texture resources or texture-cache slots represented by this media record.
  textureCount
end struct
/// Stores playable menu point record, including `x`, `y`, `depth`.
struct Point
  /// Horizontal coordinate of a textured menu-artwork vertex in the target window.
  x
  /// Vertical coordinate of a textured menu-artwork vertex in the target window.
  y
  /// When constructing this record, `point` supplies `0.0001` for this member.
  depth
end struct
/// Stores playable menu state, including `selected`, `lastUp`, `lastDown`, `lastEnter`.
struct State
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// When constructing this record, `state` supplies `false` for this member.
  lastUp
  /// When constructing this record, `state` supplies `false` for this member.
  lastDown
  /// When constructing this record, `state` supplies `false` for this member.
  lastEnter
end struct

/// Main-menu action identifier selecting the none destination or operation.
const ACTION_NONE=""
/// Main-menu action identifier selecting the single player destination or operation.
const ACTION_SINGLE_PLAYER="single_player"
/// Main-menu action identifier selecting the multiplayer destination or operation.
const ACTION_MULTIPLAYER="multiplayer"
/// Main-menu action identifier selecting the setup destination or operation.
const ACTION_SETUP="setup"
/// Main-menu action identifier selecting the demos destination or operation.
const ACTION_DEMOS="demos"
/// Main-menu action identifier selecting the cinematics destination or operation.
const ACTION_CINEMATICS="cinematics"
/// Main-menu action identifier selecting the mods destination or operation.
const ACTION_MODS="mods"
/// Main-menu action identifier selecting the exit destination or operation.
const ACTION_EXIT="exit"

/// Creates a `mq3.client.playable_menu.State` record. Initializes the record with the defaults written in this constructor.
function state() return State(0,false,false,false) end function
/// Evaluates playable menu `action` and returns `ACTION_SINGLE_PLAYER`, `ACTION_MULTIPLAYER`, `ACTION_SETUP` and additional values according to its guard/selection conditions.
/// @param index Value tested by `index==0`, `if index==1` and additional values before the calculation continues.
function action(index)
  if index==0 then return ACTION_SINGLE_PLAYER end if
  if index==1 then return ACTION_MULTIPLAYER end if
  if index==2 then return ACTION_SETUP end if
  if index==3 then return ACTION_DEMOS end if
  if index==4 then return ACTION_CINEMATICS end if
  if index==5 then return ACTION_MODS end if
  if index==6 then return ACTION_EXIT end if
  return ACTION_NONE
end function
/// Updates `value.selected`, `value.lastUp`, `value.lastDown`, `value.lastEnter` during playable menu `step`.
/// @param value Mutable playable menu record/storage; this routine assigns `value.selected`, `value.lastUp`, `value.lastDown`, `value.lastEnter`.
/// @param upDown Value assigned to `value.lastUp`.
/// @param downDown Value assigned to `value.lastDown`.
/// @param enterDown Value assigned to `value.lastEnter`.
function step(value,upDown,downDown,enterDown)
  if value==void then return fail("menu state is required") end if
  upEdge=upDown and not value.lastUp;downEdge=downDown and not value.lastDown;enterEdge=enterDown and not value.lastEnter
  if upEdge and not downEdge then value.selected=value.selected-1;if value.selected<0 then value.selected=len(menuEntries())-1 end if end if
  if downEdge and not upEdge then value.selected=value.selected+1;if value.selected>=len(menuEntries()) then value.selected=0 end if end if
  value.lastUp=upDown;value.lastDown=downDown;value.lastEnter=enterDown
  if enterEdge then return action(value.selected) end if
  return ACTION_NONE
end function

/// Creates the playable menu error `7590` with diagnostic text `"Baseq3 menu: "+message`.
/// @param message Argument 2 of `error`; passed as `"Baseq3 menu: "+message`.
function fail(message) return error(7590,"Baseq3 menu: "+message) end function
/// Builds the playable menu `descriptor` sequence from `[key,name]`.
/// @param key Key or control identifier used to select the corresponding playable menu entry.
/// @param name Name used to select or register the corresponding playable menu resource.
function descriptor(key,name) return [key,name] end function
/// Builds the playable menu `descriptors` sequence from `[descriptor("font","menu/art/font1_prop"),descriptor("glow","menu/art/font1_prop_glo"),descriptor("banner","menu/art/font2_prop"),descriptor("cursor","menu/art/3_cursor2")]`.
function descriptors() return [descriptor("font","menu/art/font1_prop"),descriptor("glow","menu/art/font1_prop_glo"),descriptor("banner","menu/art/font2_prop"),descriptor("cursor","menu/art/3_cursor2")] end function
/// Calls `mq3.client.playable_menu.descriptors`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_menu.Asset` and additional helpers from playable menu `load`. The final path returns `Catalog(assets,firstTextureSlot,len(assets))`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function load(archive,firstTextureSlot,maxTextureSlots)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or firstTextureSlot>=512 then return fail("first texture slot outside native range") end if
  if maxTextureSlots<REQUIRED_TEXTURES or firstTextureSlot+REQUIRED_TEXTURES>512 then return fail("insufficient texture slots") end if
  assets=[];definitions=descriptors()
  for index=0 to len(definitions)-1
    item=definitions[index];loaded=materials.loadImage(archive,item[1])
    if loaded==void then return fail("missing retail artwork "+item[1]) end if
    assets=assets+[Asset(item[0],loaded[0],loaded[1],firstTextureSlot+index)]
  end for
  return Catalog(assets,firstTextureSlot,len(assets))
end function
/// Searches the playable menu collection for find, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
/// @param key Key or control identifier used to select the corresponding playable menu entry.
function find(catalog,key)
  if catalog==void then return void end if
  wanted=strings.toLowerAscii(key);for each asset in catalog.assets if strings.toLowerAscii(asset.key)==wanted then return asset end if end for
  return void
end function
/// Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.playable_menu.release` from playable menu `upload`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each asset in catalog.assets if not window.uploadTextureNoMip(asset.slot,asset.image.pixels,asset.image.width,asset.image.height) then release(catalog);return fail("could not upload "+asset.imageName) end if end for
  return true
end function
/// Calls `mq3.platform.playable_window.releaseTexture` from playable menu `release`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
function release(catalog) if catalog!=void then for each asset in catalog.assets window.releaseTexture(asset.slot) end for end if;return void end function

// Exact atlas coordinates from q3_ui/ui_atoms.c for the uppercase alphabet.
/// @param character Value used by `if character==" " then return [0,0,8] end if`.
function propGlyph(character)
  letters=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  glyphs=[[5,4,18],[27,4,18],[48,4,18],[69,4,17],[90,4,13],[106,4,13],[121,4,18],[143,4,17],[164,4,8],[175,4,16],[195,4,18],[216,4,12],[230,4,23],[6,34,18],[27,34,18],[48,34,18],[68,34,18],[90,34,17],[110,34,18],[130,34,14],[146,34,18],[166,34,19],[185,34,29],[215,34,18],[234,34,18],[5,64,14]]
  if character==" " then return [0,0,8] end if
  for index=0 to len(letters)-1 if character==letters[index] then return glyphs[index] end if end for
  return [0,0,-1]
end function
/// Evaluates playable menu `bannerGlyph` and returns `[0,0,12]`, `glyphs[index]`, `[0,0,-1]` according to its guard/selection conditions.
/// @param character Value used by `if character==" " then return [0,0,12] end if`.
function bannerGlyph(character)
  letters=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  glyphs=[[11,12,33],[49,12,31],[85,12,31],[120,12,30],[156,12,21],[183,12,21],[207,12,32],[13,55,30],[49,55,13],[66,55,29],[101,55,31],[135,55,21],[158,55,40],[204,55,32],[12,97,31],[48,97,31],[82,97,30],[118,97,30],[153,97,30],[185,97,25],[213,97,30],[11,139,32],[42,139,51],[93,139,32],[126,139,31],[158,139,25]]
  if character==" " then return [0,0,12] end if
  for index=0 to len(letters)-1 if character==letters[index] then return glyphs[index] end if end for
  return [0,0,-1]
end function
/// Calls `mq3.client.playable_menu.propGlyph` from playable menu `textWidth`. The final path returns `width`.
/// @param text Sequence read at `text[index]`.
/// @param scale Value used by `if glyph[2]>=0 then width=width+(glyph[2]+PROP_GAP_WIDTH)*scale end if end for`.
function textWidth(text,scale)
  width=0.0;for index=0 to len(text)-1 glyph=propGlyph(text[index]);if glyph[2]>=0 then width=width+(glyph[2]+PROP_GAP_WIDTH)*scale end if end for
  if width>0.0 then width=width-PROP_GAP_WIDTH*scale end if;return width
end function
/// Calls `mq3.client.playable_menu.bannerGlyph` from playable menu `bannerWidth`. The final path returns `width`.
/// @param text Sequence read at `text[index]`.
/// @param scale Value used by `if glyph[2]>=0 then width=width+(glyph[2]+BANNER_GAP_WIDTH)*scale end if end for`.
function bannerWidth(text,scale)
  width=0.0;for index=0 to len(text)-1 glyph=bannerGlyph(text[index]);if glyph[2]>=0 then width=width+(glyph[2]+BANNER_GAP_WIDTH)*scale end if end for
  if width>0.0 then width=width-BANNER_GAP_WIDTH*scale end if;return width
end function
/// Creates a `mq3.client.playable_menu.Point` record. Assigns `x` from `x`, `y` from `y`.
/// @param x Value used to initialize `Point.x`.
/// @param y Value used to initialize `Point.y`.
function point(x,y) return Point(x,y,0.0001) end function
/// Calls `mq3.client.playable_menu.point`, `mq3.platform.playable_window.drawTriangle` from playable menu `drawQuad`.
/// @param slot Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`.
/// @param x Horizontal coordinate in the coordinate space used by `drawQuad`.
/// @param y Vertical coordinate in the coordinate space used by `drawQuad`.
/// @param width Width in the coordinate space used by `drawQuad`.
/// @param height Height in the coordinate space used by `drawQuad`.
/// @param u0 Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`.
/// @param v0 Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`.
/// @param u1 Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`.
/// @param v1 Value used by `window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawQuad(slot,x,y,width,height,u0,v0,u1,v1,red,green,blue)
  a=point(x,y);b=point(x+width,y);c=point(x+width,y+height);d=point(x,y+height)
  window.drawTriangle(slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue);window.drawTriangle(slot,a,[u0,v0],1.0,c,[u1,v1],1.0,d,[u0,v1],1.0,red,green,blue);return void
end function
/// Calls `mq3.client.playable_menu.textWidth`, `mq3.client.playable_menu.propGlyph`, `mq3.client.playable_menu.drawQuad` from playable menu `drawProp`.
/// @param asset Record read through `asset.slot`.
/// @param text Sequence read at `text[index]`.
/// @param centerX Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`.
/// @param y Vertical coordinate in the coordinate space used by `drawProp`.
/// @param scale Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`.
/// @param scaleX Value used by `x=(centerX-textWidth(text,scale)/2.0)*scaleX`.
/// @param scaleY Value used by `if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,PROP_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256....`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawProp(asset,text,centerX,y,scale,scaleX,scaleY,red,green,blue)
  x=(centerX-textWidth(text,scale)/2.0)*scaleX
  for index=0 to len(text)-1
    glyph=propGlyph(text[index]);width=glyph[2]*scale
    if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,PROP_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+PROP_HEIGHT)/256.0,red,green,blue) end if
    x=x+(glyph[2]+PROP_GAP_WIDTH)*scale*scaleX
  end for;return void
end function
/// Calls `mq3.client.playable_menu.bannerWidth`, `mq3.client.playable_menu.bannerGlyph`, `mq3.client.playable_menu.drawQuad` from playable menu `drawBanner`.
/// @param asset Record read through `asset.slot`.
/// @param text Sequence read at `text[index]`.
/// @param centerX Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`.
/// @param y Vertical coordinate in the coordinate space used by `drawBanner`.
/// @param scale Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`.
/// @param scaleX Value used by `x=(centerX-bannerWidth(text,scale)/2.0)*scaleX`.
/// @param scaleY Value used by `if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,BANNER_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/25...`.
function drawBanner(asset,text,centerX,y,scale,scaleX,scaleY)
  x=(centerX-bannerWidth(text,scale)/2.0)*scaleX
  for index=0 to len(text)-1
    glyph=bannerGlyph(text[index]);width=glyph[2]*scale
    if glyph[2]>0 then drawQuad(asset.slot,x,y*scaleY,width*scaleX,BANNER_HEIGHT*scale*scaleY,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+BANNER_HEIGHT)/256.0,255,255,255) end if
    x=x+(glyph[2]+BANNER_GAP_WIDTH)*scale*scaleX
  end for;return void
end function
/// Lists the 7 playable menu menu entries strings in their declared order, beginning with `"SINGLE PLAYER"`, `"MULTIPLAYER"`, `"SETUP"`.
function menuEntries() return ["SINGLE PLAYER","MULTIPLAYER","SETUP","DEMOS","CINEMATICS","MODS","EXIT"] end function
/// Computes `134.0+34.0*index` for playable menu `entryY`.
/// @param index Value used by `return 134.0+34.0*index`.
function entryY(index) return 134.0+34.0*index end function
/// Calls `mq3.client.playable_menu.draw`, `mq3.platform.playable_multitexture.setState`, `mq3.client.playable_menu.drawQuad` and additional helpers from playable menu `drawRetailState`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param value Record read through `value.selected`.
/// @param width Width in the coordinate space used by `drawRetailState`.
/// @param height Height in the coordinate space used by `drawRetailState`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawRetailState(catalog,value,width,height,now)
  if catalog==void then draw(width,height);return false end if
  if value==void then return fail("menu state is required") end if
  uiState=multitexture.setState(multitexture.BLEND_ALPHA,false,false);if uiState is error then return uiState end if
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT;drawQuad(-1,0.0,0.0,width,height,0.0,0.0,1.0,1.0,0,0,0)
  drawBanner(find(catalog,"banner"),"QUAKE III ARENA",320.0,28.0,0.72,scaleX,scaleY);entries=menuEntries()
  for index=0 to len(entries)-1
    drawProp(find(catalog,"font"),entries[index],320.0,entryY(index),1.0,scaleX,scaleY,190,32,24)
    if index==value.selected then pulse=numeric.trunc32(128+(now%1000)*127/1000);drawProp(find(catalog,"glow"),entries[index],320.0,entryY(index),1.0,scaleX,scaleY,255,pulse,pulse) end if
  end for
  selectedText=entries[value.selected];cursor=find(catalog,"cursor");cursorX=(320.0-textWidth(selectedText,1.0)/2.0-38.0)*scaleX;drawQuad(cursor.slot,cursorX,(entryY(value.selected)-2.0)*scaleY,32.0*scaleX,32.0*scaleY,0.0,0.0,1.0,1.0,255,255,255)
  drawProp(find(catalog,"font"),"ENTER TO PLAY",320.0,420.0,0.55,scaleX,scaleY,180,180,180)
  resetState=multitexture.setState(multitexture.BLEND_OPAQUE,false,true);if resetState is error then return resetState end if
  return true
end function
/// Adapts `mq3.client.playable_menu.drawRetailState` to playable menu `drawRetail`, returning its result for `catalog, state(), width, height, now`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_menu.drawRetailState`.
/// @param width Argument 3 of `mq3.client.playable_menu.drawRetailState`.
/// @param height Argument 4 of `mq3.client.playable_menu.drawRetailState`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_menu.drawRetailState`.
function drawRetail(catalog,width,height,now) return drawRetailState(catalog,state(),width,height,now) end function

// Dependency-free bitmap fallback for runs without the retail PK3.
/// @param character Value used by `if character=="A" then return [14,17,17,31,17,17,17] end if`.
function glyph(character)
  if character=="A" then return [14,17,17,31,17,17,17] end if
  if character=="C" then return [14,17,16,16,16,17,14] end if
  if character=="D" then return [30,17,17,17,17,17,30] end if
  if character=="E" then return [31,16,16,30,16,16,31] end if
  if character=="I" then return [31,4,4,4,4,4,31] end if
  if character=="K" then return [17,18,20,24,20,18,17] end if
  if character=="L" then return [16,16,16,16,16,16,31] end if
  if character=="M" then return [17,27,21,21,17,17,17] end if
  if character=="N" then return [17,25,21,19,17,17,17] end if
  if character=="O" then return [14,17,17,17,17,17,14] end if
  if character=="P" then return [30,17,17,30,16,16,16] end if
  if character=="Q" then return [14,17,17,17,21,18,13] end if
  if character=="R" then return [30,17,17,30,20,18,17] end if
  if character=="S" then return [15,16,16,14,1,1,30] end if
  if character=="T" then return [31,4,4,4,4,4,4] end if
  if character=="U" then return [17,17,17,17,17,17,14] end if
  if character=="V" then return [17,17,17,17,17,10,4] end if
  if character=="W" then return [17,17,17,21,21,27,17] end if
  if character=="Y" then return [17,17,10,4,4,4,4] end if
  if character=="3" then return [30,1,1,14,1,1,30] end if
  return [0,0,0,0,0,0,0]
end function
/// Calls `mq3.client.playable_menu.glyph`, `mq3.platform.playable_window.lineNative` from playable menu `drawText`.
/// @param text Sequence read at `text[index]`.
/// @param x Horizontal coordinate in the coordinate space used by `drawText`.
/// @param y Vertical coordinate in the coordinate space used by `drawText`.
/// @param scale Value used by `for row=0 to 6 for column=0 to 4 if (rows[row]&(1<<(4-column)))!=0 then x0=cursor+column*scale`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawText(text,x,y,scale,red,green,blue)
  cursor=x
  for index=0 to len(text)-1 rows=glyph(text[index]);for row=0 to 6 for column=0 to 4 if (rows[row]&(1<<(4-column)))!=0 then x0=cursor+column*scale;y0=y+row*scale;window.lineNative(x0,y0,x0+scale-1,y0,red,green,blue) end if end for end for;cursor=cursor+scale*6 end for
  return void
end function
/// Calls `mq3.client.playable_menu.drawText` from playable menu `draw`.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
function draw(width,height)
  x=width/2-180;y=height/2-95;drawText("MINIQUAKE3",x,y,6,255,190,64);drawText("ENTER PLAY",x+18,y+70,4,220,235,240);drawText("ESC QUIT",x+42,y+110,4,150,175,185);drawText("WASD MOVE",x+30,y+160,3,72,205,224);return void
end function
