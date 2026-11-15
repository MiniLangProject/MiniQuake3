// SPDX-License-Identifier: GPL-2.0-or-later
// Frozen pre-fix traversal from f5d357f; compiled only into differential tests.
function legacythroughTree(work)
  // Depth-first stack retains the original near-child/far-child visit order.
  // The BSP has already been validated as a tree, so its maximum pending
  // frontier is bounded. An indexed stack avoids copying that frontier on
  // every pop and push in each gameplay trace.
  stack = array(len(work.world.nodes)+1,void); top = 0
  stack[0] = [0,0.0,1.0,work.start,work.finish]
  while top >= 0
    item = stack[top]; top = top-1
    num = item[0]; p1f = item[1]; p2f = item[2]; p1 = item[3]; p2 = item[4]
    if work.trace.fraction <= p1f then continue end if
    if num < 0 then throughLeaf(work,work.world.leaves[-1-num],false); continue end if
    node = work.world.nodes[num]
    t1 = 0.0; t2 = 0.0; offset = 0.0
    if node.axis < 3 then
      t1 = n.fsub(p1[node.axis],node.plane.distance)
      t2 = n.fsub(p2[node.axis],node.plane.distance)
      if not work.isPoint then offset = work.maxs[node.axis] end if
    else
      t1 = n.fsub(q.DotProduct(node.plane.normal,p1),node.plane.distance)
      t2 = n.fsub(q.DotProduct(node.plane.normal,p2),node.plane.distance)
      if not work.isPoint then offset = n.f32(2048) end if
    end if
    if t1 >= n.fadd(offset,1.0) and t2 >= n.fadd(offset,1.0) then
      top = top+1; stack[top] = [node.children[0],p1f,p2f,p1,p2]; continue
    end if
    if t1 < n.fsub(-offset,1.0) and t2 < n.fsub(-offset,1.0) then
      top = top+1; stack[top] = [node.children[1],p1f,p2f,p1,p2]; continue
    end if
    side = 0; fraction = n.f32(1); fraction2 = n.f32(0)
    if t1 < t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      side = 1
      fraction2 = n.f32((n.fadd(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
      fraction = n.f32((n.fsub(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
    else if t1 > t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      fraction2 = n.f32((n.fsub(t1,offset)-qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
      fraction = n.f32((n.fadd(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
    end if
    fraction = max(0.0,min(1.0,fraction))
    fraction2 = max(0.0,min(1.0,fraction2))
    midf = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction))
    midf2 = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction2))
    top = top+1; stack[top] = [node.children[side^1],midf2,p2f,interpolate(p1,p2,fraction2),p2]
    top = top+1; stack[top] = [node.children[side],p1f,midf,p1,interpolate(p1,p2,fraction)]
  end while
  return void
end function

function legacypositionTest(work)
  mins = array(3,0.0)
  maxs = array(3,0.0)
  for axis = 0 to 2
    mins[axis] = n.fsub(n.fadd(work.start[axis],work.mins[axis]),1.0)
    maxs[axis] = n.fadd(n.fadd(work.start[axis],work.maxs[axis]),1.0)
  end for
  stack = [0]
  leaves = []
  while len(stack) > 0
    num = stack[len(stack)-1]
    stack = arrays.slice(stack,0,len(stack)-1)
    if num < 0 then
      if len(leaves) < 1024 then leaves = leaves + [-1-num] end if
    else
      node = work.world.nodes[num]
      side = boxSide(mins,maxs,node.plane)
      if side == 1 then
        stack = stack+[node.children[0]]
      else if side == 2 then
        stack = stack+[node.children[1]]
      else
        stack = stack+[node.children[1],node.children[0]]
      end if
    end if
  end while
  for each leaf in leaves
    throughLeaf(work,work.world.leaves[leaf],true)
    if work.trace.allsolid then break end if
  end for
  return void
end function
