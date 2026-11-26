// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/botlib/be_aas_cluster.c.
package mq3.botlib.aas_clustering

import mq3.format.aas as aas

/// Maximum number of portal records produced by AAS clustering.
const AAS_MAX_PORTALS=65536
/// Maximum number of portal references in the cluster portal-index array.
const AAS_MAX_PORTALINDEXSIZE=65536
/// Maximum number of clusters produced by AAS clustering.
const AAS_MAX_CLUSTERS=65536
/// Maximum number of portal areas retained during AAS clustering.
const MAX_PORTALAREAS=1024
/// Just solid at the other side.
const FACE_SOLID=1
/// Bot can stand on the ground.
const AREA_GROUNDED=1
/// AAS area-contents bit marking cluster portal.
const AREACONTENTS_CLUSTERPORTAL=8
/// AAS area-contents bit marking teleportal.
const AREACONTENTS_TELEPORTAL=16
/// AAS area-contents bit marking routing portal.
const AREACONTENTS_ROUTEPORTAL=32
/// AAS area-contents bit marking view portal.
const AREACONTENTS_VIEWPORTAL=512
/// AAS movement-type identifier for teleport.
const TRAVEL_TELEPORT=10

/// `Plane` record for aas clustering, containing `normal` and `dist`.
struct Plane
  /// Navigation plane normal used while analyzing cluster boundaries.
  normal
  /// Distance of the plane (normal vector * distance = point in plane).
  dist
end struct
/// `Edge` record for aas clustering, containing `vertices`.
struct Edge
  /// XYZ vertices defining the navigation or map geometry.
  vertices
end struct
/// `Face` record for aas clustering, containing `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.
struct Face
  /// Navigation plane index used to compare the faces of candidate cluster portals.
  planeNum
  /// AAS face properties such as solidity, grounding, or ladder membership.
  flags
  /// Number of edge records represented by this face or file inventory.
  numEdges
  /// Starting offset of this face in the signed edge-index array.
  firstEdge
  /// Area at the front of this face.
  frontArea
  /// Area at the back of this face.
  backArea
end struct
/// `Area` record for aas clustering, containing `numFaces` and `firstFace`.
struct Area
  /// Number of face records represented by this area or file inventory.
  numFaces
  /// Starting offset of this area in the signed face-index array.
  firstFace
end struct
/// `AreaSettings` record for aas clustering, containing `contents`, `areaFlags`, `presenceType`, `cluster` and `clusterAreaNum` and related fields.
struct AreaSettings
  /// Collision or AAS contents flags describing the represented volume.
  contents
  /// Several area flags.
  areaFlags
  /// Presence-type mask describing the bot hull or stance allowed here.
  presenceType
  /// Cluster the area belongs to, if negative it's a portal.
  cluster
  /// Number of the area in the cluster.
  clusterAreaNum
  /// Number of outgoing reachability records belonging to this AAS area.
  numReachableAreas
  /// First outgoing reachability index for this area in the shared reachability array.
  firstReachableArea
end struct
/// `Reachability` record for aas clustering, containing `areaNum` and `travelType`.
struct Reachability
  /// Destination area used when determining connected navigation clusters.
  areaNum
  /// Encoded AAS movement type required to traverse this link.
  travelType
end struct
/// `Portal` record for aas clustering, containing `areaNum`, `frontCluster`, `backCluster` and `clusterAreaNums`.
struct Portal
  /// Area assigned as a portal while building the navigation cluster graph.
  areaNum
  /// Cluster at front of portal.
  frontCluster
  /// Cluster at back of portal.
  backCluster
  /// Area indexes of this portal within its front and back clusters.
  clusterAreaNums
end struct
/// `Cluster` record for aas clustering, containing `numAreas`, `numReachabilityAreas`, `numPortals` and `firstPortal`.
struct Cluster
  /// Number of portal or navigation areas represented by the loaded map.
  numAreas
  /// Number of areas with reachabilities.
  numReachabilityAreas
  /// Number of cluster portals.
  numPortals
  /// First cluster portal in the index.
  firstPortal
end struct
/// `Entity` record for aas clustering, containing `className`, `target`, `targetName`, `origin` and `linkedAreas` and related fields.
struct Entity
  /// Map entity class used to identify navigation-related entity behavior.
  className
  /// Target name referenced by this map entity.
  target
  /// Name by which other map entities can target this entity.
  targetName
  /// Map entity position inspected while identifying navigation cluster and portal entities.
  origin
  /// AAS areas intersected by this entity's bounds.
  linkedAreas
  /// AAS area reached at the end of this movement link.
  destinationArea
  /// True when the represented entry contains usable data.
  valid
end struct
/// `HostAction` record for aas clustering, containing `boundary`, `kind`, `subject`, `detail` and `value` and related fields.
struct HostAction
  /// Subsystem boundary at which this host action must be dispatched.
  boundary
  /// Discriminator selecting the host clustering action.
  kind
  /// Map entity or navigation element affected by the action.
  subject
  /// Textual detail describing the clustering action.
  detail
  /// Additional scalar argument associated with the clustering action.
  value
  /// True after the recorded action has been delivered to the host.
  dispatched
end struct
/// `World` record for aas clustering, containing `loaded`, `forceClustering`, `forceReachability`, `noFaceFlood` and `planes` and related fields.
struct World
  /// True when navigation geometry is available for cluster construction.
  loaded
  /// True when AAS clusters must be rebuilt even if cached data is present.
  forceClustering
  /// True when AAS reachabilities must be rebuilt even if cached data is present.
  forceReachability
  /// True when clustering must avoid flooding through area faces.
  noFaceFlood
  /// Plane records used to classify or clip the represented geometry.
  planes
  /// XYZ vertices defining the navigation or map geometry.
  vertexes
  /// Vertex-index pairs defining edges of the map or navigation geometry.
  edges
  /// Signed edge references used by faces of the navigation mesh.
  edgeIndex
  /// Face records bounding AAS areas.
  faces
  /// Signed face references used to construct AAS area boundaries.
  faceIndex
  /// Area records or area assignments used by navigation and visibility queries.
  areas
  /// Area or runtime settings controlling navigation behavior.
  settings
  /// Reachabilities used for routing.
  reachabilities
  /// Portal records joining navigation clusters or visibility areas.
  portals
  /// Indexes of portals belonging to each navigation cluster.
  portalIndex
  /// Cluster records or assignments used to group navigation and visibility areas.
  clusters
  /// Game or BSP entity records tracked by this subsystem.
  entities
  /// Recorded host requests and diagnostics produced while building navigation clusters.
  actions
  /// Indicates whether the host-backed retail-compatible runtime path is active.
  retailActive
  /// True when the current AAS data should be saved back to a file.
  saveFile
