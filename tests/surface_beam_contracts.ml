import mq3.renderer.surface_beam as beam
function req(value,label) if not value then return error(7694,"surface beam contract: "+label) end if;return 1 end function
function close(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0001 end function
function main(args)
  count=0;value=beam.build([10.0,-4.0,2.0],[34.0,8.0,14.0])
  count=count+req(len(value.vertices)==14,"closed six-segment strip vertices")
  count=count+req(len(value.indexes)==36,"strip expands to twelve triangles")
  count=count+req(value.vertices[0].xyz==value.vertices[12].xyz and value.vertices[1].xyz==value.vertices[13].xyz,"strip closes at first pair")
  count=count+req(value.vertices[0].color==[255,0,0,255] and value.vertices[13].color==[255,0,0,255],"original constant red color")
  count=count+req(value.vertices[0].uv==[0.0,0.0] and value.vertices[1].uv==[1.0,0.0],"beam endpoint coordinates")
  count=count+req(value.indexes[0]==0 and value.indexes[1]==1 and value.indexes[2]==2,"first strip triangle")
  count=count+req(value.indexes[3]==2 and value.indexes[4]==1 and value.indexes[5]==3,"alternating strip winding")
  count=count+req(value.indexes[33]==12 and value.indexes[34]==11 and value.indexes[35]==13,"last strip triangle")
  direction=[24.0,12.0,12.0]
  count=count+req(close(value.vertices[1].xyz[0]-value.vertices[0].xyz[0],direction[0]) and close(value.vertices[1].xyz[1]-value.vertices[0].xyz[1],direction[1]) and close(value.vertices[1].xyz[2]-value.vertices[0].xyz[2],direction[2]),"end ring separated by beam direction")
  count=count+req(value.vertices[0].xyz!=value.vertices[2].xyz and value.vertices[2].xyz!=value.vertices[4].xyz,"six rotated ring points")
  zero=beam.build([1.0,2.0,3.0],[1.0,2.0,3.0]);count=count+req(len(zero.vertices)==0 and len(zero.indexes)==0,"zero length beam omitted")
  count=count+req(try(beam.build([0.0],[0.0,0.0,0.0])) is error,"origin shape checked")
  count=count+req(try(beam.build([0.0,0.0,0.0],[0.0])) is error,"old origin shape checked")
  print("PASS: "+str(count)+" surface-beam contracts");return 0
end function
