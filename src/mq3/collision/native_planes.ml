// SPDX-License-Identifier: GPL-2.0-or-later
// Numerical plane scans only; canonical plane/facet ownership stays in MiniLang.
package mq3.collision.native_planes
/// Store one patch plane as four binary32 values in the native plane cache.
/// @param cache Writable plane cache.
/// @param count Cache capacity in bytes, despite this binding parameter name.
/// @param index Zero-based plane slot, below 2048.
/// @param x Plane-normal X component.
/// @param y Plane-normal Y component.
/// @param z Plane-normal Z component.
/// @param distance Plane distance from the origin.
/// @returns 1 on success, or 0 when the cache bounds or plane index are invalid.
extern function storeNative(cache as ptr,count as i32,index as i32,x as double,y as double,z as double,distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_store_plane" returns i32
/// Find the first cached plane whose normal has dot >= 0 with the requested normal and whose three point distances lie within +/-0.1.
/// @param cache Read-only packed binary32 plane cache.
/// @param bytes Cache length in bytes.
/// @param count Number of candidate planes, from zero through 2048.
/// @param nx Candidate normal X component.
/// @param ny Candidate normal Y component.
/// @param nz Candidate normal Z component.
/// @param ax X coordinate of triangle vertex A.
/// @param ay Y coordinate of triangle vertex A.
/// @param az Z coordinate of triangle vertex A.
/// @param bx X coordinate of triangle vertex B.
/// @param by Y coordinate of triangle vertex B.
/// @param bz Z coordinate of triangle vertex B.
/// @param cx X coordinate of triangle vertex C.
/// @param cy Y coordinate of triangle vertex C.
/// @param cz Z coordinate of triangle vertex C.
/// @returns The first matching zero-based plane index, -1 for no match, or -2 for invalid cache/count bounds.
extern function findNative(cache as ptr,bytes as i32,count as i32,nx as double,ny as double,nz as double,ax as double,ay as double,az as double,bx as double,by as double,bz as double,cx as double,cy as double,cz as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane" returns i32
/// Find a plane or its reversed orientation using normal and distance tolerances.
/// @param cache Read-only packed binary32 plane cache.
/// @param bytes Cache length in bytes.
/// @param count Number of candidate planes, at most 2048.
/// @param x Candidate normal X component.
/// @param y Candidate normal Y component.
/// @param z Candidate normal Z component.
/// @param distance Candidate plane distance.
/// @returns Twice the plane index plus the reversal bit; -1 means no match and -2 means invalid cache/count bounds.
extern function find2Native(cache as ptr,bytes as i32,count as i32,x as double,y as double,z as double,distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane2" returns i32
/// Pack a MiniLang plane into the selected 16-byte native cache slot; return the native success flag.
/// @param cache Mutable byte buffer of packed binary32 normal/distance plane records.
/// @param index Zero-based plane slot, below 2048 and within the cache capacity.
/// @param p Plane record with a three-component normal and distance.
function store(cache,index,p) return storeNative(nativeBytesPtr(cache),len(cache),index,p.normal[0],p.normal[1],p.normal[2],p.distance) end function
/// Search the packed plane cache using a normal and three triangle vertices; return the native plane index or negative sentinel.
/// @param cache Read-only packed plane bytes.
/// @param count Number of populated plane records to search, at most 2048.
/// @param normal Three-component candidate normal; cached normals must not oppose it.
/// @param a First three-component point on the candidate plane.
/// @param b Second three-component point on the candidate plane.
/// @param c Third three-component point on the candidate plane.
function find(cache,count,normal,a,b,c) return findNative(nativeBytesPtr(cache),len(cache),count,normal[0],normal[1],normal[2],a[0],a[1],a[2],b[0],b[1],b[2],c[0],c[1],c[2]) end function
/// Search for a plane or its reversed orientation in the packed cache; return twice the plane index plus its reversal bit.
/// @param cache Read-only packed binary32 plane bytes.
/// @param count Number of populated candidate plane records, at most 2048.
/// @param p Plane record supplying the normal and distance to match; negative results denote no match or invalid bounds.
function find2(cache,count,p) return find2Native(nativeBytesPtr(cache),len(cache),count,p.normal[0],p.normal[1],p.normal[2],p.distance) end function