end struct

/// Create a `mq3.botlib.aas_clustering.Plane` record, initializing `normal` from `normal` and `dist` from `dist`.
/// @param normal Initial value stored in `mq3.botlib.aas_clustering.Plane.normal`.
/// @param dist Initial value stored in `mq3.botlib.aas_clustering.Plane.dist`.
function plane(normal,dist) return Plane(normal,dist) end function
/// Create a `mq3.botlib.aas_clustering.Edge` record, initializing `vertices` as `[a,b]`.
/// @param a Operand used to evaluate the returned expression `Edge([a,b])`.
/// @param b Operand used to evaluate the returned expression `Edge([a,b])`.
function edge(a,b) return Edge([a,b]) end function
/// Create a `mq3.botlib.aas_clustering.Face` record, initializing `planeNum` from `planeNum`, `flags` from `flags` and `numEdges` from `numEdges`.
/// @param planeNum Initial value stored in `mq3.botlib.aas_clustering.Face.planeNum`.
/// @param flags Initial value stored in `mq3.botlib.aas_clustering.Face.flags`.
/// @param numEdges Initial value stored in `mq3.botlib.aas_clustering.Face.numEdges`.
/// @param firstEdge Initial value stored in `mq3.botlib.aas_clustering.Face.firstEdge`.
/// @param frontArea Initial value stored in `mq3.botlib.aas_clustering.Face.frontArea`.
/// @param backArea Initial value stored in `mq3.botlib.aas_clustering.Face.backArea`.
function face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) return Face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) end function
/// Create a `mq3.botlib.aas_clustering.Area` record, initializing `numFaces` from `numFaces` and `firstFace` from `firstFace`.
/// @param numFaces Initial value stored in `mq3.botlib.aas_clustering.Area.numFaces`.
/// @param firstFace Initial value stored in `mq3.botlib.aas_clustering.Area.firstFace`.
function area(numFaces,firstFace) return Area(numFaces,firstFace) end function
/// Create a `mq3.botlib.aas_clustering.AreaSettings` record, initializing `contents` from `contents`, `areaFlags` from `areaFlags` and `presenceType` from `presenceType`.
/// @param contents Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.contents`.
/// @param areaFlags Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.areaFlags`.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param cluster Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.cluster`.
/// @param clusterAreaNum Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.clusterAreaNum`.
/// @param numReachableAreas Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.numReachableAreas`.
/// @param firstReachableArea Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.firstReachableArea`.
function areaSettings(contents,areaFlags,presenceType,cluster,clusterAreaNum,numReachableAreas,firstReachableArea) return AreaSettings(contents,areaFlags,presenceType,cluster,clusterAreaNum,numReachableAreas,firstReachableArea) end function
/// Create a `mq3.botlib.aas_clustering.Reachability` record, initializing `areaNum` from `areaNum` and `travelType` from `travelType`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param travelType AAS reachability travel-type code.
function reachability(areaNum,travelType) return Reachability(areaNum,travelType) end function
/// Create a `mq3.botlib.aas_clustering.Portal` record, initializing `areaNum` from `areaNum`, `frontCluster` from `frontCluster` and `backCluster` from `backCluster`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param frontCluster Initial value stored in `mq3.botlib.aas_clustering.Portal.frontCluster`.
/// @param backCluster Initial value stored in `mq3.botlib.aas_clustering.Portal.backCluster`.
/// @param frontArea Operand used to evaluate the returned expression `Portal(areaNum,frontCluster,backCluster,[frontArea,backArea])`.
/// @param backArea Operand used to evaluate the returned expression `Portal(areaNum,frontCluster,backCluster,[frontArea,backArea])`.
function portal(areaNum,frontCluster,backCluster,frontArea,backArea) return Portal(areaNum,frontCluster,backCluster,[frontArea,backArea]) end function
/// Create a `mq3.botlib.aas_clustering.Cluster` record, initializing `numAreas` from `numAreas`, `numReachabilityAreas` from `numReachabilityAreas` and `numPortals` from `numPortals`.
/// @param numAreas Initial value stored in `mq3.botlib.aas_clustering.Cluster.numAreas`.
/// @param numReachabilityAreas Initial value stored in `mq3.botlib.aas_clustering.Cluster.numReachabilityAreas`.
/// @param numPortals Initial value stored in `mq3.botlib.aas_clustering.Cluster.numPortals`.
/// @param firstPortal Initial value stored in `mq3.botlib.aas_clustering.Cluster.firstPortal`.
function cluster(numAreas,numReachabilityAreas,numPortals,firstPortal) return Cluster(numAreas,numReachabilityAreas,numPortals,firstPortal) end function
/// Create a `mq3.botlib.aas_clustering.Entity` record, initializing `className` from `className`, `target` from `target` and `targetName` from `targetName`.
/// @param className Initial value stored in `mq3.botlib.aas_clustering.Entity.className`.
/// @param target Initial value stored in `mq3.botlib.aas_clustering.Entity.target`.
/// @param targetName Initial value stored in `mq3.botlib.aas_clustering.Entity.targetName`.
/// @param origin World-space position as three coordinates.
/// @param linkedAreas Initial value stored in `mq3.botlib.aas_clustering.Entity.linkedAreas`.
/// @param destinationArea Initial value stored in `mq3.botlib.aas_clustering.Entity.destinationArea`.
/// @param valid Initial value stored in `mq3.botlib.aas_clustering.Entity.valid`.
function entity(className,target,targetName,origin,linkedAreas,destinationArea,valid) return Entity(className,target,targetName,origin,linkedAreas,destinationArea,valid) end function
/// Create a `mq3.botlib.aas_clustering.World` record, initializing `loaded` from `loaded`, `noFaceFlood` from `noFaceFlood` and `planes` from `planes`.
/// @param loaded Initial value stored in `mq3.botlib.aas_clustering.World.loaded`.
/// @param noFaceFlood Initial value stored in `mq3.botlib.aas_clustering.World.noFaceFlood`.
/// @param planes Initial value stored in `mq3.botlib.aas_clustering.World.planes`.
/// @param vertexes Initial value stored in `mq3.botlib.aas_clustering.World.vertexes`.
/// @param edges Initial value stored in `mq3.botlib.aas_clustering.World.edges`.
/// @param edgeIndex Initial value stored in `mq3.botlib.aas_clustering.World.edgeIndex`.
/// @param faces Initial value stored in `mq3.botlib.aas_clustering.World.faces`.
/// @param faceIndex Initial value stored in `mq3.botlib.aas_clustering.World.faceIndex`.
/// @param areas Initial value stored in `mq3.botlib.aas_clustering.World.areas`.
/// @param settings Initial value stored in `mq3.botlib.aas_clustering.World.settings`.
/// @param reachabilities Initial value stored in `mq3.botlib.aas_clustering.World.reachabilities`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function world(loaded,noFaceFlood,planes,vertexes,edges,edgeIndex,faces,faceIndex,areas,settings,reachabilities,retailActive) return World(loaded,false,false,noFaceFlood,planes,vertexes,edges,edgeIndex,faces,faceIndex,areas,settings,reachabilities,[portal(0,0,0,0,0)],[],[cluster(0,0,0,0)],[],[],retailActive,false) end function
/// Update `value.actions` during `emit`.
/// @param value Value record; accesses `actions` and `retailActive`. May update `value.actions` in place.
/// @param boundary Initial value stored in `mq3.botlib.aas_clustering.HostAction.boundary`.
/// @param kind Initial value stored in `mq3.botlib.aas_clustering.HostAction.kind`.
/// @param subject Initial value stored in `mq3.botlib.aas_clustering.HostAction.subject`.
/// @param detail Initial value stored in `mq3.botlib.aas_clustering.HostAction.detail`.
/// @param number Initial value stored in `mq3.botlib.aas_clustering.HostAction.value`.
function emit(value,boundary,kind,subject,detail,number) value.actions=value.actions+[HostAction(boundary,kind,subject,detail,number,not value.retailActive)];return true end function
/// Return the absolute value of the numeric argument for aas clustering.
/// @param value Operand used to evaluate the returned expression `0-value`.
function absInt(value) if value<0 then return 0-value end if;return value end function
/// Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
/// Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `subtract`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function subtract(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
/// Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `cross`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function cross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
/// Test `areaNum>0 and areaNum<len(value.areas) and areaNum<len(value.settings)` as the condition for `validArea`.
/// @param value Value record; accesses `areas` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function validArea(value,areaNum) return areaNum>0 and areaNum<len(value.areas) and areaNum<len(value.settings) end function
/// Test `validArea(value,areaNum) and value.settings[areaNum].numReachableAreas>0` as the condition for `areaHasReachability`.
/// @param value Value record; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function areaHasReachability(value,areaNum) return validArea(value,areaNum) and value.settings[areaNum].numReachableAreas>0 end function
/// Return the area on the opposite side of an AAS face, or zero for an invalid face index.
/// @param value Value record; accesses `faces`.
/// @param faceNum AAS face index.
/// @param areaNum AAS area number; zero denotes no area.
function otherArea(value,faceNum,areaNum) if faceNum<=0 or faceNum>=len(value.faces) then return 0 end if;f=value.faces[faceNum];if f.frontArea!=areaNum then return f.frontArea end if;return f.backArea end function
/// Apply `mq3.botlib.aas_clustering.validArea` and `mq3.botlib.aas_clustering.absInt` while evaluating `areaFaces`.
/// @param value Value record; accesses `areas` and `faceIndex`.
/// @param areaNum AAS area number; zero denotes no area.
function areaFaces(value,areaNum) result=[];if not validArea(value,areaNum) then return result end if;a=value.areas[areaNum];if a.numFaces>0 then for offset=0 to a.numFaces-1 at=a.firstFace+offset;if at>=0 and at<len(value.faceIndex) then result=result+[absInt(value.faceIndex[at])] end if end for end if;return result end function
/// Apply `mq3.botlib.aas_clustering.validArea` while evaluating `reachableAreas`.
/// @param value Value record; accesses `settings` and `reachabilities`.
/// @param areaNum AAS area number; zero denotes no area.
function reachableAreas(value,areaNum) result=[];if not validArea(value,areaNum) then return result end if;s=value.settings[areaNum];if s.numReachableAreas>0 then for offset=0 to s.numReachableAreas-1 at=s.firstReachableArea+offset;if at>=0 and at<len(value.reachabilities) then destination=value.reachabilities[at].areaNum;if validArea(value,destination) then result=result+[destination] end if end if end for end if;return result end function
/// Search the supplied values for an entry equal to the needle.
/// @param values Value used by `contains` in `for each value in values if value==needle then return true end if end for`.
/// @param needle Text or value to search for.
function contains(values,needle) for each value in values if value==needle then return true end if end for;return false end function
/// Apply `mq3.botlib.aas_clustering.contains` while evaluating `appendUnique`. Return paths include `values`.
/// @param values Value used by `contains` in `for each value in values if value==needle then return true end if end for`.
/// @param needle Text or value to search for.
function appendUnique(values,needle) if not contains(values,needle) then values=values+[needle] end if;return values end function
/// Set `value.clusters` to `value.clusters+[cluster(0,0,0,0)]` in `mq3.botlib.aas_clustering.ensureCluster`. Return paths include `value.clusters[index]`.
/// @param value Value record; accesses `clusters`. May update `value.clusters` in place.
/// @param index Index of the entry to access.
function ensureCluster(value,index) while len(value.clusters)<=index value.clusters=value.clusters+[cluster(0,0,0,0)] end while;return value.clusters[index] end function

