// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.format.pk3 as pk3
import mq3.format.deflate as df
import mq3.format.bsp as bsp
import mq3.vm.interpreter as vm
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
import std.string as strings

function badSyscall(state, address)
  return error(3904, "intentional syscall failure")
end function

function main(args)
  count = 0
  for each line in fs.readAllLines(args[0])
    line = strings.trim(line)
    if len(line) == 0 then continue end if
    fields = strings.split(line, "\t")
    mode = fields[0]
    path = fields[1]
    caught = void
    if mode == "collision_valid" then cm.load(fs.readAllBytes(path));continue end if
    if mode == "deflate" then caught = try(df.inflate(fs.readAllBytes(path), toNumber(fields[2]))) end if
    if mode == "pk3" then caught = try(pk3.open(path)) end if
    if mode == "entry" then
      archive = pk3.open(path)
      caught = try(pk3.read(archive, fields[2]))
    end if
    if mode == "bsp" then caught = try(bsp.load(fs.readAllBytes(path))) end if
    if mode == "collision" then caught = try(cm.load(fs.readAllBytes(path))) end if
    if strings.indexOf(mode,"trace_",0) == 0 then
      world = cm.loadBrushWorld(fs.readAllBytes(path))
      start = [0.0,0.0,0.0];finish = [100.0,0.0,0.0];mins = [-1.0,-1.0,-1.0];maxs = [1.0,1.0,1.0]
      model = 0;curves = false
      if mode == "trace_nan" then start[0] = n.bitsFloat(0x7fc00000) end if
      if mode == "trace_bounds" then mins[0] = 2.0 end if
      if mode == "trace_model" then model = -1 end if
      if mode == "trace_vector" then finish = [0.0] end if
      if mode == "trace_missing_curves" then curves = true end if
      caught = try(cm.trace(world,start,finish,mins,maxs,model,1,false,curves))
    end if
    if mode == "loadvm" then caught = try(vm.load(fs.readAllBytes(path), void)) end if
    if mode == "runvm" or mode == "syscall" then
      callback = void
      if mode == "syscall" then callback = badSyscall end if
      state = vm.load(fs.readAllBytes(path), callback)
      state.limit = 1000
      saved = state.programStack
      caught = try(vm.call(state, []))
      if state.programStack != saved then return error(3904, "QVM stack not restored on error") end if
    end if
    if caught is not error then
      print "FAIL: malformed input accepted: " + mode + " " + path
      return 1
    end if
    count = count + 1
  end for
  print "PASS: " + str(count) + " malformed-input and QVM recovery cases"
  return 0
end function
