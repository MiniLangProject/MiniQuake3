import mq3.botlib.be_aas_file as file
import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

struct Host reads writes names values end struct
function req(ok,label) if not ok then return error(7893,"be_aas_file: "+label) end if;return 1 end function
function readFile(host,name) host.reads=host.reads+1;for index=0 to len(host.names)-1 if host.names[index]==name then return host.values[index] end if end for;return void end function
function writeFile(host,name,data) host.writes=host.writes+1;host.names=host.names+[name];host.values=host.values+[data];return true end function
function clone(data) return slice(data,0,len(data)) end function

function main(args)
  if len(args)!=2 then return 2 end if;v4=fs.readAllBytes(args[0]);v5=fs.readAllBytes(args[1]);host=Host(0,0,["v4.aas","v5.aas"],[v4,v5]);svc=file.services(host);svc.readFileFn=readFile;svc.writeFileFn=writeFile;state=file.create(svc);count=0
  count=count+req(file.AAS_LoadAASFile(state,"v5.aas",0x12345678)==file.BLERR_NOERROR and state.loaded and state.map.version==aas.AAS_VERSION,"load v5")
  info=file.AAS_FileInfo(state);count=count+req(info.numAreas==2 and info.reachabilitySize==2 and info.numNodes==2 and info.groundedAreas==1,"file info")
  count=count+req(file.AAS_SwapAASData(state),"canonical endian representation")
  count=count+req(file.AAS_WriteAASFile(state,"roundtrip.aas") and host.writes==1,"write callback")
  encoded=host.values[len(host.values)-1];round=aas.load(encoded);count=count+req(not (round is error) and round.version==aas.AAS_VERSION and round.bspChecksum==0x12345678,"write v5 header")
  count=count+req(round.counts==state.map.counts and round.sequential,"write lumps")
  same=true;for lump=0 to aas.LUMP_COUNT-1 if aas.lumpData(round,lump)!=aas.lumpData(state.map,lump) then same=false end if end for;count=count+req(same,"lossless lump payloads")
  expected=aas.encode(state.map);count=count+req(encoded==expected,"format writer parity")
  count=count+req(file.AAS_LoadAASFile(state,"v4.aas",0x12345678)==file.BLERR_NOERROR and state.map.version==aas.AAS_VERSION_OLD,"load v4")
  count=count+req(file.AAS_LoadAASFile(state,"v4.aas",7)==file.BLERR_WRONGAASFILEVERSION and not state.loaded,"checksum rejection")
  bad=clone(v4);n.writeU32(bad,0,0);host.names=host.names+["badid.aas"];host.values=host.values+[bad];count=count+req(file.AAS_LoadAASFile(state,"badid.aas",void)==file.BLERR_WRONGAASFILEID,"identity error")
  bad=clone(v4);n.writeU32(bad,4,99);host.names=host.names+["badver.aas"];host.values=host.values+[bad];count=count+req(file.AAS_LoadAASFile(state,"badver.aas",void)==file.BLERR_WRONGAASFILEVERSION,"version error")
  host.names=host.names+["short.aas"];host.values=host.values+[slice(v4,0,7)];count=count+req(file.AAS_LoadAASFile(state,"short.aas",void)==file.BLERR_CANNOTREADAASLUMP,"short header error")
  count=count+req(file.AAS_LoadAASFile(state,"missing.aas",void)==file.BLERR_CANNOTOPENAASFILE,"open error")
  data=bytes([1,2,3,4,5]);original=clone(data);file.AAS_DData(data,len(data));file.AAS_DData(data,len(data));count=count+req(data==original,"DData involution")
  lump=file.AAS_LoadAASLump(v4,124,32,124,32);count=count+req(not (lump is error) and lump.sequential and len(lump.data)==32 and lump.nextOffset==156,"load lump")
  count=count+req((try(file.AAS_LoadAASLump(v4,124,31,124,32))) is error,"load lump stride")
  output=file.writer(42);count=count+req(file.AAS_WriteAASLump(output,0,bytes([9,8,7]),3) and n.readI32(output.header,12)==aas.HEADER_SIZE and n.readI32(output.header,16)==3,"write lump ABI")
  count=count+req(not file.AAS_WriteAASLump(output,aas.LUMP_COUNT,bytes(0,0),0),"write lump bounds")
  file.AAS_LoadAASFile(state,"v5.aas",void);file.AAS_DumpAASData(state);count=count+req(not state.loaded and state.map==void and not state.saveFile,"dump")
  count=count+req(aas.PRESENCE_NONE==1 and aas.TRAVEL_FUNCBOB==19 and aas.FACE_BRIDGE==64 and aas.AREA_BRIDGE==16,"aasfile constants")
  count=count+req(aas.AREACONTENTS_MODELNUMSHIFT==24 and aas.AREACONTENTS_MODELNUM==0xff000000 and aas.TRAVELFLAG_NOTTEAM2==0x02000000,"aasfile masks")
  header=aas.header(round);count=count+req(header.ident==aas.AAS_ID and len(header.lumps)==14 and header.lumps[13].fileLength==round.lengths[13],"header structs")
  print("PASS: "+str(count)+" complete be_aas_file/aasfile contracts");return 0
end function
