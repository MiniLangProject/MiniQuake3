import mq3.renderer.surface_trails as trails
import mq3.compat.numeric as numeric
function req(value,label) if not value then return error(7698,"surface trail contract: "+label) end if;return 1 end function
function close(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0001 end function
function close3(a,b) return close(a[0],b[0]) and close(a[1],b[1]) and close(a[2],b[2]) end function
function main(args)
  count=0;color=[200,100,50,230]
  core=trails.railCoreRaw([1.0,2.0,3.0],[9.0,-2.0,7.0],[0.0,0.6,0.8],9,6.0,color)
  count=count+req(len(core.vertices)==4 and core.indexes==[0,1,2,2,1,3],"core topology")
  count=count+req(close3(core.vertices[0].xyz,[1.0,5.6,7.8]) and close3(core.vertices[1].xyz,[1.0,-1.6,-1.8]),"core start span")
  count=count+req(close3(core.vertices[2].xyz,[9.0,1.6,11.8]) and close3(core.vertices[3].xyz,[9.0,-5.6,2.2]),"core end span")
  count=count+req(core.vertices[0].color==[50,25,12,230] and core.vertices[1].color==color,"core leading color falloff")
  count=count+req(core.vertices[2].uv[0]>0.0351 and core.vertices[2].uv[0]<0.0352 and core.vertices[3].uv[1]==1.0,"core longitudinal UV")
  count=count+req(try(trails.railCoreRaw([0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],0,6.0,color)) is error,"core vectors checked")
  rings=trails.railDiscs(3,[0.0,0.0,0.0],[8.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],16.0,color)
  count=count+req(len(rings.vertices)==8 and len(rings.indexes)==12,"rings shorten multi-segment trail")
  count=count+req(rings.indexes==[0,1,3,3,1,2,4,5,7,7,5,6],"ring topology")
  count=count+req(rings.vertices[0].uv==[1.0,0.0] and rings.vertices[1].uv==[1.0,1.0] and rings.vertices[2].uv==[0.0,1.0] and rings.vertices[3].uv==[0.0,0.0],"ring UV winding")
  count=count+req(numeric.floatBits(rings.vertices[4].xyz[0])==numeric.floatBits(numeric.fadd(rings.vertices[0].xyz[0],8.0)),"rings advance by direction")
  count=count+req(len(trails.railDiscs(0,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],16.0,color).vertices)==0,"zero discs emit nothing")
  count=count+req(try(trails.railDiscs(-1,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],16.0,color)) is error,"negative disc count rejected")
  count=count+req(trails.ringCount([0.0,0.0,0.0],[8.0,0.0,0.0],32.0)==1,"short rail has one ring")
  count=count+req(trails.ringCount([0.0,0.0,0.0],[64.0,0.0,0.0],32.0)==1,"two nominal segments shorten to one")
  count=count+req(trails.ringCount([0.0,0.0,0.0],[128.0,0.0,0.0],32.0)==3,"four nominal segments shorten to three")
  count=count+req(try(trails.ringCount([0.0],[0.0,0.0,0.0],32.0)) is error,"ring endpoints checked")
  count=count+req(try(trails.ringCount([0.0,0.0,0.0],[1.0,0.0,0.0],0.0)) is error,"ring segment length checked")
  highCore=trails.railCore([0.0,0.0,0.0],[10.0,10.0,0.0],[-5.0,4.0,2.0],6.0,color)
  count=count+req(len(highCore.vertices)==4 and len(highCore.indexes)==6,"view-facing core built")
  highRings=trails.railRings([0.0,0.0,0.0],[100.0,0.0,0.0],32.0,16.0,color)
  count=count+req(len(highRings.vertices)==8 and len(highRings.indexes)==12,"ring service builds expected segments")
  bolt=trails.lightning([0.0,0.0,0.0],[10.0,10.0,10.0],[-5.0,4.0,2.0],color)
  count=count+req(len(bolt.vertices)==16 and len(bolt.indexes)==24,"lightning has four crossed cores")
  count=count+req(bolt.indexes[6]==4 and bolt.indexes[23]==15,"lightning rebases each core")
  count=count+req(bolt.vertices[0].color==[50,25,12,230] and bolt.vertices[15].color==color,"lightning retains entity color")
  count=count+req(bolt.vertices[0].xyz!=bolt.vertices[4].xyz,"lightning cores rotate")
  zero=trails.railCore([0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,-5.0],6.0,color)
  count=count+req(len(zero.vertices)==4,"zero-length core remains deterministic")
  count=count+req(try(trails.lightning([0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],color)) is error,"lightning endpoints checked")
  count=count+req(try(trails.railRings([0.0,0.0,0.0],[1.0,0.0,0.0],-1.0,16.0,color)) is error,"rings reject negative segment length")
  print("PASS: "+str(count)+" surface-trail contracts");return 0
end function
