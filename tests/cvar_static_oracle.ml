// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
function truth(value) if value then return 1 end if;return 0 end function
function main(args)
  hashes=["","abc","ABC","sv_cheats","textures\\base;\"x"]
  for each value in hashes print "H|"+value+"|"+str(cvar.generateHashValue(value)) end for
  print "V|"+str(truth(cvar.validName(void)))+"|"+str(truth(cvar.validName("clean_name")))+"|"+str(truth(cvar.validName("bad\\name")))+"|"+str(truth(cvar.validName("bad\"name")))+"|"+str(truth(cvar.validName("bad;name")))
  return 0
end function
