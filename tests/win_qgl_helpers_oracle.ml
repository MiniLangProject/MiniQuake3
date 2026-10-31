import mq3.platform.win_qgl_runtime as win

function main(args)
  print "bool="+win.BooleanToString(win.GL_FALSE)+","+win.BooleanToString(win.GL_TRUE)+","+win.BooleanToString(4)
  print "func="+win.FuncToString(win.GL_ALWAYS)+","+win.FuncToString(win.GL_LEQUAL)+","+win.FuncToString(0xffff)
  print "prim0="+win.PrimToString(win.GL_TRIANGLES)
  print "prim1="+win.PrimToString(win.GL_QUADS)
  print "prim2="+win.PrimToString(win.GL_LINE_LOOP)
  print "cap="+win.CapToString(win.GL_TEXTURE_2D)+","+win.CapToString(win.GL_BLEND)+","+win.CapToString(win.GL_VERTEX_ARRAY)
  print "type="+win.TypeToString(win.GL_UNSIGNED_BYTE)+","+win.TypeToString(win.GL_FLOAT)+","+win.TypeToString(0xffff)
  print "blend="+win.BlendToName(win.GL_ONE_MINUS_SRC_ALPHA)
  return 0
end function
