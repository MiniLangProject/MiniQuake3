import mq3.renderer.tr_model_runtime as tr
import mq3.format.pk3 as pk3
function require(ok,text) if not ok then return error(7792,text) end if;return 1 end function
function main(args)
  if len(args)<1 then print("usage: tr_model_retail_probe <pak0.pk3>");return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;state=tr.createState([archive],"retail")
  paths=["models/players/sarge/lower.md3","models/players/sarge/upper.md3","models/players/sarge/head.md3","models/weapons2/machinegun/machinegun.md3"]
  handles=[];frames=0;surfaces=0;triangles=0
  for each path in paths handle=tr.RE_RegisterModel(state,path);require(handle>0,"retail model failed "+path);handles=handles+[handle];model=tr.R_GetModelByHandle(state,handle);frames=frames+model.md3[0].numFrames;surfaces=surfaces+model.md3[0].numSurfaces;for each surface in model.md3[0].surfaces triangles=triangles+surface.mesh.numTriangles end for end for
  require(tr.RE_RegisterModel(state,paths[0])==handles[0],"retail registration cache")
  upper=tr.R_GetModelByHandle(state,handles[1]);tag=tr.R_GetTag(upper,0,"tag_head");require(tag!=void,"retail tag_head")
  orientation=tr.R_LerpTag(state,handles[1],0,1,0.5,"tag_head");require(orientation.found,"retail interpolated tag")
  bounds=tr.R_ModelBounds(state,handles[0]);require(bounds[0]!=bounds[1],"retail bounds")
  print("PASS: retail tr_model models="+str(len(handles))+" frames="+str(frames)+" surfaces="+str(surfaces)+" triangles="+str(triangles)+" bytes="+str(tr.R_Modellist_f(state).total));return 0
end function
