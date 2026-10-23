import mq3.platform.win_glimp_runtime as gl
function main(args)
  for each config in [[0,0,0,0],[16,16,0,0],[24,24,8,0],[32,24,8,1],[16,32,4,1]]
    stereo=false;if config[3]!=0 then stereo=true end if;pfd=gl.GLW_CreatePFD(config[0],config[1],config[2],stereo)
    stereoEnabled=0;if stereo then stereoEnabled=1 end if
    print "P "+str(pfd.flags)+" "+str(pfd.pixelType)+" "+str(pfd.colorBits)+" "+str(pfd.depthBits)+" "+str(pfd.stencilBits)+" "+str(pfd.layerType)+" "+str(stereoEnabled)
  end for
  return 0
end function
