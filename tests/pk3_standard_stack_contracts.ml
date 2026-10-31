import mq3.format.pk3 as pk3

function require(condition,message)
  if not condition then return error(7691,message) end if
  return 1
end function

function main(args)
  if len(args)!=1 then return error(7692,"expected baseq3 fixture directory") end if
  archive=pk3.openStandard(args[0]);if archive is error then return archive end if
  count=0
  count=count+require(len(archive.entries)==4,"stack must deduplicate overridden qpaths")
  count=count+require(decode(pk3.read(archive,"shared.txt"))=="custom","alphabetically later PK3 must override lower pak")
  count=count+require(decode(pk3.read(archive,"pak0-only.txt"))=="base","pak0-only file must remain readable")
  count=count+require(decode(pk3.read(archive,"pak1-only.txt"))=="patch","patch-only file must be readable")
  count=count+require(decode(pk3.read(archive,"custom-only.txt"))=="custom","custom-named PK3 must be mounted")
  print "PASS: "+str(count)+" standard PK3 stack contracts"
  return 0
end function
