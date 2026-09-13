import mq3.renderer.playable_light_grid as lightGrid
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
function main(args)
  if len(args)!=1 then return error(7662,"pak path required") end if;archive=pk3.open(args[0]);if archive is error then return archive end if;data=pk3.read(archive,"maps/q3dm1.bsp");if data is error then return data end if;map=bsp.load(data);if map is error then return map end if;grid=lightGrid.load(map);if grid is error or not grid.valid then return error(7663,"q3dm1 light grid invalid") end if
  found=void
  for z=0 to grid.bounds[2]-1 if found==void then for y=0 to grid.bounds[1]-1 if found==void then for x=0 to grid.bounds[0]-1 if found==void then point=[grid.origin[0]+x*grid.size[0],grid.origin[1]+y*grid.size[1],grid.origin[2]+z*grid.size[2]];sample=lightGrid.sample(grid,point);if sample.totalFactor>0.0 then found=sample end if end if end for end if end for end if end for
  if found==void then return error(7664,"q3dm1 light grid has no illuminated sample") end if
  print("PASS: q3dm1 light grid points="+str(grid.bounds[0]*grid.bounds[1]*grid.bounds[2])+" ambient="+str(found.ambient));return 0
end function
