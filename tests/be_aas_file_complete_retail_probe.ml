import mq3.botlib.be_aas_file as aasFile
import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import std.string as strings

struct Host raw written end struct
function readFile(host,name) return host.raw end function
function writeFile(host,name,data) host.written=data;return true end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  host=Host(void,void);svc=aasFile.services(host);svc.readFileFn=readFile;svc.writeFileFn=writeFile;state=aasFile.create(svc);files=0;bytesWritten=0;records=0
  for each entry in archive.entries
    if strings.endsWith(strings.toLowerAscii(entry.name),".aas") then
      host.raw=pk3.readEntry(archive,entry);result=aasFile.AAS_LoadAASFile(state,entry.name,void);if result!=aasFile.BLERR_NOERROR then return error(7894,"Retail load "+entry.name+" failed "+str(result)) end if
      if not aasFile.AAS_WriteAASFile(state,entry.name+".roundtrip") then return error(7894,"Retail write "+entry.name+" failed") end if;round=aas.load(host.written);if round is error then return round end if
      if round.bspChecksum!=state.map.bspChecksum or round.counts!=state.map.counts then return error(7894,"Retail roundtrip mismatch "+entry.name) end if
      for lump=0 to aas.LUMP_COUNT-1 if aas.lumpData(round,lump)!=aas.lumpData(state.map,lump) then return error(7894,"Retail lump mismatch "+entry.name) end if;records=records+round.counts[lump] end for
      files=files+1;bytesWritten=bytesWritten+len(host.written)
    end if
  end for
  print("PASS: retail AAS file roundtrips="+str(files)+" bytes="+str(bytesWritten)+" records="+str(records));return 0
end function
