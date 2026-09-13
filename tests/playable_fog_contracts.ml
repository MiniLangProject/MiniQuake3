import mq3.renderer.playable_fog as fog

struct Vertex position end struct
struct Triangle vertices fogIndex end struct
struct RenderData triangles end struct

function require(ok,text) if not ok then return error(7621,text) end if;return 1 end function
function near(a,b,tolerance) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<tolerance end function
function main(args)
  count=0;volume=fog.Fog("fog",[0.25,0.5,0.75],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false)
  count=count+require(fog.fogFactor(0.0,31.0/32.0)==0.0,"negative adjusted distance has no fog")
  count=count+require(near(fog.fogFactor(0.125+1.0/512.0,31.0/32.0),1.0,0.0001),"opaque depth reaches full fog")
  count=count+require(near(fog.density(volume,[25.0,0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0]),0.5,0.01),"quarter opaque distance follows square-root fog table")
  count=count+require(fog.density(volume,[100.0,0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0])>0.999,"opaque distance clamps")
  clipped=fog.Fog("clip",[1.0,0.0,0.0],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[1.0,0.0,0.0,0.0],true)
  count=count+require(fog.density(clipped,[-5.0,0.0,0.0],[-10.0,0.0,0.0],[1.0,0.0,0.0])==0.0,"point outside clipped fog has no density")
  a=Vertex([25.0,0.0,0.0]);b=Vertex([25.0,1.0,0.0]);c=Vertex([25.0,0.0,1.0]);batch=fog.build(RenderData([Triangle([a,b,c],1)]),fog.Catalog([void,volume]))
  count=count+require(batch.commands.count==1 and len(batch.sourcePositions)==1,"fogged triangle becomes a retained overlay")
  fog.update(batch,fog.Catalog([void,volume]),[0.0,0.0,0.0],[1.0,0.0,0.0]);count=count+require(batch.commands.data[116]==63 and batch.commands.data[117]==127 and batch.commands.data[118]==191 and batch.commands.data[119]>125 and batch.commands.data[119]<130,"fog overlay writes retail color and interpolated density")
  print("PASS: "+str(count)+" playable fog contracts");return 0
end function
