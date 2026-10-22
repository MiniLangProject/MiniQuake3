import mq3.renderer.tr_world_runtime as world
function face() return world.Surface("face",[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],[0.0,0.0,0.0],1.0,world.Plane([1.0,0.0,0.0],0.0),world.CT_TWO_SIDED,-1,0,0) end function
function grid() return world.Surface("grid",[[-2.0,-2.0,-2.0],[2.0,2.0,2.0]],[0.0,0.0,0.0],2.0,world.Plane([0.0,0.0,1.0],0.0),world.CT_TWO_SIDED,-1,0,0) end function
function main(args)
  lights=[world.Dlight([0.0,0.0,0.0],4.0),world.Dlight([8.0,0.0,0.0],2.0),world.Dlight([0.0,0.0,6.0],1.0)]
  value=face();bits=world.R_DlightFace(value,7,lights);print("face|"+str(bits)+","+str(value.dlightBits)+",0")
  value=grid();bits=world.R_DlightGrid(value,7,lights);print("grid|"+str(bits)+","+str(value.dlightBits)+",0")
  value=grid();bits=world.R_DlightGrid(value,2,lights);print("none|"+str(bits)+","+str(value.dlightBits)+",1")
  value=world.Surface("triangles",[[],[]],[0.0,0.0,0.0],0.0,world.Plane([0.0,0.0,1.0],0.0),world.CT_TWO_SIDED,-1,0,0);bits=world.R_DlightTrisurf(value,5,lights);print("tris|"+str(bits)+","+str(value.dlightBits));return 0
end function
