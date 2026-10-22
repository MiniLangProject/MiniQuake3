import mq3.qcommon.files_runtime as runtime

function require(ok,text) if not ok then return error(7669,text) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;root=args[0];state=runtime.create(root,root,"","baseq3",0x13579bdf);checks=0
  checks=checks+require(runtime.fs_Startup(state,"baseq3")>0 and runtime.fs_Initialized(state),"retail startup")
  checks=checks+require(runtime.fs_LoadedPakNames(state)!="" and runtime.fs_LoadedPakChecksums(state)!="" and runtime.fs_LoadedPakPureChecksums(state)!="","retail pak metadata")
  cfg=runtime.fs_ReadFile(state,"default.cfg");checks=checks+require(cfg!=void and len(cfg)>1000,"retail default config")
  cgame=runtime.fs_FOpenFileRead(state,"vm/cgame.qvm",true);checks=checks+require(cgame.length>100000,"retail cgame QVM stream");runtime.fs_FCloseFile(state,cgame.handle)
  ui=runtime.fs_FileIsInPAK(state,"vm/ui.qvm");checks=checks+require(ui.found and ui.checksum!=0,"retail UI QVM pak lookup")
  maps=runtime.fs_ListFiles(state,"maps",".bsp");checks=checks+require(len(maps)>=20,"retail BSP list")
  shaders=runtime.fs_ListFiles(state,"scripts",".shader");checks=checks+require(len(shaders)>=20,"retail shader list")
  model=runtime.fs_ReadFile(state,"models/players/sarge/lower.md3");checks=checks+require(model!=void and len(model)>10000,"retail model read")
  pak=state.fs.paths[0].pak;runtime.fs_PureServerSetLoadedPaks(state,str(pak.checksum),"baseq3/"+pak.basename);checks=checks+require(runtime.fs_PakIsPure(state,pak),"retail pure filtering")
  runtime.fs_ReadFile(state,"maps/q3dm1.bsp");checks=checks+require(runtime.fs_ReferencedPakChecksums(state)!="" and runtime.fs_ReferencedPakPureChecksums(state)!="","retail referenced proof")
  print("PASS: "+str(checks)+" retail files.c probes maps="+str(len(maps))+" shaders="+str(len(shaders))+" paks="+str(len(state.fs.paths)));return 0
end function
