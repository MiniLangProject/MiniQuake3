// SPDX-License-Identifier: GPL-2.0-or-later
// Reproduce the white HUD-head regression with Sarge's real two-surface MD3.
import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.renderer.scene_queue as scene
import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.qvm_scene_materials as qvmHudMaterials
import mq3.renderer.qvm_scene_batch as batches
import mq3.compat.numeric as n

struct Refdef viewaxis vieworg time flags end struct
function require(value,label) if not value then return error(7685,"retail HUD head: "+label) end if;return 1 end function
function main(args)
  archive=pk3.open(args[0]);headPath="models/players/sarge/head.md3";skinPath="models/players/sarge/head_default.skin"
  model=md3.load(pk3.read(archive,headPath));if model is error then return model end if
  names=[headPath,skinPath];kinds=["model","skin"];modelAssets=[model,void]
  payload=bytes(140,0);n.writeU32(payload,8,1);n.writeU32(payload,108,2)
  for axis=0 to 2 n.writeU32(payload,28+axis*16,n.floatBits(1.0)) end for
  n.writeU32(payload,68,n.floatBits(32.0));for channel=116 to 119 payload[channel]=255 end for
  state=scene.create(1,0);state.registered=true;scene.addEntity(state,0,payload)
  view=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[0.0,0.0,0.0],1000,1)
  expanded=geometry.build(state,kinds,modelAssets,view,8192);if expanded is error then return expanded end if
  checked=require(expanded.triangleCount==117 and expanded.modelEntities==1,"real head has 23 cigar plus 94 head triangles");if checked is error then return checked end if
  for each triangle in expanded.triangles checked=require(triangle.customSkin==2 and triangle.shaderName=="","skin handle retained for shaderless MD3 surfaces");if checked is error then return checked end if end for
  // Historical production wiring supplied model objects where skin path
  // strings were required. Keep that failure as an explicit negative control.
  bad=qvmHudMaterials.build(archive,expanded.triangles,modelAssets,kinds,336,64,void);if bad is error then return bad end if
  checked=require(bad.unresolvedTriangles==117 and len(bad.textures)==0,"old registry mismatch reproduces untextured white head");if checked is error then return checked end if
  catalog=qvmHudMaterials.build(archive,expanded.triangles,names,kinds,336,64,void);if catalog is error then return catalog end if
  checked=require(catalog.resolvedTriangles==117 and catalog.unresolvedTriangles==0,"all real head triangles resolve through named skin registry");if checked is error then return checked end if
  checked=require(len(catalog.materials)==2 and len(catalog.textures)==3,"cigar/base glow and head band use three real Retail images in two materials");if checked is error then return checked end if
  prepared=batches.build(catalog);if prepared is error then return prepared end if
  checked=require(prepared.batch.drawableTriangles==117 and prepared.batch.emittedTriangles==140,"117 head triangles plus 23 original cigar-glow stage triangles enter native batches");if checked is error then return checked end if
  commands=[prepared.batch.base];for each pass in prepared.batch.passes commands=commands+[pass.commands] end for
  for each commandBatch in commands for index=0 to commandBatch.count-1
    slot=n.readI32(commandBatch.data,index*128)
    checked=require(slot>=336 and slot<=338,"native command carries real skin texture slot instead of white fallback");if checked is error then return checked end if
  end for end for
  refreshed=qvmHudMaterials.refresh(catalog,archive,expanded.triangles,names,kinds,400);if refreshed is error then return refreshed end if
  checked=require(catalog.resolvedTriangles==117 and catalog.unresolvedTriangles==0 and len(catalog.textures)==3,"frame refresh retains skin bindings without duplicate textures");if checked is error then return checked end if
  print "PASS: Retail HUD head 117 textured triangles, two skin materials, zero fallbacks"
  return 0
end function
