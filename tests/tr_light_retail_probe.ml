import mq3.renderer.tr_light_runtime as tr
import mq3.renderer.playable_light_grid as grids
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=1 then return error(7797,"pak path required") end if;archive=pk3.open(args[0]);if archive is error then return archive end if;data=pk3.read(archive,"maps/q3dm1.bsp");if data is error then return data end if;map=bsp.load(data);if map is error then return map end if;grid=grids.load(map);if grid is error or not grid.valid then return error(7798,"q3dm1 light grid invalid") end if
  found=void;point=void
  for z=0 to grid.bounds[2]-1 if found==void then for y=0 to grid.bounds[1]-1 if found==void then for x=0 to grid.bounds[0]-1 if found==void then candidate=[grid.origin[0]+x*grid.size[0],grid.origin[1]+y*grid.size[1],grid.origin[2]+z*grid.size[2]];value=tr.R_LightForPoint(grid,candidate,1.0,1.0);if value.found and (value.ambientLight[0]+value.ambientLight[1]+value.ambientLight[2])>0.0 then found=value;point=candidate end if end if end for end if end for end if end for
  if found==void then return error(7799,"q3dm1 has no illuminated light-grid point") end if
  ent=tr.entity(point);light=tr.dlight([point[0]+64.0,point[1],point[2]],64.0,[1.0,0.5,0.25]);tr.R_SetupEntityLighting(tr.Refdef(0,[light]),grid,ent,1.0,255.0,[0.0,0.0,1.0],1.0,1.0,false)
  if not ent.lightingCalculated or ent.ambientLightInt==0 or ent.directedLight[0]<=found.directedLight[0] then return error(7800,"q3dm1 entity lighting incomplete") end if
  print("PASS: retail tr_light q3dm1 points="+str(grid.bounds[0]*grid.bounds[1]*grid.bounds[2])+" ambient="+str(found.ambientLight)+" directed="+str(ent.directedLight));return 0
end function