// AAS_RemoveClusterAreas
/// @param value Value record; accesses `settings`. May update `value.settings[index].cluster` in place.
function AAS_RemoveClusterAreas(value) if len(value.settings)>1 then for index=1 to len(value.settings)-1 value.settings[index].cluster=0 end for end if;return true end function
// AAS_ClearCluster
/// @param value Value record; accesses `settings`. May update `value.settings[index].cluster` in place.
/// @param clusterNum AAS cluster number.
function AAS_ClearCluster(value,clusterNum) if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==clusterNum then value.settings[index].cluster=0 end if end for end if;return true end function
// AAS_RemovePortalsClusterReference
/// @param value Value record; accesses `portals`. May update `value.portals[index].frontCluster` and `value.portals[index].backCluster` in place.
/// @param clusterNum AAS cluster number.
function AAS_RemovePortalsClusterReference(value,clusterNum) if len(value.portals)>1 then for index=1 to len(value.portals)-1 if value.portals[index].frontCluster==clusterNum then value.portals[index].frontCluster=0 end if;if value.portals[index].backCluster==clusterNum then value.portals[index].backCluster=0 end if end for end if;return true end function
// AAS_UpdatePortal
/// @param value Value record; accesses `portals`, `settings` and `portalIndex`. May update `value.settings[areaNum].contents`, `value.settings[areaNum].cluster` and `value.portalIndex` in place.
/// @param areaNum AAS area number; zero denotes no area.
/// @param clusterNum AAS cluster number.
function AAS_UpdatePortal(value,areaNum,clusterNum)
  portalNum=1;while portalNum<len(value.portals) and value.portals[portalNum].areaNum!=areaNum portalNum=portalNum+1 end while
  if portalNum==len(value.portals) then emit(value,"aas-cluster","error",str(areaNum),"no portal of area",areaNum);return true end if
  p=value.portals[portalNum];if p.frontCluster==clusterNum or p.backCluster==clusterNum then return true end if
  if p.frontCluster==0 then p.frontCluster=clusterNum else if p.backCluster==0 then p.backCluster=clusterNum else value.settings[areaNum].contents=value.settings[areaNum].contents&(~AREACONTENTS_CLUSTERPORTAL);emit(value,"aas-cluster","log",str(areaNum),"portal separates more than two clusters",areaNum);return false end if
  if len(value.portalIndex)>=AAS_MAX_PORTALINDEXSIZE then emit(value,"aas-cluster","error","AAS_MAX_PORTALINDEXSIZE","",0);return true end if
  value.settings[areaNum].cluster=0-portalNum;c=ensureCluster(value,clusterNum);value.portalIndex=value.portalIndex+[portalNum];c.numPortals=c.numPortals+1;return true
