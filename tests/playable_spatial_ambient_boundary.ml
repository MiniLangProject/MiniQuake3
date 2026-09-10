import mq3.client.playable_spatial_ambient as ambient

function main(args)
  if ambient.OUTPUT_RATE<1 then ambient.shutdown(void) end if
  return 0
end function
