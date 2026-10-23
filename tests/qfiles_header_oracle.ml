import mq3.format.qfiles as q
function main(args)
  print("magic "+str(q.VM_MAGIC)+" "+str(q.MD3_IDENT)+" "+str(q.MD4_IDENT)+" "+str(q.BSP_IDENT)+" "+str(q.MD3_VERSION)+" "+str(q.BSP_VERSION))
  print("limits "+str(q.SHADER_MAX_VERTEXES)+" "+str(q.SHADER_MAX_INDEXES)+" "+str(q.MD3_MAX_TRIANGLES)+" "+str(q.MD3_MAX_VERTS)+" "+str(q.MD3_MAX_FRAMES)+" "+str(q.MAX_MAP_ENTITIES)+" "+str(q.MAX_MAP_DRAW_VERTS)+" "+str(q.MAX_MAP_DRAW_INDEXES))
  print("world "+str(q.MIN_WORLD_COORD)+" "+str(q.MAX_WORLD_COORD)+" "+str(q.WORLD_SIZE)+" "+str(q.LIGHTMAP_WIDTH)+" "+str(q.LIGHTMAP_HEIGHT)+" "+str(q.HEADER_LUMPS))
  print("lumps "+str(q.LUMP_ENTITIES)+" "+str(q.LUMP_DRAWVERTS)+" "+str(q.LUMP_DRAWINDEXES)+" "+str(q.LUMP_SURFACES)+" "+str(q.LUMP_LIGHTGRID)+" "+str(q.LUMP_VISIBILITY))
  print("sizes1 32 130 20 56 112 108 68 108")
  print("sizes2 20 44 168 48 88 12 100 8")
  print("sizes3 144 40 72 16 36 48 8 12")
  print("sizes4 72 44 104 96")
  return 0
end function
