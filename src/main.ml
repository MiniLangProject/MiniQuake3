// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.vm.interpreter as vm
import mq3.game.replay as replay
import std.fs as fs

function formatVector(vector)
  return "("+str(vector[0])+", "+str(vector[1])+", "+str(vector[2])+")"
end function

function printTrace(result)
  print "Fraction: "+str(result.trace.fraction)
  print "End: "+formatVector(result.endpos)
  print "Normal: "+formatVector(result.trace.normal)+" Distance: "+str(result.trace.distance)
  print "Contents: "+str(result.trace.contents)+" Surface flags: "+str(result.trace.surfaceFlags)
  print "Start solid: "+str(result.trace.startsolid)+" All solid: "+str(result.trace.allsolid)
  return void
end function

function main(args)
  if len(args) == 6 and args[0] == "--inspect-visibility" then
    archive = pk3.open(args[1]); world = cm.loadBrushWorld(pk3.read(archive,args[2]))
    point = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    leaf = cm.pointLeafnum(world,point); state = world.visibility
    cluster = vis.leafCluster(state,leaf); area = vis.leafArea(state,leaf)
    row = vis.clusterPVS(state,cluster); visible = 0; index = 0
    while index < state.numClusters
      if (row[index>>3] & (1 << (index & 7))) != 0 then visible = visible+1 end if
      index = index+1
    end while
    connected = 0; index = 0
    while index < state.numAreas
      if vis.areasConnected(state,area,index) then connected = connected+1 end if
      index = index+1
    end while
    print "Leaf: "+str(leaf)+" Cluster: "+str(cluster)+" Area: "+str(area)
    print "Clusters: "+str(state.numClusters)+" PVS bytes: "+str(state.clusterBytes)
    print "Visible clusters: "+str(visible)+" Connected areas: "+str(connected)
    print "Areas: "+str(state.numAreas)+" Leaves: "+str(len(world.leaves))
    return 0
  end if
  if len(args) == 16 and args[0] == "--trace-model" then
    archive = pk3.open(args[1]); world = cm.load(pk3.read(archive,args[2]))
    model = toNumber(args[3])
    start = [n.f32(toNumber(args[4])),n.f32(toNumber(args[5])),n.f32(toNumber(args[6]))]
    finish = [n.f32(toNumber(args[7])),n.f32(toNumber(args[8])),n.f32(toNumber(args[9]))]
    origin = [n.f32(toNumber(args[10])),n.f32(toNumber(args[11])),n.f32(toNumber(args[12]))]
    angles = [n.f32(toNumber(args[13])),n.f32(toNumber(args[14])),n.f32(toNumber(args[15]))]
    result = cm.transformedTrace(world,start,finish,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],model,0x2010001,origin,angles,false,true)
    print "Transformed player box trace: "+args[2]+" model "+str(model)
    printTrace(result)
    return 0
  end if
  if len(args) == 7 and args[0] == "--pmove-map" then
    archive = pk3.open(args[1]); world = cm.load(pk3.read(archive,args[2]))
    origin = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    return replay.run(world,origin,fs.readAllText(args[6]))
  end if
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
  if len(args) == 9 and args[0] == "--trace-map" then
    archive = pk3.open(args[1])
    world = cm.load(pk3.read(archive,args[2]))
    start = [n.f32(toNumber(args[3])),n.f32(toNumber(args[4])),n.f32(toNumber(args[5]))]
    finish = [n.f32(toNumber(args[6])),n.f32(toNumber(args[7])),n.f32(toNumber(args[8]))]
    result = cm.boxTrace(world,start,finish,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],0,0x2010001,false)
    print "Player box trace: "+args[2]+" (brushes and curved surfaces)"
    printTrace(result)
    return 0
  end if
  print "MiniQuake3 development runtime"
  print "Reference: Quake III Arena 1.32b / protocol 68"
  print "Port in progress; no playable engine yet."
  print "--inspect-pk3 <archive.pk3>"
  print "--inspect-map <archive.pk3> <maps/name.bsp>"
  print "--vm-probe <module.qvm> <command> (without engine syscalls)"
  print "--trace-map <archive.pk3> <maps/name.bsp> <sx> <sy> <sz> <ex> <ey> <ez>"
  print "--pmove-map <archive.pk3> <maps/name.bsp> <x> <y> <z> <commands.tsv>"
  print "--trace-model <archive.pk3> <maps/name.bsp> <model> <sx> <sy> <sz> <ex> <ey> <ez> <ox> <oy> <oz> <pitch> <yaw> <roll>"
  print "--inspect-visibility <archive.pk3> <maps/name.bsp> <x> <y> <z>"
  return 0
end function
