import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.command_queue as commands
import mq3.renderer.playable_materials as materials

function require(ok,message) if not ok then return error(7684,message) end if;return 1 end function

function main(args)
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
  cachedMaterial=qvm2d.Material(1,"gfx/a",[stage],false);cachedTexture=qvm2d.Texture("gfx/a.tga",white,7,false)
  catalog=qvm2d.Catalog([cachedMaterial],[cachedTexture],[],void,0,0,0,0,0,8)
  live=commands.create(void,void);commands.setColor(live,[1.0,0.0,0.0,0.5]);commands.stretchPic(live,20.0,30.0,40.0,50.0,0.0,0.0,1.0,1.0,1)
  refreshed=qvm2d.refresh(catalog,live.commands,assets,kinds,640.0,480.0,640.0,480.0)
  count=count+require(refreshed==catalog and len(refreshed.materials)==1 and len(refreshed.textures)==1,"refresh preserves decoded catalog")
  count=count+require(refreshed.sourceQuads==1 and refreshed.resolvedQuads==1 and refreshed.emittedTriangles==2,"refresh rebuilds frame counters")
  count=count+require(len(refreshed.runs)==1 and refreshed.runs[0].passes[0].triangles[0].positions[1].x==20.0,"refresh rebuilds native run geometry")
  unknown=commands.create(void,void);commands.stretchPic(unknown,0,0,1,1,0,0,1,1,3);qvm2d.refresh(catalog,unknown.commands,assets,kinds,640,480,640,480)
  count=count+require(catalog.sourceQuads==1 and catalog.resolvedQuads==0 and catalog.unresolvedQuads==1 and len(catalog.runs)==0,"refresh reports uncached shaders without decoding")
  print("PASS: "+str(count)+" QVM 2D batch contracts");return 0
end function