end function

// AAS_FloodClusterAreas_r
/// @param value Value record; accesses `settings` and `noFaceFlood`. May update `value.settings[areaNum].cluster` and `value.settings[areaNum].clusterAreaNum` in place.
/// @param areaNum AAS area number; zero denotes no area.
/// @param clusterNum AAS cluster number.
function AAS_FloodClusterAreas_r(value,areaNum,clusterNum)
  if not validArea(value,areaNum) then emit(value,"aas-cluster","error",str(areaNum),"area out of range",areaNum);return false end if
  current=value.settings[areaNum].cluster;if current>0 then if current==clusterNum then return true end if;emit(value,"aas-cluster","error",str(areaNum),"cluster collision",current);return false end if
  if (value.settings[areaNum].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then return AAS_UpdatePortal(value,areaNum,clusterNum) end if
  c=ensureCluster(value,clusterNum);value.settings[areaNum].cluster=clusterNum;value.settings[areaNum].clusterAreaNum=c.numAreas;c.numAreas=c.numAreas+1
  if not value.noFaceFlood then for each faceNum in areaFaces(value,areaNum) destination=otherArea(value,faceNum,areaNum);if destination!=0 and not AAS_FloodClusterAreas_r(value,destination,clusterNum) then return false end if end for end if
  for each destination in reachableAreas(value,areaNum) if not AAS_FloodClusterAreas_r(value,destination,clusterNum) then return false end if end for;return true
end function
// AAS_FloodClusterAreasUsingReachabilities
/// @param value Value record; accesses `settings`.
/// @param clusterNum AAS cluster number.
function AAS_FloodClusterAreasUsingReachabilities(value,clusterNum)
  changed=true;while changed changed=false;if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==0 and (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)==0 then for each destination in reachableAreas(value,index) if (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 and value.settings[destination].cluster!=0 then if not AAS_FloodClusterAreas_r(value,index,clusterNum) then return false end if;changed=true;break end if end for end if end for end if end while;return true
end function
// AAS_NumberClusterPortals
/// @param value Value record; accesses `clusters`, `portals` and `portalIndex`.
/// @param clusterNum AAS cluster number.
function AAS_NumberClusterPortals(value,clusterNum) c=value.clusters[clusterNum];if c.numPortals>0 then for offset=0 to c.numPortals-1 p=value.portals[value.portalIndex[c.firstPortal+offset]];if p.frontCluster==clusterNum then p.clusterAreaNums[0]=c.numAreas else p.clusterAreaNums[1]=c.numAreas end if;c.numAreas=c.numAreas+1 end for end if;return true end function
// AAS_NumberClusterAreas
/// @param value Value record; accesses `clusters`, `settings`, `portals` and `portalIndex`. May update `value.settings[index].clusterAreaNum` in place.
/// @param clusterNum AAS cluster number.
function AAS_NumberClusterAreas(value,clusterNum)
  c=value.clusters[clusterNum];c.numAreas=0;c.numReachabilityAreas=0
  if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==clusterNum and areaHasReachability(value,index) then value.settings[index].clusterAreaNum=c.numAreas;c.numAreas=c.numAreas+1;c.numReachabilityAreas=c.numReachabilityAreas+1 end if end for end if
  if c.numPortals>0 then for offset=0 to c.numPortals-1 p=value.portals[value.portalIndex[c.firstPortal+offset]];if areaHasReachability(value,p.areaNum) then if p.frontCluster==clusterNum then p.clusterAreaNums[0]=c.numAreas else p.clusterAreaNums[1]=c.numAreas end if;c.numAreas=c.numAreas+1;c.numReachabilityAreas=c.numReachabilityAreas+1 end if end for end if
  if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==clusterNum and not areaHasReachability(value,index) then value.settings[index].clusterAreaNum=c.numAreas;c.numAreas=c.numAreas+1 end if end for end if
  if c.numPortals>0 then for offset=0 to c.numPortals-1 p=value.portals[value.portalIndex[c.firstPortal+offset]];if not areaHasReachability(value,p.areaNum) then if p.frontCluster==clusterNum then p.clusterAreaNums[0]=c.numAreas else p.clusterAreaNums[1]=c.numAreas end if;c.numAreas=c.numAreas+1 end if end for end if;return true
end function
// AAS_FindClusters
/// @param value Value record; accesses `clusters`, `settings`, `noFaceFlood` and `portalIndex`. May update `value.clusters` in place.
function AAS_FindClusters(value)
  AAS_RemoveClusterAreas(value);value.clusters=[cluster(0,0,0,0)];clusterNum=1
  if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==0 and (not value.noFaceFlood or value.settings[index].numReachableAreas!=0) and (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)==0 then if clusterNum>=AAS_MAX_CLUSTERS then emit(value,"aas-cluster","error","AAS_MAX_CLUSTERS","",clusterNum);return false end if;value.clusters=value.clusters+[cluster(0,0,0,len(value.portalIndex))];if not AAS_FloodClusterAreas_r(value,index,clusterNum) then return false end if;if not AAS_FloodClusterAreasUsingReachabilities(value,clusterNum) then return false end if;AAS_NumberClusterAreas(value,clusterNum);clusterNum=clusterNum+1 end if end for end if;return true
end function
// AAS_CreatePortals
/// @param value Value record; accesses `portals` and `settings`. May update `value.portals` in place.
function AAS_CreatePortals(value) value.portals=[portal(0,0,0,0,0)];if len(value.settings)>1 then for index=1 to len(value.settings)-1 if (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then if len(value.portals)>=AAS_MAX_PORTALS then emit(value,"aas-cluster","error","AAS_MAX_PORTALS","",0);return false end if;value.portals=value.portals+[portal(index,0,0,0,0)] end if end for end if;return true end function

// BSPC geometry helpers retained because they are part of the original source API.
// AAS_MapContainsTeleporters
/// @param value Value record; accesses `entities`.
function AAS_MapContainsTeleporters(value) for each ent in value.entities if ent.valid and ent.className=="misc_teleporter" then return true end if end for;return false end function
// AAS_NonConvexFaces
/// @param value Value record; accesses `planes`, `edgeIndex`, `edges` and `vertexes`.
/// @param face1 Face1 record; accesses `planeNum`.
/// @param face2 Face2 record; accesses `planeNum`.
/// @param side1 Value used by `AAS_NonConvexFaces` in `plane1=value.planes[face1.planeNum^side1]`.
/// @param side2 Value used by `AAS_NonConvexFaces` in `plane2=value.planes[face2.planeNum^side2]`.
function AAS_NonConvexFaces(value,face1,face2,side1,side2)
  plane1=value.planes[face1.planeNum^side1];plane2=value.planes[face2.planeNum^side2]
  for each current in [face1,face2] testPlane=plane2;if current==face2 then testPlane=plane1 end if;if current.numEdges>0 then for offset=0 to current.numEdges-1 edgeNum=absInt(value.edgeIndex[current.firstEdge+offset]);e=value.edges[edgeNum];for vertexSide=0 to 1 if dot(testPlane.normal,value.vertexes[e.vertices[vertexSide]])-testPlane.dist<(-0.01) then return true end if end for end for end if end for;return false
end function
// AAS_CanMergeAreas
/// @param value Value record; accesses `faces`.
/// @param areaNums Value used by `contains` in `for each value in values if value==needle then return true end if end for`.
function AAS_CanMergeAreas(value,areaNums)
  for each areaNum1 in areaNums for each faceNum1 in areaFaces(value,areaNum1) f1=value.faces[faceNum1];if not contains(areaNums,f1.frontArea) or not contains(areaNums,f1.backArea) then side1=0;if f1.frontArea!=areaNum1 then side1=1 end if;for each areaNum2 in areaNums if areaNum2!=areaNum1 then for each faceNum2 in areaFaces(value,areaNum2) f2=value.faces[faceNum2];if (not contains(areaNums,f2.frontArea) or not contains(areaNums,f2.backArea)) then side2=0;if f2.frontArea!=areaNum2 then side2=1 end if;if AAS_NonConvexFaces(value,f1,f2,side1,side2) then return false end if end if end for end if end for end if end for end for;return true
end function
// AAS_NonConvexEdges
/// @param value Value record; accesses `vertexes` and `planes`.
/// @param edge1 Edge1 record; accesses `vertices`.
/// @param edge2 Edge2 record; accesses `vertices`.
/// @param side1 Value used by `AAS_NonConvexEdges` in `if side1 then edgeVector1=[0-edgeVector1[0],0-edgeVector1[1],0-edgeVector1[2]] end if`.
/// @param side2 Value used by `AAS_NonConvexEdges` in `if side2 then edgeVector2=[0-edgeVector2[0],0-edgeVector2[1],0-edgeVector2[2]] end if`.
/// @param planeNum Value used by `AAS_NonConvexEdges` in `p=value.planes[planeNum]`.
function AAS_NonConvexEdges(value,edge1,edge2,side1,side2,planeNum)
  edgeVector1=subtract(value.vertexes[edge1.vertices[1]],value.vertexes[edge1.vertices[0]]);edgeVector2=subtract(value.vertexes[edge2.vertices[1]],value.vertexes[edge2.vertices[0]]);if side1 then edgeVector1=[0-edgeVector1[0],0-edgeVector1[1],0-edgeVector1[2]] end if;if side2 then edgeVector2=[0-edgeVector2[0],0-edgeVector2[1],0-edgeVector2[2]] end if;p=value.planes[planeNum];normal1=cross(edgeVector1,p.normal);normal2=cross(edgeVector2,p.normal);dist1=dot(normal1,value.vertexes[edge1.vertices[0]]);dist2=dot(normal2,value.vertexes[edge2.vertices[0]]);for index=0 to 1 if dot(value.vertexes[edge1.vertices[index]],normal2)-dist2<(-0.01) then return false end if;if dot(value.vertexes[edge2.vertices[index]],normal1)-dist1<(-0.01) then return false end if end for;return true
end function
// AAS_CanMergeFaces
/// @param value Value record; accesses `faces`, `edgeIndex` and `edges`.
/// @param faceNums Value used by `AAS_CanMergeFaces` in `for each faceNum in faceNums`.
/// @param planeNum Value used by `AAS_NonConvexEdges` in `p=value.planes[planeNum]`.
function AAS_CanMergeFaces(value,faceNums,planeNum)
  boundary=[]
  for each faceNum in faceNums
    f=value.faces[faceNum]
    if f.numEdges>0 then
      for offset=0 to f.numEdges-1
        signedEdge=value.edgeIndex[f.firstEdge+offset];edgeNum=absInt(signedEdge);shared=0
        for each otherFaceNum in faceNums
          if otherFaceNum!=faceNum then
            other=value.faces[otherFaceNum]
            if other.numEdges>0 then for otherOffset=0 to other.numEdges-1 if absInt(value.edgeIndex[other.firstEdge+otherOffset])==edgeNum then shared=shared+1 end if end for end if
          end if
        end for
        if shared==0 then
          side=false;if signedEdge<0 then side=not side end if;if f.planeNum!=planeNum then side=not side end if
          boundary=boundary+[[edgeNum,side]]
        end if
      end for
    end if
  end for
  if len(boundary)>1 then for left=0 to len(boundary)-2 for right=left+1 to len(boundary)-1 if AAS_NonConvexEdges(value,value.edges[boundary[left][0]],value.edges[boundary[right][0]],boundary[left][1],boundary[right][1],planeNum) then return false end if end for end for end if;return true
end function
// AAS_ConnectedAreas_r
/// @param value Value record; accesses `faces`.
/// @param areaNums Array or byte sequence accessed at `current` and `index`.
/// @param connectedAreas Array or byte sequence accessed at `current` and `index`. Entries are written in place.
/// @param current Value used by `AAS_ConnectedAreas_r` in `connectedAreas[current]=true`.
function AAS_ConnectedAreas_r(value,areaNums,connectedAreas,current)
  connectedAreas[current]=true;for each faceNum in areaFaces(value,areaNums[current]) f=value.faces[faceNum];if (f.flags&FACE_SOLID)==0 then destination=otherArea(value,faceNum,areaNums[current]);for index=0 to len(areaNums)-1 if areaNums[index]==destination and not connectedAreas[index] then AAS_ConnectedAreas_r(value,areaNums,connectedAreas,index) end if end for end if end for;return true
end function
// AAS_ConnectedAreas
/// @param value Value record; accesses `faces`.
/// @param areaNums Array or byte sequence accessed at `current` and `index`.
function AAS_ConnectedAreas(value,areaNums) if len(areaNums)<1 then return false end if;if len(areaNums)==1 then return true end if;connected=array(len(areaNums),false);AAS_ConnectedAreas_r(value,areaNums,connected,0);for each state in connected if not state then return false end if end for;return true end function
// AAS_GetAdjacentAreasWithLessPresenceTypes_r
/// @param value Value record; accesses `settings` and `faces`.
/// @param areaNums Value used by `contains` in `for each value in values if value==needle then return true end if end for`.
/// @param currentAreaNum Text or value to search for.
function AAS_GetAdjacentAreasWithLessPresenceTypes_r(value,areaNums,currentAreaNum)
  if contains(areaNums,currentAreaNum) then return areaNums end if;if len(areaNums)>=MAX_PORTALAREAS then emit(value,"aas-cluster","error","MAX_PORTALAREAS","",len(areaNums));return areaNums end if;areaNums=areaNums+[currentAreaNum];presence=value.settings[currentAreaNum].presenceType
  for each faceNum in areaFaces(value,currentAreaNum) f=value.faces[faceNum];if (f.flags&FACE_SOLID)==0 then destination=otherArea(value,faceNum,currentAreaNum);if validArea(value,destination) then other=value.settings[destination].presenceType;if (presence&(~other))!=0 and (other&(~presence))==0 then areaNums=AAS_GetAdjacentAreasWithLessPresenceTypes_r(value,areaNums,destination) end if end if end if end for;return areaNums
end function
// AAS_CheckAreaForPossiblePortals
/// @param value Value record; accesses `settings`, `faces` and `edgeIndex`. May update `value.settings[currentArea].contents` in place.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_CheckAreaForPossiblePortals(value,areaNum)
  if not validArea(value,areaNum) or (value.settings[areaNum].contents&AREACONTENTS_CLUSTERPORTAL)!=0 or (value.settings[areaNum].areaFlags&AREA_GROUNDED)==0 then return 0 end if
  areaNums=AAS_GetAdjacentAreasWithLessPresenceTypes_r(value,[],areaNum);frontPlane=-1;backPlane=-1;frontFaces=[];backFaces=[];frontAreas=[];backAreas=[];frontCounts=array(len(areaNums),0);backCounts=array(len(areaNums),0)
  for index=0 to len(areaNums)-1 currentArea=areaNums[index];for each faceNum in areaFaces(value,currentArea) f=value.faces[faceNum];if (f.flags&FACE_SOLID)==0 and not (contains(areaNums,f.frontArea) and contains(areaNums,f.backArea)) then destination=otherArea(value,faceNum,currentArea);if not validArea(value,destination) or (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then return 0 end if;basePlane=f.planeNum&(~1);if frontPlane<0 or basePlane==frontPlane then frontPlane=basePlane;frontFaces=frontFaces+[faceNum];frontAreas=appendUnique(frontAreas,destination);frontCounts[index]=frontCounts[index]+1 else if backPlane<0 or basePlane==backPlane then backPlane=basePlane;backFaces=backFaces+[faceNum];backAreas=appendUnique(backAreas,destination);backCounts[index]=backCounts[index]+1 else return 0 end if end if end for end for
  for index=0 to len(areaNums)-1 if frontCounts[index]==0 or backCounts[index]==0 then return 0 end if end for;if not AAS_ConnectedAreas(value,frontAreas) or not AAS_ConnectedAreas(value,backAreas) then return 0 end if
  for each frontFaceNum in frontFaces frontFace=value.faces[frontFaceNum];for each backFaceNum in backFaces backFace=value.faces[backFaceNum];for frontOffset=0 to frontFace.numEdges-1 frontEdge=absInt(value.edgeIndex[frontFace.firstEdge+frontOffset]);for backOffset=0 to backFace.numEdges-1 if frontEdge==absInt(value.edgeIndex[backFace.firstEdge+backOffset]) then return 0 end if end for end for end for end for
  for each currentArea in areaNums value.settings[currentArea].contents=value.settings[currentArea].contents|AREACONTENTS_CLUSTERPORTAL|AREACONTENTS_ROUTEPORTAL;emit(value,"aas-cluster","log",str(currentArea),"possible portal",currentArea) end for;return len(areaNums)
end function
// AAS_FindPossiblePortals
/// @param value Value record; accesses `settings`.
function AAS_FindPossiblePortals(value) count=0;if len(value.settings)>1 then for index=1 to len(value.settings)-1 count=count+AAS_CheckAreaForPossiblePortals(value,index) end for end if;emit(value,"aas-cluster","print","possible portals","",count);return count end function
// AAS_RemoveAllPortals
/// @param value Value record; accesses `settings`. May update `value.settings[index].contents` in place.
function AAS_RemoveAllPortals(value) if len(value.settings)>1 then for index=1 to len(value.settings)-1 value.settings[index].contents=value.settings[index].contents&(~AREACONTENTS_CLUSTERPORTAL) end for end if;return true end function

// Legacy BSPC flood helpers retained as callable native behavior.
// AAS_FloodCluster_r
/// @param value Value record; accesses `settings`. May update `value.settings[areaNum].cluster` in place.
/// @param areaNum AAS area number; zero denotes no area.
/// @param clusterNum AAS cluster number.
function AAS_FloodCluster_r(value,areaNum,clusterNum) if not validArea(value,areaNum) or value.settings[areaNum].cluster!=0 then return true end if;value.settings[areaNum].cluster=clusterNum;for each faceNum in areaFaces(value,areaNum) destination=otherArea(value,faceNum,areaNum);if validArea(value,destination) and (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 and value.settings[destination].cluster==0 then AAS_FloodCluster_r(value,destination,clusterNum) end if end for;for each destination in reachableAreas(value,areaNum) if (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 and value.settings[destination].cluster==0 then AAS_FloodCluster_r(value,destination,clusterNum) end if end for;return true end function
// AAS_RemoveTeleporterPortals
/// @param value Value record; accesses `settings` and `reachabilities`. May update `value.settings[r.areaNum].contents` in place.
function AAS_RemoveTeleporterPortals(value) if len(value.settings)>1 then for index=1 to len(value.settings)-1 s=value.settings[index];if s.numReachableAreas>0 then for offset=0 to s.numReachableAreas-1 r=value.reachabilities[s.firstReachableArea+offset];if r.travelType==TRAVEL_TELEPORT and validArea(value,r.areaNum) then s.contents=s.contents&(~AREACONTENTS_CLUSTERPORTAL);value.settings[r.areaNum].contents=value.settings[r.areaNum].contents&(~AREACONTENTS_CLUSTERPORTAL);break end if end for end if end for end if;return true end function
// AAS_FloodClusterReachabilities
/// @param value Value record; accesses `settings`.
/// @param clusterNum AAS cluster number.
function AAS_FloodClusterReachabilities(value,clusterNum) changed=true;while changed changed=false;if len(value.settings)>1 then for index=1 to len(value.settings)-1 if value.settings[index].cluster==0 and (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)==0 then for each destination in reachableAreas(value,index) if (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 and value.settings[destination].cluster==clusterNum then AAS_FloodCluster_r(value,index,clusterNum);changed=true;break end if end for end if end for end if end while;return true end function
// AAS_RemoveNotClusterClosingPortals
/// @param value Value record; accesses `settings`. May update `value.settings[index].contents` in place.
function AAS_RemoveNotClusterClosingPortals(value)
  AAS_RemoveTeleporterPortals(value);removed=0;recheck=true;while recheck recheck=false;if len(value.settings)>1 then for index=1 to len(value.settings)-1 if (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then AAS_RemoveClusterAreas(value);separated=0;seeds=[];for each faceNum in areaFaces(value,index) destination=otherArea(value,faceNum,index);if validArea(value,destination) and (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 then seeds=appendUnique(seeds,destination) end if end for;for each destination in reachableAreas(value,index) if (value.settings[destination].contents&AREACONTENTS_CLUSTERPORTAL)==0 then seeds=appendUnique(seeds,destination) end if end for;for each seed in seeds if value.settings[seed].cluster==0 then separated=separated+1;AAS_FloodCluster_r(value,seed,separated);AAS_FloodClusterReachabilities(value,separated) end if end for;if separated!=2 then value.settings[index].contents=value.settings[index].contents&(~AREACONTENTS_CLUSTERPORTAL);removed=removed+1;recheck=true;break end if end if end for end if end while;emit(value,"aas-cluster","print","non closing portals removed","",removed);return removed
end function
// AAS_AddTeleporterPortals
/// @param value Value record; accesses `settings` and `reachabilities`. May update `value.settings[r.areaNum].contents` in place.
function AAS_AddTeleporterPortals(value) added=0;if len(value.settings)>1 then for index=1 to len(value.settings)-1 s=value.settings[index];if s.numReachableAreas>0 then for offset=0 to s.numReachableAreas-1 r=value.reachabilities[s.firstReachableArea+offset];if r.travelType==TRAVEL_TELEPORT and validArea(value,r.areaNum) and (value.settings[r.areaNum].contents&AREACONTENTS_CLUSTERPORTAL)==0 then value.settings[r.areaNum].contents=value.settings[r.areaNum].contents|AREACONTENTS_CLUSTERPORTAL;added=added+1 end if end for end if end for end if;return added end function
// AAS_TestPortals
/// @param value Value record; accesses `portals` and `settings`. May update `value.settings[p.areaNum].contents` in place.
function AAS_TestPortals(value) if len(value.portals)>1 then for index=1 to len(value.portals)-1 p=value.portals[index];if p.frontCluster==0 or p.backCluster==0 then value.settings[p.areaNum].contents=value.settings[p.areaNum].contents&(~AREACONTENTS_CLUSTERPORTAL);AAS_ClearCluster(value,p.frontCluster);AAS_ClearCluster(value,p.backCluster);AAS_RemovePortalsClusterReference(value,p.frontCluster);AAS_RemovePortalsClusterReference(value,p.backCluster);emit(value,"aas-cluster","log",str(p.areaNum),"incomplete portal",index);return false end if end for end if;return true end function
// AAS_CountForcedClusterPortals
/// @param value Value record; accesses `settings`.
function AAS_CountForcedClusterPortals(value) count=0;if len(value.settings)>1 then for index=1 to len(value.settings)-1 if (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then count=count+1;emit(value,"aas-cluster","log",str(index),"forced portal",index) end if end for end if;emit(value,"aas-cluster","print","forced portal areas","",count);return count end function
// AAS_CreateViewPortals
/// @param value Value record; accesses `settings`. May update `value.settings[index].contents` in place.
function AAS_CreateViewPortals(value) if len(value.settings)>1 then for index=1 to len(value.settings)-1 if (value.settings[index].contents&AREACONTENTS_CLUSTERPORTAL)!=0 then value.settings[index].contents=value.settings[index].contents|AREACONTENTS_VIEWPORTAL end if end for end if;return true end function
// AAS_SetViewPortalsAsClusterPortals
/// @param value Value record; accesses `settings`. May update `value.settings[index].contents` in place.
function AAS_SetViewPortalsAsClusterPortals(value) if len(value.settings)>1 then for index=1 to len(value.settings)-1 if (value.settings[index].contents&AREACONTENTS_VIEWPORTAL)!=0 then value.settings[index].contents=value.settings[index].contents|AREACONTENTS_CLUSTERPORTAL end if end for end if;return true end function
// AAS_InitClustering
/// @param value Value record; accesses `loaded`, `clusters`, `forceClustering`, `forceReachability` and `settings` and related fields. May update `value.portalIndex`, `value.clusters` and `value.saveFile` in place.
function AAS_InitClustering(value)
  if value==void or not value.loaded then return false end if;if len(value.clusters)>1 and not value.forceClustering and not value.forceReachability then return true end if
  AAS_SetViewPortalsAsClusterPortals(value);AAS_CountForcedClusterPortals(value);AAS_RemoveClusterAreas(value);AAS_FindPossiblePortals(value);AAS_CreateViewPortals(value);attempt=0;limit=len(value.settings)+1
  while attempt<limit value.portalIndex=[];value.clusters=[cluster(0,0,0,0)];AAS_CreatePortals(value);if AAS_FindClusters(value) and AAS_TestPortals(value) then value.saveFile=true;reachabilityAreas=0;total=0;for each c in value.clusters reachabilityAreas=reachabilityAreas+c.numReachabilityAreas;total=total+c.numReachabilityAreas*c.numReachabilityAreas end for;total=total+reachabilityAreas*len(value.portals);emit(value,"aas-cluster","print","clustering complete",str(len(value.clusters))+" clusters",total*3);return true end if;attempt=attempt+1 end while;emit(value,"aas-cluster","error","clustering did not converge","",attempt);return false
end function

/// Apply `mq3.format.aas.plane`, `mq3.botlib.aas_clustering.plane` and `mq3.format.aas.vertex` while evaluating `fromMap`.
/// @param map Map record; accesses `counts`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function fromMap(map,retailActive)
  planes=array(map.counts[aas.LUMP_PLANES],void);for index=0 to len(planes)-1 p=aas.plane(map,index);planes[index]=plane(p.normal,p.dist) end for
  vertexes=array(map.counts[aas.LUMP_VERTEXES],void);for index=0 to len(vertexes)-1 vertexes[index]=aas.vertex(map,index) end for
  edges=array(map.counts[aas.LUMP_EDGES],void);for index=0 to len(edges)-1 e=aas.edge(map,index);edges[index]=edge(e[0],e[1]) end for
  edgeIndex=array(map.counts[aas.LUMP_EDGEINDEX],0);for index=0 to len(edgeIndex)-1 edgeIndex[index]=aas.edgeIndex(map,index) end for
  faces=array(map.counts[aas.LUMP_FACES],void);for index=0 to len(faces)-1 f=aas.face(map,index);faces[index]=face(f.planeNum,f.flags,f.numEdges,f.firstEdge,f.frontArea,f.backArea) end for
  faceIndex=array(map.counts[aas.LUMP_FACEINDEX],0);for index=0 to len(faceIndex)-1 faceIndex[index]=aas.faceIndex(map,index) end for
  areas=array(map.counts[aas.LUMP_AREAS],void);settings=array(map.counts[aas.LUMP_AREASETTINGS],void);for index=0 to len(areas)-1 a=aas.area(map,index);s=aas.areaSettings(map,index);areas[index]=area(a.numFaces,a.firstFace);settings[index]=areaSettings(s.contents,s.flags,s.presenceType,s.cluster,s.clusterAreaNum,s.numReachableAreas,s.firstReachableArea) end for
  reachabilities=array(map.counts[aas.LUMP_REACHABILITY],void);for index=0 to len(reachabilities)-1 r=aas.reachability(map,index);reachabilities[index]=reachability(r.areaNum,r.travelType) end for
  value=world(true,true,planes,vertexes,edges,edgeIndex,faces,faceIndex,areas,settings,reachabilities,retailActive)
  value.portals=array(map.counts[aas.LUMP_PORTALS],void);for index=0 to len(value.portals)-1 p=aas.portal(map,index);value.portals[index]=portal(p.areaNum,p.frontCluster,p.backCluster,p.clusterAreaNums[0],p.clusterAreaNums[1]) end for
  value.portalIndex=array(map.counts[aas.LUMP_PORTALINDEX],0);for index=0 to len(value.portalIndex)-1 value.portalIndex[index]=aas.portalIndex(map,index) end for
  value.clusters=array(map.counts[aas.LUMP_CLUSTERS],void);for index=0 to len(value.clusters)-1 c=aas.cluster(map,index);value.clusters[index]=cluster(c.numAreas,c.numReachabilityAreas,c.numPortals,c.firstPortal) end for;return value
end function
