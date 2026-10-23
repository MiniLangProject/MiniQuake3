import mq3.client.cgame_public as p
function req(ok,label) if not ok then return error(7956,"cg_public.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(p.CMD_BACKUP==64 and p.CMD_MASK==63,"command ring constants")
  count=count+req(p.validCommandNumber(100,100) and p.validCommandNumber(100,37) and not p.validCommandNumber(100,36) and not p.validCommandNumber(100,101),"command ring bounds")
  count=count+req(p.validSnapshotEntityCount(0) and p.validSnapshotEntityCount(256) and not p.validSnapshotEntityCount(-1) and not p.validSnapshotEntityCount(257),"snapshot entity bounds")
  count=count+req(p.CG_PRINT==0 and p.CG_FS_SEEK==89 and p.CG_MEMSET==100 and p.CG_ACOS==111,"import ordinal ranges")
  count=count+req(p.CG_INIT==0 and p.CG_EVENT_HANDLING==8,"export ordinal range")
  count=count+req(p.validEventHandling(0) and p.validEventHandling(3) and not p.validEventHandling(-1) and not p.validEventHandling(4),"event handling range")
  names=p.typeNames();count=count+req(len(names)==3 and names[0]=="snapshot_t" and names[2]=="cgameExport_t","type inventory")
  snap=p.Snapshot(4,12,100,bytes(32,0),"ps",2,["a","b"],3,9);count=count+req(snap.snapFlags==4 and snap.numEntities==2 and snap.serverCommandSequence==9,"snapshot mirror")
  count=count+req(p.CGAME_IMPORT_API_VERSION==4,"API version")
  count=count+req(p.CG_R_LOADWORLDMAP==36 and p.CG_R_RENDERSCENE==44 and p.CG_R_INPVS==88,"renderer trap range")
  print "PASS: "+str(count)+" cg_public.h ABI contracts";return 0
end function
