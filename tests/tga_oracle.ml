import mq3.renderer.tga as tga

function fixture(header,payload) return bytes(header+payload) end function
function show(name,data)
  image=tga.decode(data);line=name+"|"+str(image.width)+"|"+str(image.height)+"|"+str(image.topDownDeclared)
  for i=0 to len(image.pixels)-1 line=line+"|"+str(image.pixels[i]) end for
  print(line)
end function
function main(args)
  show("rgb24",fixture([0,0,2,0,0,0,0,0,0,0,0,0,2,0,2,0,24,0],[1,2,3,4,5,6,7,8,9,10,11,12]))
  show("rgba32-id",fixture([3,0,2,0,0,0,0,0,0,0,0,0,2,0,1,0,32,0],[65,66,67,9,8,7,6,5,4,3,2]))
  show("gray",fixture([0,0,3,0,0,0,0,0,0,0,0,0,3,0,1,0,8,0],[0,127,255]))
  show("rle-run",fixture([0,0,10,0,0,0,0,0,0,0,0,0,3,0,2,0,24,0],[131,30,20,10,1,3,2,1,6,5,4]))
  show("rle-raw-cross",fixture([0,0,10,0,0,0,0,0,0,0,0,0,2,0,2,0,32,32],[3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]))
  return 0
end function
