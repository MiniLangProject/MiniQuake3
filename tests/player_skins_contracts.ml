import mq3.format.pk3 as pk3
import mq3.renderer.player_skins as skins

function require(ok,label) if not ok then return error(7521,"player skins contract: "+label) end if;return 1 end function

function main(args)
  if len(args)!=1 then return error(7521,"usage: player_skins_contracts <fixture.pk3>") end if
  count=0
  parsed=skins.parse(" // heading\r\nl_legs, models/players/sarge/band.tga // paint\r\ntag_torso,\r\n\r\nh_boot,models/players/sarge/boot\n")
  count=count+require(len(parsed.mappings)==2,"mapping count")
  count=count+require(parsed.tags==1,"tag count")
  count=count+require(parsed.mappings[0].surface=="l_legs","trimmed surface")
  count=count+require(parsed.mappings[0].shaderName=="models/players/sarge/band.tga","trimmed shader")
  count=count+require(parsed.mappings[1].shaderName=="models/players/sarge/boot","extensionless shader")
  count=count+require(len(skins.parse("").mappings)==0,"empty skin")
  count=count+require(try(skins.parse("broken")) is error,"missing comma rejected")
  count=count+require(try(skins.parse(",image.tga")) is error,"empty surface rejected")
  count=count+require(try(skins.parse("mesh,")) is error,"empty shader rejected")
  count=count+require(skins.parse("TAG_HEAD,").tags==1,"tag case fold")
  archive=pk3.open(args[0]);count=count+require(not (archive is error),"fixture archive")
  suite=skins.loadSargeDefault(archive);if suite is error then return suite end if
  count=count+require(len(suite.lower.bindings)==1,"lower binding")
  count=count+require(len(suite.upper.bindings)==2,"upper bindings")
  count=count+require(len(suite.head.bindings)==2,"head bindings")
  count=count+require(suite.lower.tags==1 and suite.upper.tags==3 and suite.head.tags==1,"suite tags")
  count=count+require(suite.lower.bindings[0].surface=="l_legs","lower surface")
  count=count+require(suite.lower.bindings[0].imageName=="models/players/sarge/band.tga","direct TGA")
  count=count+require(suite.upper.bindings[0].imageName=="models/players/sarge/boot.tga","extension candidate")
  count=count+require(suite.upper.bindings[1].shaderName=="models/players/sarge/band_shader" and suite.upper.bindings[1].imageName=="models/players/sarge/band.tga","shader stage mapping")
  count=count+require(suite.head.bindings[0].imageName=="models/players/sarge/cigar.tga","head texture")
  count=count+require(suite.head.bindings[0].image.width==1 and suite.head.bindings[0].image.height==1,"decoded dimensions")
  count=count+require(suite.head.bindings[0].image.pixels==bytes([30,20,10,255]),"decoded RGBA")
  count=count+require(suite.uniqueImages==3,"unique images")
  count=count+require(suite.scriptCount==1,"shader script count")
  missing=skins.parse("mesh,models/players/sarge/missing.tga");missing.path="missing.skin"
  count=count+require(try(skins.resolve(archive,missing,void)) is error,"missing image rejected")
  print("PASS: "+str(count)+" player skin contracts");return 0
end function
