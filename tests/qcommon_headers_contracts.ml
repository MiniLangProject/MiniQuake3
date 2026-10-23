import mq3.qcommon.headers as h

function req(ok,message)
  if not ok then return error(7991,"qcommon headers: "+message) end if
  return 1
end function
function has(items,name)
  for each item in items if item==name then return true end if end for
  return false
end function
function main(args)
  count=0
  count=count+req(h.MAX_SUBMODELS==256 and h.BOX_MODEL_HANDLE==255 and h.CAPSULE_MODEL_HANDLE==254,"clip handles")
  count=count+req(h.MAX_FACETS==1024 and h.MAX_PATCH_PLANES==2048 and h.MAX_GRID_SIZE==129,"patch limits")
  count=count+req(h.SIDE_FRONT==0 and h.SIDE_BACK==1 and h.SIDE_ON==2 and h.SIDE_CROSS==3,"winding sides")
  count=count+req(h.PACKET_BACKUP==32 and h.PACKET_MASK==31 and h.reliableSlot(65)==1,"packet ring")
  count=count+req(h.MAX_MSGLEN==16384 and h.validMessageSize(16384) and not h.validMessageSize(16385),"message limit")
  count=count+req(h.MAX_DOWNLOAD_WINDOW==8 and h.validDownloadBlock(2048) and not h.validDownloadBlock(2049),"download limits")
  count=count+req(h.PROTOCOL_VERSION==68 and h.PORT_SERVER==27960 and h.NUM_SERVER_PORTS==4,"protocol")
  count=count+req(h.UNZ_OK==0 and h.UNZ_END_OF_LIST_OF_FILE==-100 and h.UNZ_CRCERROR==-105,"unzip results")
  count=count+req(h.validUnzipResult(0) and h.validUnzipResult(-100) and not h.validUnzipResult(-1),"unzip result contract")
  count=count+req(h.validInlineModel(0,4) and h.validInlineModel(3,4) and not h.validInlineModel(4,4),"inline model range")
  count=count+req(len(h.macroNames())==75 and len(h.enumNames())==46 and len(h.typeNames())==45,"definition counts")
  count=count+req(len(h.functionNames())==343 and len(h.globalNames())==32,"declaration counts")
  count=count+req(len(h.fieldNames())==222,"field count")
  count=count+req(has(h.typeNames(),"traceWork_t") and has(h.typeNames(),"netchan_t") and has(h.typeNames(),"unz_s"),"major ABI types")
  count=count+req(has(h.functionNames(),"CM_TransformedBoxTrace") and has(h.functionNames(),"Netchan_Process") and has(h.functionNames(),"unzReadCurrentFile"),"major APIs")
  count=count+req(has(h.fieldNames(),"netchan_t.unsentBuffer") and has(h.fieldNames(),"traceWork_t.sphere") and has(h.fieldNames(),"unz_s.pfile_in_zip_read"),"ABI fields")
  count=count+req(len(h.cmlocalFunctionNames())==9 and len(h.cmpublicFunctionNames())==23 and len(h.unzipFunctionNames())==18,"header declaration partitions")
  count=count+req(h.headerCounts()==[75,46,45,344,32,222],"source occurrence counts")
  print "PASS: "+str(count)+" qcommon header contracts"
  return 0
end function
