import mq3.format.qfiles as q

function req(ok,label) if not ok then return error(7952,"qfiles.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(q.VM_MAGIC==0x12721444 and q.MD3_IDENT==0x33504449 and q.MD4_IDENT==0x34504449 and q.BSP_IDENT==0x50534249,"format magic")
  count=count+req(q.MD3_VERSION==15 and q.MD4_VERSION==1 and q.BSP_VERSION==46,"versions")
  count=count+req(q.SHADER_MAX_VERTEXES==1000 and q.SHADER_MAX_INDEXES==6000,"shader limits")
  count=count+req(q.MD3_MAX_LODS==3 and q.MD3_MAX_TRIANGLES==8192 and q.MD3_MAX_VERTS==4096 and q.MD3_MAX_SHADERS==256 and q.MD3_MAX_FRAMES==1024 and q.MD3_MAX_SURFACES==32 and q.MD3_MAX_TAGS==16,"md3 limits")
  count=count+req(q.MD4_MAX_BONES==128 and q.MD3_XYZ_SCALE==0.015625,"model constants")
  count=count+req(q.MAX_MAP_MODELS==1024 and q.MAX_MAP_BRUSHES==32768 and q.MAX_MAP_ENTITIES==2048 and q.MAX_MAP_ENTSTRING==262144 and q.MAX_MAP_SHADERS==1024,"map object limits")
  count=count+req(q.MAX_MAP_AREAS==256 and q.MAX_MAP_PLANES==131072 and q.MAX_MAP_LEAFBRUSHES==262144 and q.MAX_MAP_VISIBILITY==2097152,"map tree limits")
  count=count+req(q.MAX_MAP_LIGHTING==8388608 and q.MAX_MAP_LIGHTGRID==8388608 and q.MAX_MAP_DRAW_SURFS==131072 and q.MAX_MAP_DRAW_VERTS==524288 and q.MAX_MAP_DRAW_INDEXES==524288,"render lump limits")
  count=count+req(q.MAX_KEY==32 and q.MAX_VALUE==1024 and q.ANGLE_UP==-1 and q.ANGLE_DOWN==-2,"entity constants")
  count=count+req(q.MIN_WORLD_COORD==-131072 and q.MAX_WORLD_COORD==131072 and q.WORLD_SIZE==262144,"world range")
  count=count+req(q.LUMP_ENTITIES==0 and q.LUMP_VISIBILITY==16 and q.HEADER_LUMPS==17,"lump ordinal range")
  count=count+req(q.MST_BAD==0 and q.MST_PLANAR==1 and q.MST_PATCH==2 and q.MST_TRIANGLE_SOUP==3 and q.MST_FLARE==4,"surface ordinals")
  count=count+req(len(q.typeNames())==32,"complete type inventory")
  header=q.Dheader(q.BSP_IDENT,q.BSP_VERSION,[q.Lump(8,32),q.Lump(40,12)]);range=q.lumpRange(header,1,64)
  count=count+req(not (range is error) and range[0]==40 and range[1]==12,"validated lump range")
  count=count+req((try(q.lumpRange(header,1,48))) is error and (try(q.lumpRange(header,2,64))) is error,"lump rejection")
  print("PASS: "+str(count)+" qfiles.h ABI contracts")
  return 0
end function
