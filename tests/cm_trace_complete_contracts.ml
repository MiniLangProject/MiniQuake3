// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

function require(condition,code) if not condition then print "FAIL cm_trace contract "+str(code);return error(code,"cm_trace contract") end if;return true end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true)
  handle=cm.CM_TempBoxModel(world,[-16.0,-16.0,-32.0],[16.0,16.0,32.0],true)
  require(handle==254,1);require(try(cm.CM_ClipHandleToModel(world,handle)) is error,2)
  require(try(cm.CM_ModelBounds(world,handle)) is error,3)
  require(cm.pointContents(world,[0.0,0.0,0.0],handle)==0x2000000,12);require(cm.pointContents(world,[40.0,0.0,0.0],handle)==0,13)
  inside=cm.boxTrace(world,[0.0,0.0,0.0],[0.0,0.0,0.0],[-8.0,-8.0,-16.0],[8.0,8.0,16.0],handle,-1,true)
  require(inside.trace.startsolid and inside.trace.allsolid and inside.trace.fraction==0.0,4)
  handle=cm.CM_TempBoxModel(world,[-16.0,-16.0,-32.0],[16.0,16.0,32.0],true)
  sweep=cm.boxTrace(world,[-80.0,0.0,0.0],[80.0,0.0,0.0],[-8.0,-8.0,-16.0],[8.0,8.0,16.0],handle,-1,true)
  require(sweep.trace.fraction>0.0 and sweep.trace.fraction<1.0,5);require(sweep.trace.contents==0x2000000,6);require(sweep.trace.normal[0]<0.0,7)
  handle=cm.CM_TempBoxModel(world,[-16.0,-16.0,-32.0],[16.0,16.0,32.0],true)
  boxSweep=cm.boxTrace(world,[-80.0,0.0,0.0],[80.0,0.0,0.0],[-8.0,-8.0,-12.0],[8.0,8.0,12.0],handle,-1,false)
  require(boxSweep.trace.fraction>0.0 and boxSweep.trace.fraction<1.0,8);require(boxSweep.trace.contents==0x2000000,9)
  handle=cm.CM_TempBoxModel(world,[-16.0,-16.0,-32.0],[16.0,16.0,32.0],true)
  miss=cm.boxTrace(world,[-80.0,100.0,0.0],[80.0,100.0,0.0],[-8.0,-8.0,-16.0],[8.0,8.0,16.0],handle,-1,true)
  require(miss.trace.fraction==1.0 and not miss.trace.startsolid,10)
  transformed=cm.transformedTrace(world,[-80.0,0.0,0.0],[80.0,0.0,0.0],[-8.0,-8.0,-16.0],[8.0,8.0,16.0],handle,-1,[10.0,0.0,0.0],[0.0,90.0,0.0],true,true)
  require(transformed.trace.fraction>=0.0 and transformed.trace.fraction<=1.0,11)
  print "PASS: capsule handle, position, sweep, reciprocal box and transformed contracts"
  return 0
end function
