import mq3.renderer.tr_types as t
function main(args)
  print "limits "+str(t.MAX_DLIGHTS)+" "+str(t.MAX_ENTITIES)+" "+str(t.MAX_RENDER_STRINGS)+" "+str(t.MAX_RENDER_STRING_LENGTH)
  print "renderfx "+str(t.RF_MINLIGHT)+" "+str(t.RF_THIRD_PERSON)+" "+str(t.RF_FIRST_PERSON)+" "+str(t.RF_DEPTHHACK)+" "+str(t.RF_NOSHADOW)+" "+str(t.RF_LIGHTING_ORIGIN)+" "+str(t.RF_SHADOW_PLANE)+" "+str(t.RF_WRAP_FRAMES)
  print "rdflags "+str(t.RDF_NOWORLDMODEL)+" "+str(t.RDF_HYPERSPACE)
  print "entitytypes "+str(t.RT_MODEL)+" "+str(t.RT_POLY)+" "+str(t.RT_SPRITE)+" "+str(t.RT_BEAM)+" "+str(t.RT_RAIL_CORE)+" "+str(t.RT_RAIL_RINGS)+" "+str(t.RT_LIGHTNING)+" "+str(t.RT_PORTALSURFACE)+" "+str(t.RT_MAX_REF_ENTITY_TYPE)
  print "enums "+str(t.STEREO_CENTER)+" "+str(t.STEREO_LEFT)+" "+str(t.STEREO_RIGHT)+" "+str(t.TC_NONE)+" "+str(t.TC_S3TC)+" "+str(t.GLDRV_ICD)+" "+str(t.GLDRV_STANDALONE)+" "+str(t.GLDRV_VOODOO)+" "+str(t.GLHW_GENERIC)+" "+str(t.GLHW_3DFX_2D3D)+" "+str(t.GLHW_RIVA128)+" "+str(t.GLHW_RAGEPRO)+" "+str(t.GLHW_PERMEDIA2)
  print "drivers "+t._3DFX_DRIVER_NAME+" "+t.OPENGL_DRIVER_NAME
  print "sizes 24 12 140 368 11332"
  print "refentity 0 12 28 64 68 84 104 116 120 132 136"
  print "refdef 0 16 24 72 76 80 112"
  print "glconfig 0 11264 11284 11292 11304 11312 11320 11328"
  return 0
end function
