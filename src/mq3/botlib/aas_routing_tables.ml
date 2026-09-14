// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Static reverse-reachability and portal travel tables from be_aas_route.c.
package mq3.botlib.aas_routing_tables

import mq3.botlib.aas_routing as routing
import mq3.format.aas as aas

const MAX_AREA_REACHABILITIES=128

struct ReverseLink areaNum linkNum end struct
struct Tables router reversed areaTravelTimes portalMaxTravelTimes totalLinks truncatedSources end struct

function empty(router) return Tables(router,[],[],[],0,0) end function
function create(router)
  if router==void or router.runtime==void or not router.runtime.initialized then return empty(router) end if
  areaCount=len(router.settings);reversed=array(areaCount,void);for areaNum=0 to areaCount-1 reversed[areaNum]=[] end for;total=0;truncated=0
  if areaCount>1 then for areaNum=1 to areaCount-1 settings=router.settings[areaNum];count=settings.numReachableAreas;if count>MAX_AREA_REACHABILITIES then truncated=truncated+1 end if;if count>MAX_AREA_REACHABILITIES then count=MAX_AREA_REACHABILITIES end if
    if count>0 then for offset=0 to count-1 linkNum=settings.firstReachableArea+offset;reach=router.reaches[linkNum];reversed[reach.areaNum]=[ReverseLink(areaNum,linkNum)]+reversed[reach.areaNum];total=total+1 end for end if
  end for end if
  areaTimes=array(areaCount,void)
  for areaNum=0 to areaCount-1 settings=router.settings[areaNum];rows=[]
    if settings.numReachableAreas>0 then for offset=0 to settings.numReachableAreas-1 outgoing=router.reaches[settings.firstReachableArea+offset];values=[]
      if len(reversed[areaNum])>0 then for each incoming in reversed[areaNum] incomingReach=router.reaches[incoming.linkNum];values=values+[routing.areaTravelTime(router,areaNum,incomingReach.finish,outgoing.start)] end for end if;rows=rows+[values]
    end for end if;areaTimes[areaNum]=rows
  end for
  portalCount=router.runtime.map.counts[aas.LUMP_PORTALS];portalMax=array(portalCount,0)
  if portalCount>0 then for portalNum=0 to portalCount-1 portal=aas.portal(router.runtime.map,portalNum);if portal is error then continue end if;areaNum=portal.areaNum;maximum=0
    if areaNum>=0 and areaNum<areaCount then for each row in areaTimes[areaNum] if len(row)>0 then for each value in row if value>maximum then maximum=value end if end for end if end for end if;portalMax[portalNum]=maximum
  end for end if
  return Tables(router,reversed,areaTimes,portalMax,total,truncated)
end function
function incoming(tables,areaNum) if tables==void or areaNum<0 or areaNum>=len(tables.reversed) then return [] end if;return tables.reversed[areaNum] end function
function areaTravelTime(tables,areaNum,outgoingOffset,incomingOffset)
  if tables==void or areaNum<0 or areaNum>=len(tables.areaTravelTimes) then return 0 end if;rows=tables.areaTravelTimes[areaNum];if outgoingOffset<0 or outgoingOffset>=len(rows) then return 0 end if;row=rows[outgoingOffset];if incomingOffset<0 or incomingOffset>=len(row) then return 0 end if;return row[incomingOffset]
end function
function portalMaxTravelTime(tables,portalNum) if tables==void or portalNum<0 or portalNum>=len(tables.portalMaxTravelTimes) then return 0 end if;return tables.portalMaxTravelTimes[portalNum] end function
