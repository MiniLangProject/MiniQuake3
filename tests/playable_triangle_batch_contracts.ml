import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric
struct Point x y depth end struct
struct Projection position right up forward halfWidth halfHeight focal nearDistance end struct
function require(condition,message) if not condition then return error(7489,message) end if;return 1 end function
function main(args)
  count=0;batch=window.createTriangleBatch(2)
  count=count+require(len(batch.data)==256 and batch.capacity==2 and batch.count==0,"batch allocation")
  a=Point(10.5,20.25,2.0);b=Point(30.0,40.0,4.0);c=Point(50.0,60.0,8.0)
  batch=window.appendTriangleBatch(batch,7,131,a,[0.0,0.25],[0.5,0.75],1.0,b,[1.0,0.0],[0.25,0.5],0.8,c,[1.0,1.0],[0.75,1.0],0.6,255,128,32)
  count=count+require(batch.count==1,"multitexture append count")
  count=count+require(numeric.readI32(batch.data,0)==7 and numeric.readI32(batch.data,4)==131,"texture slots")
  count=count+require(numeric.readI32(batch.data,8)==255 and numeric.readI32(batch.data,12)==128 and numeric.readI32(batch.data,16)==32,"fallback color")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.data,20))==10.5 and numeric.bitsFloat(numeric.readU32(batch.data,24))==20.25,"first projected vertex")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.data,32))==0.0 and numeric.bitsFloat(numeric.readU32(batch.data,36))==0.25,"first base UV")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.data,40))==0.5 and numeric.bitsFloat(numeric.readU32(batch.data,44))==0.75,"first lightmap UV")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.data,48))==1.0,"first light")
  batch=window.appendSingleTextureTriangle(batch,9,a,[0.1,0.2],0.3,b,[0.4,0.5],0.6,c,[0.7,0.8],0.9,1,2,3)
  count=count+require(batch.data[116]==255 and batch.data[127]==255,"default batch vertex colors are white")
  count=count+require(batch.count==2 and numeric.readI32(batch.data,128)==9 and numeric.readI32(batch.data,132)==-1,"single texture encoding")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.data,168))==0.0 and numeric.bitsFloat(numeric.readU32(batch.data,172))==0.0,"single texture lightmap UV cleared")
  count=count+require(try(window.appendSingleTextureTriangle(batch,0,a,[0,0],1,b,[0,0],1,c,[0,0],1,0,0,0)) is error,"capacity enforced")
  batch=window.resetTriangleBatch(batch);count=count+require(batch.count==0 and len(batch.data)==256,"reset reuses storage")
  batch=window.appendSingleTextureTriangleColored(batch,9,a,[0.1,0.2],1.0,[10,20,30,40],b,[0.4,0.5],1.0,[50,60,70,80],c,[0.7,0.8],1.0,[90,100,110,120],1,2,3)
  count=count+require(batch.data[116]==10 and batch.data[119]==40 and batch.data[124]==90 and batch.data[127]==120,"per-vertex RGBA encoded")
  count=count+require(try(window.createTriangleBatch(0)) is error and try(window.createTriangleBatch(65537)) is error,"capacity range")
  area=window.viewport(4,5,16,12);count=count+require(area.x==4 and area.y==5 and area.width==16 and area.height==12,"viewport dimensions preserved")
  count=count+require(try(window.viewport(-1,0,16,12)) is error and try(window.viewport(0,0,0,12)) is error,"viewport dimensions validated")
  projection=Projection([0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0],8.0,6.0,8.0,1.0)
  window.resetTriangleBatch(batch);count=count+require(window.submitWorldTriangleBatchViewport(batch,projection,area)==0,"empty viewport batch accepted")
  count=count+require(try(window.submitWorldTriangleBatchViewport(batch,void,area)) is error,"viewport projection validated")
  print("PASS: "+str(count)+" playable triangle batch contracts");return 0
end function
