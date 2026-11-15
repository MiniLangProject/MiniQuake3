// SPDX-License-Identifier: GPL-2.0-or-later
// Frozen pre-fix query storage from f5d357f; differential-test code only.
function legacySeenFlags(world) return [array(len(world.brushes),false),array(len(world.surfaces),false)] end function

function legacyAreaEntities(scene,mins,maxs,capacity)
  if typeof(capacity) != "int" or capacity < 0 or capacity > 1024 then return error(480,"Invalid server area-list capacity") end if
  mins = cm.vector32(mins); maxs = cm.vector32(maxs)
  result=array(capacity,0);resultCount=0
  // The world has a fixed depth-four tree. Use an explicit fixed stack so a
  // trace does not allocate and copy a new array on every visited sector.
  stack=array(32,0);stackCount=1;stack[0]=0
  while stackCount > 0 and resultCount < capacity
    stackCount=stackCount-1;index=stack[stackCount]
    node = scene.sectors[index]; scan = node.head
    while scan != -1
      ent = scene.entities[scan]; scan = ent.nextEntity; overlaps = true
      for axis = 0 to 2
        if ent.absmin[axis] > maxs[axis] or ent.absmax[axis] < mins[axis] then overlaps = false; break end if
      end for
      if not overlaps then continue end if
      if resultCount == capacity then break end if
      result[resultCount]=ent.number;resultCount=resultCount+1
    end while
    if resultCount == capacity or node.axis == -1 then continue end if
    // LIFO: original visits positive child first, with strict split comparisons.
    if mins[node.axis] < node.distance then stack[stackCount]=node.children[1];stackCount=stackCount+1 end if
    if maxs[node.axis] > node.distance then stack[stackCount]=node.children[0];stackCount=stackCount+1 end if
  end while
  return arrays.slice(result,0,resultCount)
end function
