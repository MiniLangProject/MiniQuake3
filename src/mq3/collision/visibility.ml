// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CMod_LoadVisibility, CM_ClusterPVS and area portal connectivity from cm_test.c.
package mq3.collision.visibility
import mq3.compat.numeric as n

struct Visibility
  clusters
  areas
  numClusters
  numAreas
  clusterBytes
  data
  vised
  portals
  floodnums
  noAreas
end struct

function fail(message)
  return error(3504,"Visibility: "+message)
end function

function load(map)
  clusters = array(map.counts[4],0); areas = array(map.counts[4],0)
  numClusters = 0; numAreas = 0; index = 0
  while index < len(clusters)
    off = map.offsets[4]+index*48
    cluster = n.readI32(map.data,off); area = n.readI32(map.data,off+4)
    if cluster < -1 or cluster >= 131072 or area < -1 or area >= 256 then return fail("invalid leaf cluster/area") end if
    clusters[index] = cluster; areas[index] = area
    if cluster >= numClusters then numClusters = cluster+1 end if
    if area >= numAreas then numAreas = area+1 end if
    index = index+1
  end while
  vised = map.lengths[16] != 0
  clusterBytes = 0; data = void
  if vised then
    count = n.readI32(map.data,map.offsets[16]); clusterBytes = n.readI32(map.data,map.offsets[16]+4)
    if count < numClusters or clusterBytes < ((count+7)>>3) then return fail("visibility cannot address leaf clusters") end if
    numClusters = count
    data = slice(map.data,map.offsets[16]+8,map.lengths[16]-8)
  else
    // The original rounds the cluster count to 32 BYTES, without dividing by 8.
    clusterBytes = (numClusters+31) & ~31
    data = bytes(clusterBytes,255)
  end if
  state = Visibility(clusters,areas,numClusters,numAreas,clusterBytes,data,vised,array(numAreas*numAreas,0),array(numAreas,0),false)
  floodConnections(state)
  return state
end function

function leafCluster(state,leaf)
  if leaf < 0 or leaf >= len(state.clusters) then return fail("invalid leaf number") end if
  return state.clusters[leaf]
end function
function leafArea(state,leaf)
  if leaf < 0 or leaf >= len(state.areas) then return fail("invalid leaf number") end if
  return state.areas[leaf]
end function
function clusterPVS(state,cluster)
  offset = 0
  if cluster >= 0 and cluster < state.numClusters and state.vised then offset = cluster*state.clusterBytes end if
  // Invalid clusters return the first row, even when real visibility is present.
  return slice(state.data,offset,state.clusterBytes)
end function

// Hot PVS tests need one bit, not a freshly copied visibility row.
// Match clusterPVS's first-row fallback for invalid source clusters.
function clusterVisible(state,sourceCluster,targetCluster)
  if targetCluster<0 or (targetCluster>>3)>=state.clusterBytes then return false end if
  offset=0
  if sourceCluster>=0 and sourceCluster<state.numClusters and state.vised then offset=sourceCluster*state.clusterBytes end if
  return (state.data[offset+(targetCluster>>3)]&(1<<(targetCluster&7)))!=0
end function

function floodConnections(state)
  state.floodnums = array(state.numAreas,0)
  number = 0; root = 0
  while root < state.numAreas
    if state.floodnums[root] != 0 then root = root+1; continue end if
    number = number+1; pending = [root]; cursor = 0; state.floodnums[root] = number
    while cursor < len(pending)
      area = pending[cursor]; cursor = cursor+1; nextArea = 0
      while nextArea < state.numAreas
        if state.portals[area*state.numAreas+nextArea] > 0 and state.floodnums[nextArea] == 0 then
          state.floodnums[nextArea] = number; pending = pending+[nextArea]
        end if
        nextArea = nextArea+1
      end while
    end while
    root = root+1
  end while
  return void
end function

function adjustAreaPortalState(state,area1,area2,open)
  if area1 < 0 or area2 < 0 then return void end if
  if area1 >= state.numAreas or area2 >= state.numAreas then return fail("invalid area number") end if
  first = area1*state.numAreas+area2; second = area2*state.numAreas+area1
  change = 1
  if not open then change = -1 end if
  steps = 1
  if first == second then steps = 2 end if
  // A caught error must not leave a corrupt graph. C drops the map on this error.
  if state.portals[first]+change*steps < 0 or state.portals[first]+change*steps > 2147483647 then return fail("invalid portal reference count") end if
  state.portals[first] = state.portals[first]+change
  state.portals[second] = state.portals[second]+change
  floodConnections(state)
  return void
end function

function areasConnected(state,area1,area2)
  if state.noAreas then return true end if
  if area1 < 0 or area2 < 0 then return false end if
  if area1 >= state.numAreas or area2 >= state.numAreas then return fail("invalid area number") end if
  return state.floodnums[area1] == state.floodnums[area2]
end function

function writeAreaBits(state,buffer,area)
  count = (state.numAreas+7)>>3
  if typeof(buffer) != "bytes" or len(buffer) < count then return fail("short area bit buffer") end if
  if state.noAreas or area == -1 then
    index = 0
    while index < count
      buffer[index] = 255; index = index+1
    end while
  else
    if area < 0 or area >= state.numAreas then return fail("invalid area number") end if
    index = 0
    while index < state.numAreas
      if state.floodnums[index] == state.floodnums[area] then buffer[index>>3] = buffer[index>>3] | (1 << (index & 7)) end if
      index = index+1
    end while
  end if
  return count
end function
