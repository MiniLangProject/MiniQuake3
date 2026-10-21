// SPDX-License-Identifier: GPL-2.0-or-later
// View-dependent refEntity filtering from R_AddEntitySurfaces/R_AddMD3Surfaces.
package mq3.renderer.entity_surface_policy

const RF_THIRD_PERSON=2
const RF_FIRST_PERSON=4
const RT_PORTALSURFACE=7

function visible(reType,renderfx,isPortal)
  if (renderfx&RF_FIRST_PERSON)!=0 and isPortal then return false end if
  if (renderfx&RF_THIRD_PERSON)!=0 and not isPortal then return false end if
  return reType!=RT_PORTALSURFACE
end function
function isPortalMarker(reType) return reType==RT_PORTALSURFACE end function
