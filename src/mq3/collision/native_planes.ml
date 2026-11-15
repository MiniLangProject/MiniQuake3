// SPDX-License-Identifier: GPL-2.0-or-later
// Numerical plane scans only; canonical plane/facet ownership stays in MiniLang.
package mq3.collision.native_planes
extern function storeNative(cache as ptr,count as i32,index as i32,x as double,y as double,z as double,distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_store_plane" returns i32
extern function findNative(cache as ptr,bytes as i32,count as i32,nx as double,ny as double,nz as double,ax as double,ay as double,az as double,bx as double,by as double,bz as double,cx as double,cy as double,cz as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane" returns i32
extern function find2Native(cache as ptr,bytes as i32,count as i32,x as double,y as double,z as double,distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane2" returns i32
function store(cache,index,p) return storeNative(nativeBytesPtr(cache),len(cache),index,p.normal[0],p.normal[1],p.normal[2],p.distance) end function
function find(cache,count,normal,a,b,c) return findNative(nativeBytesPtr(cache),len(cache),count,normal[0],normal[1],normal[2],a[0],a[1],a[2],b[0],b[1],b[2],c[0],c[1],c[2]) end function
function find2(cache,count,p) return find2Native(nativeBytesPtr(cache),len(cache),count,p.normal[0],p.normal[1],p.normal[2],p.distance) end function
