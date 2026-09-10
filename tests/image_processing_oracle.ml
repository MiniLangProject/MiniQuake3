import mq3.renderer.image_processing as images

function fixture(width,height)
  data=bytes(width*height*4,0)
  for i=0 to width*height-1
    data[i*4]=(i*37+3)&255;data[i*4+1]=(i*61+7)&255;data[i*4+2]=(i*17+101)&255;data[i*4+3]=(i*29+211)&255
  end for
  return data
end function
function gammaTable()
  table=bytes(256,0);for i=0 to 255 table[i]=255-i end for;return table
end function
function intensityTable()
  table=bytes(256,0);for i=0 to 255 if i*2>255 then table[i]=255 else table[i]=i*2 end if end for;return table
end function
function show(label,data)
  line=label;for i=0 to len(data)-1 line=line+"|"+str(data[i]) end for;print(line)
end function
function main(args)
  show("resample-4x3-3x2",images.resample(fixture(4,3),4,3,3,2))
  show("resample-2x2-4x3",images.resample(fixture(2,2),2,2,4,3))
  show("gamma-software",images.lightScale(fixture(3,1),3,1,true,false,gammaTable(),intensityTable()))
  show("gamma-hardware",images.lightScale(fixture(3,1),3,1,true,true,gammaTable(),intensityTable()))
  show("intensity-hardware",images.lightScale(fixture(3,1),3,1,false,true,gammaTable(),intensityTable()))
  show("intensity-gamma",images.lightScale(fixture(3,1),3,1,false,false,gammaTable(),intensityTable()))
  show("mip-simple-4x4",images.mipMapSimple(fixture(4,4),4,4))
  show("mip-simple-1x4",images.mipMapSimple(fixture(1,4),1,4))
  show("mip-filtered-4x4",images.mipMapFiltered(fixture(4,4),4,4))
  show("mip-filtered-8x4",images.mipMapFiltered(fixture(8,4),8,4))
  return 0
end function
