import mq3.renderer.image_processing as images

function require(ok,text) if not ok then return error(7161,text) end if;return 1 end function
function identityTable() table=bytes(256,0);for i=0 to 255 table[i]=i end for;return table end function
function main(args)
  count=0;identity=identityTable();inverse=bytes(256,0);double=bytes(256,0)
  for i=0 to 255 inverse[i]=255-i;if i<128 then double[i]=i*2 else double[i]=255 end if end for
  one=bytes([10,20,30,40])
  count=count+require(images.mipMapSimple(one,1,1)==one,"1x1 mip is retained")
  line=bytes([0,10,20,30,20,30,40,50,100,110,120,130,200,210,220,230])
  count=count+require(images.mipMapSimple(line,4,1)==bytes([10,20,30,40,150,160,170,180]),"horizontal 1D mip")
  count=count+require(images.mipMapSimple(line,1,4)==bytes([10,20,30,40,150,160,170,180]),"vertical 1D mip")
  square=bytes([0,4,8,12,20,24,28,32,40,44,48,52,60,64,68,72])
  count=count+require(images.mipMapSimple(square,2,2)==bytes([30,34,38,42]),"2x2 box average")
  count=count+require(images.resample(one,1,1,3,2)==bytes([10,20,30,40,10,20,30,40,10,20,30,40,10,20,30,40,10,20,30,40,10,20,30,40]),"one pixel expands exactly")
  rgba=bytes([10,20,30,40,100,150,200,250])
  count=count+require(images.lightScale(rgba,2,1,true,true,inverse,double)==rgba,"hardware gamma leaves gamma-only data")
  count=count+require(images.lightScale(rgba,2,1,true,false,inverse,double)==bytes([245,235,225,40,155,105,55,250]),"software gamma maps RGB only")
  count=count+require(images.lightScale(rgba,2,1,false,true,inverse,double)==bytes([20,40,60,40,200,255,255,250]),"hardware path applies intensity")
  count=count+require(images.lightScale(rgba,2,1,false,false,inverse,double)==bytes([235,215,195,40,55,0,0,250]),"software path composes intensity and gamma")
  flat=bytes(4*4*4,77);filtered=images.mipMapFiltered(flat,4,4)
  count=count+require(len(filtered)==16,"filtered mip dimensions")
  count=count+require(filtered==bytes(16,77),"filtered mip preserves flat color")
  count=count+require(try(images.resample(one,1,1,2049,1)) is error,"resample width limit")
  count=count+require(try(images.resample(one,1,1,0,1)) is error,"zero output rejected")
  count=count+require(try(images.mipMapSimple(bytes([1,2,3]),1,1)) is error,"truncated input rejected")
  count=count+require(try(images.mipMapFiltered(bytes(3*2*4,0),3,2)) is error,"filtered non-power-of-two rejected")
  count=count+require(try(images.mipMapFiltered(bytes(8,0),1,2)) is error,"filtered narrow image rejected")
  count=count+require(try(images.lightScale(one,1,1,false,false,bytes(255,0),identity)) is error,"short gamma table rejected")
  count=count+require(try(images.lightScale(one,1,1,false,false,identity,bytes(1,0))) is error,"short intensity table rejected")
  count=count+require(images.lightScale(one,1,1,false,true,identity,identity)==one,"identity mapping")
  print("PASS: "+str(count)+" image-processing contracts")
  return 0
end function
