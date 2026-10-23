import mq3.renderer.shader_remap as remap
import mq3.renderer.pvs_query as rendererPvs
import mq3.qcommon.memory_file_seek as fileSeek
import mq3.collision.world as collision
import mq3.collision.visibility as visibility
import mq3.collision.brush as brush
import mq3.engine.local_qvm_match as match
import mq3.renderer.scene_queue as sceneQueue
import mq3.compat.numeric as n

struct Cursor data offset end struct
struct Vm data mask end struct
struct TrapHost scene end struct

function require(ok,message) if not ok then return error(9911,message) end if;return 1 end function

function main(args)
  count=0;state=remap.create();assets=["textures/old.tga","textures/OLD","models/item.md3","textures/new"];kinds=["shader","shaderNoMip","model","shader"]
  changed=remap.apply(state,assets,kinds,"textures/old","textures/new","1.25")
  count=count+require(changed==2,"both lightmap variants remapped")
  count=count+require(assets==["textures/new","textures/new","models/item.md3","textures/new"],"only shader handles rewritten")
  count=count+require(remap.resolve(state,"TEXTURES/OLD.JPG")=="textures/new","future lookup resolves case-insensitive extensionless name")
  count=count+require(remap.timeOffset(state,"textures/old")=="1.25" and state.revision==1,"time offset and revision retained")
  count=count+require(remap.timeOffsetForHandle(state,1)==1.25 and remap.timeOffsetForHandle(state,2)==1.25,"time offset follows both stable shader handles")
  remap.apply(state,assets,kinds,"textures/old","textures/third","-0.5")
  count=count+require(remap.resolve(state,"textures/old")=="textures/third" and remap.timeOffset(state,"textures/old")=="-0.5" and assets[0]=="textures/third" and assets[1]=="textures/third","existing handle remap updates")
  count=count+require(remap.timeOffsetForHandle(state,1)== -0.5 and remap.timeOffsetForHandle(state,3)==void,"updated offset reaches mapped handles only")
  count=count+require(remap.handle(state,kinds,"shader","textures/old")==1 and remap.handle(state,kinds,"shaderNoMip","textures/old")==2,"future registration keeps stable remapped handles")
  files=[void,Cursor(bytes("abcdef"),2),Cursor(bytes(0,0),-1)]
  count=count+require(fileSeek.seek(files,1,2,fileSeek.FS_SEEK_CUR)==0 and files[1].offset==4,"seek relative to current position")
  count=count+require(fileSeek.seek(files,1,-1,fileSeek.FS_SEEK_END)==0 and files[1].offset==5,"seek relative to file end")
  count=count+require(fileSeek.seek(files,1,9,fileSeek.FS_SEEK_SET)==0 and files[1].offset==9,"seek from start permits beyond EOF")
  count=count+require(fileSeek.seek(files,1,-10,fileSeek.FS_SEEK_CUR)==-1 and files[1].offset==9,"negative target rejected without mutation")
  count=count+require(fileSeek.seek(files,2,0,fileSeek.FS_SEEK_SET)==-1 and fileSeek.seek(files,7,0,fileSeek.FS_SEEK_SET)==-1,"closed and invalid handles rejected")
  count=count+require(try(fileSeek.seek(files,1,0,9)) is error,"invalid seek origin rejected")
  vis=visibility.Visibility([0,1],[0,1],2,2,1,bytes([1,2]),true,array(4,0),[1,2],false)
  root=collision.Node(brush.Plane([1.0,0.0,0.0],0.0,0),0,[-1,-2]);world=collision.World([],[root],[collision.Leaf([],[]),collision.Leaf([],[])],[],[],false,false,void,void,vis,"",[],0,"")
  count=count+require(rendererPvs.inPVS(world,[1.0,0.0,0.0],[1.0,2.0,3.0]),"renderer PVS accepts points in visible cluster")
  count=count+require(not rendererPvs.inPVS(world,[1.0,0.0,0.0],[-1.0,0.0,0.0]),"renderer PVS rejects cluster outside mask")
  vm=Vm(bytes(256,0),255);host=TrapHost(sceneQueue.create(4,16))
  n.writeU32(vm.data,4,200);count=count+require(try(match.extendedCgame(host,vm,0,41)) is error,"refEntity trap validates full 140-byte input")
  n.writeU32(vm.data,8,253);count=count+require(try(match.extendedCgame(host,vm,0,18)) is error,"map-load trap validates checksum output span")
  n.writeU32(vm.data,8,252);n.writeU32(vm.data,252,0xffffffff);count=count+require(match.extendedCgame(host,vm,0,18)==0 and n.readU32(vm.data,252)==0,"map-load trap writes checked checksum output")
  n.writeU32(vm.data,4,253);vm.data[253]=65;vm.data[254]=65;vm.data[255]=65;count=count+require(try(match.extendedCgame(host,vm,0,79)) is error,"shader-remap trap propagates unterminated string")
  print("PASS: "+str(count)+" cgame extended-renderer contracts")
  return 0
end function
