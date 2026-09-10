import mq3.renderer.tga as tga

function require(ok,text) if not ok then return error(7130,text) end if;return 1 end function
function fixture(type,width,height,bits,attributes,payload) return bytes([0,0,type,0,0,0,0,0,0,0,0,0,width&255,width>>8,height&255,height>>8,bits,attributes]+payload) end function
function same(data,values) if len(data)!=len(values) then return false end if;for i=0 to len(values)-1 if data[i]!=values[i] then return false end if end for;return true end function
function main(args)
  count=0
  image=tga.decode(fixture(2,2,2,24,0,[1,2,3,4,5,6,7,8,9,10,11,12]))
  count=count+require(image.width==2 and image.height==2,"dimensions retained")
  count=count+require(same(image.pixels,[9,8,7,255,12,11,10,255,3,2,1,255,6,5,4,255]),"BGR conversion and Baseq3 bottom-up rows")
  image=tga.decode(fixture(2,1,1,32,0,[1,2,3,4]));count=count+require(same(image.pixels,[3,2,1,4]),"BGRA conversion and alpha")
  image=tga.decode(fixture(3,3,1,8,0,[0,127,255]));count=count+require(same(image.pixels,[0,0,0,255,127,127,127,255,255,255,255,255]),"grayscale expansion")
  image=tga.decode(fixture(3,1,1,24,0,[4,5,6]));count=count+require(same(image.pixels,[6,5,4,255]),"Baseq3 grayscale type accepts 24 bit")
  image=tga.decode(fixture(10,3,2,24,0,[131,30,20,10,1,3,2,1,6,5,4]));count=count+require(same(image.pixels,[10,20,30,255,1,2,3,255,4,5,6,255,10,20,30,255,10,20,30,255,10,20,30,255]),"RLE run crosses row and raw tail decodes")
  image=tga.decode(fixture(10,2,2,32,32,[3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]));count=count+require(image.topDownDeclared,"top-down declaration exposed")
  count=count+require(same(image.pixels,[11,10,9,12,15,14,13,16,3,2,1,4,7,6,5,8]),"top-down bit ignored like Baseq3")
  withId=bytes([3,0,2,0,0,0,0,0,0,0,0,0,1,0,1,0,24,0,65,66,67,9,8,7]);image=tga.decode(withId);count=count+require(same(image.pixels,[7,8,9,255]),"image id skipped")
  count=count+require(try(tga.decode(bytes([0,0,2])) ) is error,"short header rejected")
  count=count+require(try(tga.decode(fixture(1,1,1,24,0,[0,0,0]))) is error,"unsupported type rejected")
  badMap=fixture(2,1,1,24,0,[0,0,0]);badMap[1]=1;count=count+require(try(tga.decode(badMap)) is error,"colormap rejected")
  count=count+require(try(tga.decode(fixture(2,1,1,16,0,[0,0]))) is error,"truecolor depth rejected")
  count=count+require(try(tga.decode(fixture(3,1,1,16,0,[0,0]))) is error,"gray depth rejected safely")
  count=count+require(try(tga.decode(fixture(2,0,1,24,0,[]))) is error,"zero dimension rejected")
  count=count+require(try(tga.decode(fixture(2,16385,1,24,0,[]))) is error,"oversize dimension rejected")
  count=count+require(try(tga.decode(fixture(2,2,1,24,0,[0,0,0]))) is error,"truncated pixels rejected")
  count=count+require(try(tga.decode(fixture(10,1,1,24,0,[]))) is error,"missing RLE header rejected")
  count=count+require(try(tga.decode(fixture(10,1,1,24,0,[128,1,2]))) is error,"truncated RLE run rejected")
  count=count+require(try(tga.decode(fixture(10,2,1,24,0,[1,1,2,3]))) is error,"truncated RLE raw packet rejected")
  count=count+require(try(tga.decode(fixture(10,1,1,24,0,[129,1,2,3]))) is error,"oversize RLE packet rejected")
  badId=fixture(2,1,1,24,0,[]);badId[0]=4;count=count+require(try(tga.decode(badId)) is error,"truncated image id rejected")
  print("PASS: "+str(count)+" TGA contracts")
  return 0
end function
