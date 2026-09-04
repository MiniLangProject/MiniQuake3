// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.vm.interpreter as vm
import std.fs as fs

function main(args)
  if len(args) == 2 and args[0] == "--inspect-pk3" then
    archive = pk3.open(args[1])
    print "PK3: " + archive.path
    print "Entries: " + str(len(archive.entries))
    for each entry in archive.entries
      print entry.name + " " + str(entry.size)
    end for
    return 0
  end if
  if len(args) == 3 and args[0] == "--inspect-map" then
    archive = pk3.open(args[1])
    map = bsp.load(pk3.read(archive, args[2]))
    print "BSP46: " + args[2]
    print "Entities: " + str(len(bsp.entities(map)))
    print "Models: " + str(map.counts[7]) + " Brushes: " + str(map.counts[8])
    print "Surfaces: " + str(map.counts[13]) + " Vertices: " + str(map.counts[10])
    return 0
  end if
  if len(args) == 3 and args[0] == "--vm-probe" then
    state = vm.load(fs.readAllBytes(args[1]), void)
    print "vmMain: " + str(vm.call(state, [toNumber(args[2])]))
    print "Instructions: " + str(state.steps)
    return 0
  end if
  print "MiniQuake3 development runtime"
  print "Reference: Quake III Arena 1.32b / protocol 68"
  print "Port in progress; no playable engine yet."
  print "--inspect-pk3 <archive.pk3>"
  print "--inspect-map <archive.pk3> <maps/name.bsp>"
  print "--vm-probe <module.qvm> <command> (without engine syscalls)"
  return 0
end function
