import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.command_queue as commands
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.shader_remap as shaderRemap
import mq3.compat.numeric as numeric
import mq3.format.pk3 as pk3

function require(ok,message) if not ok then return error(7684,message) end if;return 1 end function

function main(args)
  if len(args)!=1 then return error(7684,"qvm 2D fixture PK3 is required") end if
  count=0;assets=["gfx/a","models/not-a-shader","gfx/b"];kinds=["shader","model","shaderNoMip"]
  q=commands.create(void,void);commands.setColor(q,[0.5,0.25,0.0,1.0]);commands.stretchPic(q,100.0,90.0,200.0,180.0,0.1,0.2,0.8,0.9,1);commands.drawBuffer(q,1029);commands.setColor(q,void);commands.stretchPic(q,0.0,0.0,1280.0,720.0,0.0,0.0,1.0,1.0,3)
  extracted=qvm2d.extract(q.commands,assets,kinds,1280.0,720.0,640.0,480.0)
  count=count+require(not (extracted is error),"valid stream extracted")
  count=count+require(len(extracted.quads)==2 and extracted.setColors==2 and extracted.ignoredCommands==1,"command classes counted")
  first=extracted.quads[0];second=extracted.quads[1]
  count=count+require(first.shaderHandle==1 and first.shaderName=="gfx/a" and second.shaderName=="gfx/b","typed shader handles resolved")
  count=count+require(first.color==[127,63,0,255] and second.color==[255,255,255,255],"SetColor state captured per quad")
  count=count+require(first.commandIndex==1 and second.commandIndex==4,"source command order retained")
  count=count+require(first.positions[0].x==50.0 and first.positions[0].y==60.0 and first.positions[2].x==150.0 and first.positions[2].y==180.0,"non-square viewport scaling")
  count=count+require(first.positions[0].depth==qvm2d.SCREEN_DEPTH and second.positions[2].x==640.0 and second.positions[2].y==480.0,"native screen points emitted")
  count=count+require(first.texCoords==[[0.1,0.2],[0.8,0.2],[0.8,0.9],[0.1,0.9]],"quad UV order retained")
  triangles=qvm2d.trianglesFor(first,0)
  count=count+require(len(triangles)==2,"quad triangulated")
  count=count+require(triangles[0].positions==[first.positions[3],first.positions[0],first.positions[2]] and triangles[1].positions==[first.positions[2],first.positions[0],first.positions[1]],"Baseq3 stretch-pic index order")
  count=count+require(triangles[0].texCoords==[first.texCoords[3],first.texCoords[0],first.texCoords[2]],"indexed UVs follow positions")
  count=count+require(triangles[0].colors==[[127,63,0,255],[127,63,0,255],[127,63,0,255]],"vertex color expanded")
  count=count+require(qvm2d.shaderName(assets,kinds,1)=="gfx/a" and qvm2d.shaderName(assets,kinds,2)=="","non-shader asset rejected")
  count=count+require(qvm2d.shaderName(assets,kinds,0)=="" and qvm2d.shaderName(assets,kinds,4)=="","invalid handles rejected")
  count=count+require(not qvm2d.shaderNoMip(kinds,1) and qvm2d.shaderNoMip(kinds,3),"no-mip registration retained")
  white=qvm2d.whiteImage();checker=qvm2d.checkerImage()
  count=count+require(white.width==1 and white.height==1 and len(white.pixels)==4,"white renderer image synthesized")
  count=count+require(checker.width==2 and checker.height==2 and len(checker.pixels)==16,"missing-shader checker synthesized")
  stage=qvm2d.directStage("gfx/a.tga",white,7)
  count=count+require(stage.slots==[7] and stage.blend==materials.BLEND_ALPHA,"implicit 2D shader uses alpha blend")
  count=count+require(stage.rgbGen=="vertex" and stage.alphaGen=="vertex" and not stage.depthWrite,"implicit 2D shader consumes SetColor")
  count=count+require(qvm2d.colorBytes([0.0,1.0,0.501,0.999])==[0,255,127,254],"C-compatible color truncation")
  count=count+require(try(qvm2d.extract(q.commands,assets,["shader"],1280,720,640,480)) is error,"registry mismatch rejected")
  count=count+require(try(qvm2d.extract(q.commands,assets,kinds,0,720,640,480)) is error,"invalid source dimensions rejected")
  bad=[commands.Command(commands.RC_SET_COLOR,commands.SET_COLOR_BYTES,[1.0],void)]
  count=count+require(try(qvm2d.extract(bad,assets,kinds,1280,720,640,480)) is error,"malformed color command rejected")
  bad=[commands.Command(commands.RC_STRETCH_PIC,commands.STRETCH_PIC_BYTES,[1.0],1)]
  count=count+require(try(qvm2d.extract(bad,assets,kinds,1280,720,640,480)) is error,"malformed stretch command rejected")
  timed=qvm2d.directStage("gfx/a.tga",white,7);timed.imageNames=["gfx/a.tga","gfx/b.tga"];timed.images=[white,white];timed.slots=[7,8];timed.animationSpeed=2.0;timed.uvMods=[materials.UvMod("scroll",0.5,0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())]
  count=count+require(not qvm2d.dynamicStage(stage) and qvm2d.dynamicStage(timed),"2D pass cache distinguishes static and animated stages")
  remaps=shaderRemap.create();shaderRemap.apply(remaps,assets,kinds,"gfx/a","gfx/a","0.25")
  cachedMaterial=qvm2d.Material(1,"gfx/a",[timed],false,0.0,0.75);cachedTexture=qvm2d.Texture("gfx/a.tga",white,7,false)
  catalog=qvm2d.Catalog([cachedMaterial],[cachedTexture],[],void,void,0,0,0,0,0,8,9,remaps,void,0,0,640.0,480.0,640.0,480.0)
  live=commands.create(void,void);commands.setColor(live,[1.0,0.0,0.0,0.5]);commands.stretchPic(live,20.0,30.0,40.0,50.0,0.0,0.0,1.0,1.0,1)
  refreshed=qvm2d.refresh(catalog,live.commands,assets,kinds,640.0,480.0,640.0,480.0)
  count=count+require(refreshed==catalog and len(refreshed.materials)==1 and len(refreshed.textures)==1,"refresh preserves decoded catalog")
  count=count+require(refreshed.sourceQuads==1 and refreshed.resolvedQuads==1 and refreshed.emittedTriangles==2,"refresh rebuilds frame counters")
  count=count+require(len(refreshed.runs)==1 and refreshed.runs[0].passes[0].triangles[0].positions[1].x==20.0,"refresh rebuilds native run geometry")
  cachedRuns=refreshed.runs;cachedPass=refreshed.runs[0].passes[0];qvm2d.refresh(catalog,live.commands,assets,kinds,640.0,480.0,640.0,480.0);count=count+require(catalog.runs==cachedRuns and catalog.runs[0].passes[0]==cachedPass,"identical 2D command stream reuses native batches")
  staticQueue=commands.create(void,void);commands.setColor(staticQueue,[1.0,1.0,1.0,1.0]);commands.stretchPic(staticQueue,1,2,3,4,0,0,1,1,1);staticExtracted=qvm2d.extract(staticQueue.commands,assets,kinds,640,480,640,480);staticMaterial=qvm2d.Material(1,"gfx/a",[stage],false,0.0,0.0);staticRun=qvm2d.createRun(0,1,staticMaterial,staticExtracted.quads);staticCatalog=qvm2d.Catalog([staticMaterial],[cachedTexture],[staticRun],void,void,0,1,2,1,0,8,9,remaps,staticQueue.commands,remaps.revision,len(assets),640,480,640,480)
  changedQueue=commands.create(void,void);commands.setColor(changedQueue,[0.25,0.5,0.75,1.0]);commands.stretchPic(changedQueue,11,12,13,14,0.1,0.2,0.8,0.9,1);qvm2d.refresh(staticCatalog,changedQueue.commands,assets,kinds,640,480,640,480)
  count=count+require(staticCatalog.runs[0]==staticRun and numeric.bitsFloat(numeric.readU32(staticRun.passes[0].batch.data,20))==11.0 and staticRun.passes[0].batch.data[116]==63,"same-topology static HUD updates retained native bytes in place")
  timedPass=refreshed.runs[0].passes[0];qvm2d.updatePass(timedPass,500.0);count=count+require(numeric.readI32(timedPass.batch.data,0)==7 and numeric.bitsFloat(numeric.readU32(timedPass.batch.data,32))==0.125,"2D remap timeOffset drives animated frames and tcMods")
  qvm2d.updatePass(timedPass,1500.0);count=count+require(numeric.readI32(timedPass.batch.data,0)==8 and numeric.bitsFloat(numeric.readU32(timedPass.batch.data,32))==0.375,"2D clampTime freezes animated frames and tcMods")
  unknown=commands.create(void,void);commands.stretchPic(unknown,0,0,1,1,0,0,1,1,3);qvm2d.refresh(catalog,unknown.commands,assets,kinds,640,480,640,480)
  count=count+require(catalog.sourceQuads==1 and catalog.resolvedQuads==0 and catalog.unresolvedQuads==1 and len(catalog.runs)==0,"refresh reports uncached shaders without decoding")
  archive=pk3.open(args[0]);if archive is error then return archive end if;remappedAssets=["gfx/old"];remappedKinds=["shader"];runtimeRemaps=shaderRemap.create();remappedQueue=commands.create(void,void);commands.stretchPic(remappedQueue,0,0,32,32,0,0,1,1,1)
  remappedCatalog=qvm2d.build(archive,remappedQueue.commands,remappedAssets,remappedKinds,20,10,640,480,640,480,runtimeRemaps);count=count+require(len(remappedCatalog.materials)==1 and len(remappedCatalog.textures)==1,"2D fixture starts with its original decoded shader")
  shaderRemap.apply(runtimeRemaps,remappedAssets,remappedKinds,"gfx/old","gfx/new","0.5");qvm2d.refresh(remappedCatalog,remappedQueue.commands,remappedAssets,remappedKinds,640,480,640,480);remappedMaterial=remappedCatalog.materials[0];remappedPass=remappedCatalog.runs[0].passes[0];qvm2d.updatePass(remappedPass,2000.0)
  count=count+require(remappedMaterial.shaderName=="gfx/new" and remappedMaterial.timeOffset==0.5 and remappedMaterial.clampTime==0.75 and len(remappedCatalog.textures)==3 and numeric.readI32(remappedPass.batch.data,0)==22,"runtime 2D remap decodes replacement stages and applies offset/clamp time")
  print("PASS: "+str(count)+" QVM 2D batch contracts");return 0
end function
