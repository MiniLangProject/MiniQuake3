// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar

function encodeHex(text)
  digits=bytes("0123456789abcdef");output=""
  for each value in bytes(text) output=output+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for
  return output
end function
function record(name,registry)
  serialized=cvar.writeVariables(registry)
  encoded=encodeHex(serialized)
  print name+"|"+encoded;return void
end function
function main(args)
  registry=cvar.create()
  cvar.get(registry,"alpha","one",cvar.ARCHIVE)
  cvar.get(registry,"beta","two",cvar.ARCHIVE|cvar.LATCH);cvar.set2(registry,"beta","pending",false)
  cvar.get(registry,"plain","ignored",0);cvar.get(registry,"CL_CDKEY","secret",cvar.ARCHIVE)
  cvar.get(registry,"CaseName","mixed",cvar.ARCHIVE);record("initial",registry)
  cvar.set2(registry,"alpha","changed",true);record("forced",registry)
  cvar.set2(registry,"beta","live",true);record("latch_applied",registry)
  print "PASS: 3 original Cvar_WriteVariables records";return 0
end function
