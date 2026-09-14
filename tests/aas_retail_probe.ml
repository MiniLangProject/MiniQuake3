import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import std.string as strings

function main(args)
  if len(args)!=1 then print("usage: aas_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  files=0;oldFiles=0;encryptedFiles=0;areas=0;reachabilities=0;nodes=0;clusters=0;checksum=0
  for each entry in archive.entries
    if strings.endsWith(strings.toLowerAscii(entry.name),".aas") then
      data=pk3.readEntry(archive,entry);if data is error then return data end if;map=aas.load(data);if map is error then return map end if
      files=files+1;if map.version==aas.AAS_VERSION_OLD then oldFiles=oldFiles+1 else encryptedFiles=encryptedFiles+1 end if
      areas=areas+map.counts[aas.LUMP_AREAS];reachabilities=reachabilities+map.counts[aas.LUMP_REACHABILITY];nodes=nodes+map.counts[aas.LUMP_NODES];clusters=clusters+map.counts[aas.LUMP_CLUSTERS];checksum=checksum^map.bspChecksum
    end if
  end for
  if files==0 then return error(7511,"retail AAS files missing") end if
  print("PASS: retail AAS files="+str(files)+" v4="+str(oldFiles)+" v5="+str(encryptedFiles)+" areas="+str(areas)+" reachabilities="+str(reachabilities)+" nodes="+str(nodes)+" clusters="+str(clusters)+" checksumXor="+str(checksum));return 0
end function
