// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_mem as mem
import mq3.game.memory as arena
import mq3.game.entities as game
import mq3.collision.world as cm
import std.fs as fs

struct Context
  prints
end struct
function require(ok,label) if not ok then return error(7891,"g_mem complete: "+label) end if;return 1 end function
function record(level,text) level.context.prints=level.context.prints+[text];return void end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=game.create(world);level.context=Context([]);level.gamePrintFn=record;count=0
  mem.G_InitMemory(level);state=arena.get(level)
  count=count+require(mem.POOLSIZE==262144 and state.allocPoint==0,"pool/init")
  a=mem.G_Alloc(level,0);b=mem.G_Alloc(level,1);c=mem.G_Alloc(level,31);d=mem.G_Alloc(level,32);e=mem.G_Alloc(level,33)
  count=count+require(a.offset==0 and b.offset==0 and c.offset==32 and d.offset==64 and e.offset==96,"32-byte alignment")
  count=count+require(state.allocPoint==160,"rounded allocation point")
  arena.writeByte(b,0,173);mem.G_InitMemory(level);again=mem.G_Alloc(level,1)
  count=count+require(again.offset==0 and arena.readByte(again,0)==173,"rewind retains arena bytes")
  state.debugAlloc=1;before=len(level.context.prints);mem.G_Alloc(level,32)
  count=count+require(level.context.prints[before]=="G_Alloc of 32 bytes (262080 left)\n","debug diagnostic")
  mem.Svcmd_GameMem_f(level)
  count=count+require(level.context.prints[len(level.context.prints)-1]=="Game memory status: 64 out of 262144 bytes allocated\n","status diagnostic")
  state.debugAlloc=0;state.allocPoint=262144;atEnd=mem.G_Alloc(level,0)
  count=count+require(atEnd.offset==262144 and state.allocPoint==262144,"zero-size end pointer")
  count=count+require(try(mem.G_Alloc(level,1)) is error and state.allocPoint==262144,"capacity failure is atomic")
  print("PASS: "+str(count)+" g_mem complete contracts");return 0
end function
