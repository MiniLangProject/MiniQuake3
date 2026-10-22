import mq3.qcommon.files_runtime as files

function main(args)
  names=["A/B.TGA","a\\b.jpg","vm/cgame.qvm","scripts/common.shader","","pak0.pk3"]
  for each name in names print("H "+str(files.fs_HashFileName(name,1024))) end for
  first=0;if files.fs_FilenameCompare("Maps:A.BSP","maps/a.bsp") then first=-1 end if;second=0;if files.fs_FilenameCompare("a","b") then second=-1 end if;third=0;if files.fs_FilenameCompare("A\\B","a/b") then third=-1 end if;print("F "+str(first)+" "+str(second)+" "+str(third))
  found=files.fs_ShiftedStrStr("xxcgame.qvmzz","\\`Zf^'jof",7);offset=-1;if found!="" then offset=2 end if;print("S "+str(offset))
  print("C "+files.fs_ConvertPath("a\\b:c")+" "+files.fs_ConvertPath("maps\\q3dm1.bsp"))
  print("P "+str(files.fs_PathCmp("B\\x","a/x"))+" "+str(files.fs_PathCmp("same","SAME"))+" "+str(files.fs_PathCmp("a","aa")))
  value=files.fs_ReturnPath("maps/q3dm1.bsp");print("R "+str(value[0])+" "+str(value[2])+" "+value[1]);return 0
end function
