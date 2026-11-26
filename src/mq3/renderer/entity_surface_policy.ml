// SPDX-License-Identifier: GPL-2.0-or-later
// View-dependent refEntity filtering from R_AddEntitySurfaces/R_AddMD3Surfaces.
package mq3.renderer.entity_surface_policy

/// Entity-rendering flag that hides the entity in first-person views.
const RF_THIRD_PERSON=2
/// Entity-rendering flag that draws the entity only in first-person views.
const RF_FIRST_PERSON=4
/// Renderer entity type carrying portal-view information without directly drawing geometry.
const RT_PORTALSURFACE=7

/// Returns `reType!=RT_PORTALSURFACE` from `mq3.renderer.entity_surface_policy.visible`; earlier branches return `false`.
/// @param reType Input used in the result expression `reType!=RT_PORTALSURFACE`.
/// @param renderfx Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`.
/// @param isPortal Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`.
function visible(reType,renderfx,isPortal)
  if (renderfx&RF_FIRST_PERSON)!=0 and isPortal then return false end if
  if (renderfx&RF_THIRD_PERSON)!=0 and not isPortal then return false end if
  return reType!=RT_PORTALSURFACE
end function
/// Computes `reType==RT_PORTALSURFACE` for `mq3.renderer.entity_surface_policy.isPortalMarker`.
/// @param reType Input used in the result expression `reType==RT_PORTALSURFACE`.
function isPortalMarker(reType) return reType==RT_PORTALSURFACE end function
