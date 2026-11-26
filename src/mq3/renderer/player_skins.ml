// SPDX-License-Identifier: GPL-2.0-or-later
// Quake III .skin parsing and PK3-backed image resolution for player models.
package mq3.renderer.player_skins
import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import std.string as strings

/// Capacity of a Quake virtual-path buffer, including the terminating byte in the native ABI.
const MAX_QPATH=64
/// Default virtual path of the Sarge lower-body MD3 model.
const SARGE_LOWER="models/players/sarge/lower_default.skin"
/// Default virtual path of the Sarge upper-body MD3 model.
const SARGE_UPPER="models/players/sarge/upper_default.skin"
/// Default virtual path of the Sarge head MD3 model.
const SARGE_HEAD="models/players/sarge/head_default.skin"

/// Data record for `mq3.renderer.player_skins.Mapping`; groups `surface`, `shaderName`.
struct Mapping
  /// Model-surface name to which the skin assigns its shader.
  surface
  /// Shader assigned by the skin file to its named model surface.
  shaderName
end struct
/// Data record for `mq3.renderer.player_skins.Skin`; groups `path`, `mappings`, `tags`.
struct Skin
  /// Filesystem or virtual asset path associated with this record.
  path
  /// Surface-name to shader-name assignments read from the skin file.
  mappings
  /// Attachment tag names discovered while loading the skin or model.
  tags
end struct
/// Data record for `mq3.renderer.player_skins.Binding`; groups `surface`, `shaderName`, `imageName`, `image`.
struct Binding
  /// Model-surface name associated with the resolved shader and image.
  surface
  /// Resolved skin shader whose image is bound to the model surface.
  shaderName
  /// Virtual image path selected for this texture or material.
  imageName
  /// Decoded image selected by the skin's resolved surface shader.
  image
end struct
/// Data record for `mq3.renderer.player_skins.ResolvedSkin`; groups `path`, `bindings`, `tags`.
struct ResolvedSkin
  /// Filesystem or virtual asset path associated with this record.
  path
  /// Bindings associating names or handles with their backing resources.
  bindings
  /// Attachment tag names discovered while loading the skin or model.
  tags
end struct
/// Data record for `mq3.renderer.player_skins.SargeDefault`; groups `lower`, `upper`, `head`, `uniqueImages`, `scriptCount`.
struct SargeDefault
  /// Lower-body player model or its assembled animation state.
  lower
  /// Upper-body player model or its assembled animation state.
  upper
  /// Head player model or its assembled animation state.
  head
  /// Distinct images used by the resolved multipart player skin.
  uniqueImages
  /// Number of shader script sources loaded into the catalog.
  scriptCount
end struct

/// Creates error `7520` with message `"player skin: "+message`.
/// @param message Input used in the result expression `error(7520,"player skin: "+message)`.
function fail(message) return error(7520,"player skin: "+message) end function

/// Returns `decode(slice(data,first,last-first))` from `mq3.renderer.player_skins.textRange`.
/// @param data Argument 1 supplied to `slice`.
/// @param first Argument 2 supplied to `slice`.
/// @param last Input used by `while first<last and data[first]<=32 first=first+1`.
function textRange(data,first,last)
  while first<last and data[first]<=32 first=first+1 end while
  while last>first and data[last-1]<=32 last=last-1 end while
  return decode(slice(data,first,last-first))
end function

/// Computes `parseLine` from `[mappings+[Mapping(surface,shaderName)],tags]` using `mq3.renderer.player_skins.textRange`, `std.string.startsWith`, `std.string.toLowerAscii`.
/// @param data Value forwarded as `data` to `mq3.renderer.player_skins.textRange`.
/// @param first Value forwarded as `first` to `mq3.renderer.player_skins.textRange`.
/// @param last Value forwarded as `last` to `mq3.renderer.player_skins.textRange`.
/// @param lineNumber Input tested by `comma<0`.
/// @param mappings Input tested by `first==last`.
/// @param tags Input tested by `first==last`.
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

/// Builds `mq3.renderer.player_skins.Skin` for `mq3.renderer.player_skins.parse`.
/// @param text Input tested by `text==void`.
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

/// Builds `skin.path` in `mq3.renderer.player_skins.load`; returns `skin`.
/// @param archive Argument 1 supplied to `mq3.format.pk3.read`.
/// @param path Value assigned to `skin.path`.
function load(archive,path)
  if archive==void or path==void or path=="" then return fail("archive and path are required") end if
  source=pk3.read(archive,path);if source is error then return source end if
  skin=parse(source);if skin is error then return skin end if
  skin.path=path;return skin
end function

/// Builds `mq3.renderer.player_skins.ResolvedSkin` using `mq3.renderer.playable_materials.mappedImageName`, `mq3.renderer.playable_materials.loadImage`.
/// @param archive Argument 1 supplied to `mq3.renderer.playable_materials.loadImage`.
/// @param skin Record providing `skin.mappings`, `skin.path`, `skin.tags`.
/// @param shaderIndex Argument 1 supplied to `mq3.renderer.playable_materials.mappedImageName`.
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

/// Returns `resolve(archive,skin,shaderIndex)` from `mq3.renderer.player_skins.loadResolved`; earlier branches return `skin`.
/// @param archive Value forwarded as `archive` to `mq3.renderer.player_skins.load`.
/// @param path Value forwarded as `path` to `mq3.renderer.player_skins.load`.
/// @param shaderIndex Value forwarded as `shaderIndex` to `mq3.renderer.player_skins.resolve`.
function loadResolved(archive,path,shaderIndex)
  skin=load(archive,path);if skin is error then return skin end if
  return resolve(archive,skin,shaderIndex)
end function

/// Computes `addUnique` from `names+[binding.imageName]` using `stringEqualsIgnoreCaseAscii`.
/// @param names Sequence traversed as `name` while producing this result.
/// @param skin Record providing `skin.bindings`.
function addUnique(names,skin)
  for each binding in skin.bindings
    found=false
    for each name in names if stringEqualsIgnoreCaseAscii(name,binding.imageName) then found=true;break end if end for
    if not found then names=names+[binding.imageName] end if
  end for
  return names
end function

/// Builds `mq3.renderer.player_skins.SargeDefault` using `mq3.renderer.playable_materials.buildScriptIndex`.
/// @param archive Argument 1 supplied to `mq3.renderer.playable_materials.buildScriptIndex`.
function loadSargeDefault(archive)
  if archive==void then return fail("archive is required") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  lower=loadResolved(archive,SARGE_LOWER,scripts[0]);if lower is error then return lower end if
  upper=loadResolved(archive,SARGE_UPPER,scripts[0]);if upper is error then return upper end if
  head=loadResolved(archive,SARGE_HEAD,scripts[0]);if head is error then return head end if
  names=addUnique([],lower);names=addUnique(names,upper);names=addUnique(names,head)
  return SargeDefault(lower,upper,head,len(names),scripts[1])
end function
