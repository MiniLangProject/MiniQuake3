import mq3.format.pk3 as pk3
import mq3.client.startup_assets as startup
import std.fs as fs

function require(condition,message)
  if not condition then return error(7691,message) end if
  return 1
end function

function selectedData(data)
  if data==void then return "" end if
  return decode(pk3.read(data.archive,"selected.txt"))
end function

function main(args)
  if len(args)!=2 then return error(7692,"expected baseq3 and startup fixture directories") end if
  archive=pk3.openStandard(args[0]);if archive is error then return archive end if
  count=0
  count=count+require(len(archive.entries)==4,"stack must deduplicate overridden qpaths")
  count=count+require(decode(pk3.read(archive,"shared.txt"))=="custom","alphabetically later PK3 must override lower pak")
  count=count+require(decode(pk3.read(archive,"pak0-only.txt"))=="base","pak0-only file must remain readable")
  count=count+require(decode(pk3.read(archive,"pak1-only.txt"))=="patch","patch-only file must be readable")
  count=count+require(decode(pk3.read(archive,"custom-only.txt"))=="custom","custom-named PK3 must be mounted")
  root=args[1]
  localRoot=fs.joinPath(root,"local")
  data=startup.openRetailArchive(localRoot)
  count=count+require(selectedData(data)=="beside exe" and data.directory==localRoot,
    "direct EXE directory must take precedence over baseq3")
  count=count+require(selectedData(startup.openRetailArchive(fs.joinPath(root,"fallback")))=="local baseq3",
    "a damaged PK3 must allow fallback to local baseq3")
  retail=fs.joinPath(root,"retail-disc")
  alternate=fs.joinPath(root,"alternate-disc")
  missing=fs.joinPath(root,"missing-disc")
  data=startup.openCdArchive([missing,retail,alternate])
  count=count+require(selectedData(data)=="retail disc" and data.directory==fs.joinPath(retail,"Quake3/baseq3"),
    "CD search must skip missing media and prefer the retail layout")
  count=count+require(selectedData(startup.openCdArchive([alternate]))=="alternate disc",
    "CD search must recognize the alternate installer layout")
  count=count+require(startup.openCdArchive([missing])==void,"missing archives must return void")
  print "PASS: "+str(count)+" standard PK3 stack and startup discovery contracts"
  return 0
end function
