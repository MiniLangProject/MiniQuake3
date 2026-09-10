// SPDX-License-Identifier: GPL-2.0-or-later
// Quake III .skin parsing and PK3-backed image resolution for player models.
package mq3.renderer.player_skins
import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import std.string as strings

const MAX_QPATH=64
const SARGE_LOWER="models/players/sarge/lower_default.skin"
const SARGE_UPPER="models/players/sarge/upper_default.skin"
const SARGE_HEAD="models/players/sarge/head_default.skin"

struct Mapping surface shaderName end struct
struct Skin path mappings tags end struct
struct Binding surface shaderName imageName image end struct
struct ResolvedSkin path bindings tags end struct
struct SargeDefault lower upper head uniqueImages scriptCount end struct

function fail(message) return error(7520,"player skin: "+message) end function

function textRange(data,first,last)
  while first<last and data[first]<=32 first=first+1 end while
  while last>first and data[last-1]<=32 last=last-1 end while
  return decode(slice(data,first,last-first))
end function

function parseLine(data,first,last,lineNumber,mappings,tags)
  comment=last;i=first
  while i+1<last
    if data[i]==47 and data[i+1]==47 then comment=i;break end if
    i=i+1
  end while
  last=comment
  while first<last and data[first]<=32 first=first+1 end while
  while last>first and data[last-1]<=32 last=last-1 end while
  if first==last then return [mappings,tags] end if
  comma=-1;i=first
  while i<last if data[i]==44 then comma=i;break end if;i=i+1 end while
  if comma<0 then return fail("line "+str(lineNumber)+" has no comma") end if
  surface=textRange(data,first,comma);shaderName=textRange(data,comma+1,last)
  if surface=="" then return fail("line "+str(lineNumber)+" has no surface") end if
  if len(bytes(surface))>=MAX_QPATH then return fail("line "+str(lineNumber)+" surface exceeds MAX_QPATH") end if
  if strings.startsWith(strings.toLowerAscii(surface),"tag_") then
    return [mappings,tags+1]
  end if
  if shaderName=="" then return fail("line "+str(lineNumber)+" has no shader") end if
  if len(bytes(shaderName))>=MAX_QPATH then return fail("line "+str(lineNumber)+" shader exceeds MAX_QPATH") end if
  return [mappings+[Mapping(surface,shaderName)],tags]
end function

function parse(text)
  if text==void then return fail("missing text") end if
  data=text;if typeof(data)=="string" then data=bytes(data) end if
  if typeof(data)!="bytes" then return fail("text must be bytes or string") end if
  mappings=[];tags=0;first=0;lineNumber=1
  while first<len(data)
    last=first
    while last<len(data) and data[last]!=10 and data[last]!=13 last=last+1 end while
    parsed=parseLine(data,first,last,lineNumber,mappings,tags);if parsed is error then return parsed end if
    mappings=parsed[0];tags=parsed[1]
    if last<len(data) and data[last]==13 then last=last+1 end if
    if last<len(data) and data[last]==10 then last=last+1 end if
    first=last;lineNumber=lineNumber+1
  end while
  return Skin("",mappings,tags)
end function

function load(archive,path)
  if archive==void or path==void or path=="" then return fail("archive and path are required") end if
  source=pk3.read(archive,path);if source is error then return source end if
  skin=parse(source);if skin is error then return skin end if
  skin.path=path;return skin
end function

function resolve(archive,skin,shaderIndex)
  if archive==void or skin==void then return fail("archive and skin are required") end if
  bindings=[]
  for each mapping in skin.mappings
    imageRequest=materials.mappedImageName(shaderIndex,mapping.shaderName)
    if imageRequest==void then imageRequest=mapping.shaderName end if
    loaded=materials.loadImage(archive,imageRequest)
    if loaded==void and imageRequest!=mapping.shaderName then loaded=materials.loadImage(archive,mapping.shaderName) end if
    if loaded==void then return fail("image not found for "+mapping.surface+": "+mapping.shaderName) end if
    bindings=bindings+[Binding(mapping.surface,mapping.shaderName,loaded[0],loaded[1])]
  end for
  return ResolvedSkin(skin.path,bindings,skin.tags)
end function

function loadResolved(archive,path,shaderIndex)
  skin=load(archive,path);if skin is error then return skin end if
  return resolve(archive,skin,shaderIndex)
end function

function addUnique(names,skin)
  for each binding in skin.bindings
    found=false
    for each name in names if stringEqualsIgnoreCaseAscii(name,binding.imageName) then found=true;break end if end for
    if not found then names=names+[binding.imageName] end if
  end for
  return names
end function

function loadSargeDefault(archive)
  if archive==void then return fail("archive is required") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  lower=loadResolved(archive,SARGE_LOWER,scripts[0]);if lower is error then return lower end if
  upper=loadResolved(archive,SARGE_UPPER,scripts[0]);if upper is error then return upper end if
  head=loadResolved(archive,SARGE_HEAD,scripts[0]);if head is error then return head end if
  names=addUnique([],lower);names=addUnique(names,upper);names=addUnique(names,head)
  return SargeDefault(lower,upper,head,len(names),scripts[1])
end function
