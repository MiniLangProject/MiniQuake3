// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
struct VmTraceMemory data mask end struct

function checkVmBox(world,vm,inputs,off,expected,model,mask,output)
  n.writeU32(vm.data,20,output)
  n.writeU32(vm.data,24,128)
  n.writeU32(vm.data,28,140)
  n.writeU32(vm.data,32,152)
  n.writeU32(vm.data,36,164)
  n.writeU32(vm.data,40,model)
  n.writeU32(vm.data,44,mask)
  n.writeU32(vm.data,48,176)
  n.writeU32(vm.data,52,188)
  copyBytes(vm.data,128,inputs,off,72)
  if not cm.writeVmTemporaryBoxTrace(world,vm,16) then return false end if
  for field=0 to 13
    if n.readU32(vm.data,output+4*field)!=expected[field] then return false end if
  end for
  return true
end function

function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2])
  count = n.quotient(len(inputs),112)
  if len(inputs) != count*112 or len(expected) != count*96 then return 2 end if
  index = 0;vm=VmTraceMemory(bytes(256,0),255);vmCases=0
  while index < count
    off = index*112
    start = vector(inputs,off); finish = vector(inputs,off+12)
    mins = vector(inputs,off+24); maxs = vector(inputs,off+36)
    origin = vector(inputs,off+48); angles = vector(inputs,off+60)
    model = n.readI32(inputs,off+96); mask = n.readI32(inputs,off+100)
    capsule = n.readI32(inputs,off+104) != 0; kind = n.readI32(inputs,off+108)
    if kind >= 1 and kind <= 3 then model = cm.tempBoxModel(world,vector(inputs,off+72),vector(inputs,off+84),false) end if
    if kind == 3 then cm.tempBoxModel(world,mins,maxs,true) end if
    result = void
    if kind == 2 or kind == 3 or kind == 4 then
      result = cm.trace(world,start,finish,mins,maxs,model,mask,capsule,world.patchesReady)
    else
      if kind == 5 then mins = void; maxs = void end if
      result = cm.transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,world.patchesReady)
    end if
    tr = result.trace; startsolid = 0; allsolid = 0
    if tr.startsolid then startsolid = 1 end if
    if tr.allsolid then allsolid = 1 end if
    actual = [n.floatBits(tr.fraction)]
    for each value in tr.normal+[tr.distance]
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(tr.surfaceFlags),n.u32(tr.contents),startsolid,allsolid]
    for each value in result.endpos
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(cm.transformedPointContents(world,start,model,origin,angles)),n.u32(cm.transformedPointContents(world,finish,model,origin,angles)),tr.planeMetadata,model]
    bounds = cm.modelBounds(world,model)
    for each value in bounds[0]+bounds[1]
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(cm.pointContents(world,start,model)),n.u32(cm.pointContents(world,finish,model))]
    for field = 0 to 23
      wanted = n.readU32(expected,index*96+field*4)
      if actual[field] != wanted then
        print "FAIL spatial case "+str(index)+" kind "+str(kind)+" field "+str(field)+" got "+str(actual[field])+" wanted "+str(wanted)
        return 1
      end if
    end for
    if kind==1 and not capsule and model>=len(world.models) then
      // Match the complete x86 trace_t layout using the independent oracle
      // fields, including signed axial metadata, padding and the entity word.
      vmExpected=[actual[8],actual[7],actual[0],actual[9],actual[10],actual[11],
          actual[1],actual[2],actual[3],actual[4],actual[14],actual[5],actual[6],0]
      output=64;if vmCases%2==0 then output=128 end if
      if not checkVmBox(world,vm,inputs,off,vmExpected,model,mask,output) then
        print "FAIL spatial VM trace case "+str(index);return 1
      end if
      vmCases=vmCases+1
    end if
    index = index+1
  end while
  handle = cm.tempBoxModel(world,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],true)
  if handle != 254 then return 1 end if
  if len(world.models) <= 254 then
    capsuleResult = cm.trace(world,[0.0,0.0,0.0],[0.0,0.0,0.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],handle,-1,true,world.patchesReady)
    if not capsuleResult.trace.startsolid or not capsuleResult.trace.allsolid or capsuleResult.trace.fraction != 0.0 then return 1 end if
  end if
  if count>=12 and vmCases==0 and len(world.models)<=255 then return 1 end if
  // CM_Trace's original checkcount avoids clearing every map brush and patch
  // for every query. Exercise the byte-generation wrap while preserving the
  // exact trace result and the full original-C differential above.
  start=[0.0,0.0,0.0];finish=[16.0,0.0,0.0];mins=[-15.0,-15.0,-24.0];maxs=[15.0,15.0,32.0]
  first=cm.trace(world,start,finish,mins,maxs,0,-1,false,world.patchesReady)
  serial=world.temporary.visitSerial
  for repeat=0 to 259
    if serial>=255 then serial=0 end if;serial=serial+1
    again=cm.trace(world,start,finish,mins,maxs,0,-1,false,world.patchesReady)
    if world.temporary.visitSerial!=serial or n.floatBits(again.trace.fraction)!=n.floatBits(first.trace.fraction) or again.trace.contents!=first.trace.contents or again.trace.planeMetadata!=first.trace.planeMetadata or again.endpos!=first.endpos then return error(3503,"collision visit generation changed trace") end if
  end for
  // Out-of-range output must fall back without touching guest memory.
  if vmCases>0 then
    n.writeU32(vm.data,20,248);original=slice(vm.data,0,len(vm.data))
    if cm.writeVmTemporaryBoxTrace(world,vm,16) or vm.data!=original then return 1 end if
  end if
  // Original CM_TempBoxModel accepts encoded network solids whose upper
  // extent falls below their lower extent and still copies all six faces.
  inverted=cm.tempBoxModel(world,[0.0,0.0,0.0],[8.0,8.0,-32.0],false)
  if inverted!=255 or world.temporary.bounds[0][2]!=0.0 or world.temporary.bounds[1][2]!=-32.0 or world.temporary.brush.planes[4].distance!=-32.0 or world.temporary.brush.planes[5].distance!=0.0 then return error(3503,"inverted temporary hull did not preserve original face planes") end if
  print "PASS: "+str(count)+" transformed/temporary collision cases and productive capsule handle, VM trace ABI cases="+str(vmCases)
  return 0
end function
