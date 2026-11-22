import mq3.renderer.tr_public as trPublic
import mq3.renderer.qgl as qgl
import mq3.renderer.tr_local as local
function main(args)
  print "api="+str(trPublic.REF_API_VERSION)
  print "pub=116,0,60,112"
  print "imp=104,0,68,100"
  print "qgl=84e0,84c0,83a0,83a1"
  print "local=4,44,112,8,262148,40"
  print "offsets=28,80,4,4"
  print "limits="+str(local.MAX_SHADERS)+","+str(local.MAX_DRAWSURFS)+","+str(local.MAX_RENDER_COMMANDS)+","+str(local.MAX_POLYS)+","+str(local.MAX_POLYVERTS)+","+str(local.SMP_FRAMES)
  print "sort="+str(local.QSORT_SHADERNUM_SHIFT)+","+str(local.QSORT_ENTITYNUM_SHIFT)+","+str(local.QSORT_FOGNUM_SHIFT)+","+str(local.DRAWSURF_MASK)
  print "state=f,f0,100,20000,70000000"
  return 0
end function

