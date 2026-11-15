// SPDX-License-Identifier: Apache-2.0
// Raw native/lvalue roots must preserve their true allocation owner. The
// nine-field layout reproduces RenderVertex.shaderTime at payload+64.
struct BoundaryChild value payload end struct
struct BoundaryVertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
boundaryRoot=void
boundaryRaw=0
boundaryKeep=void
boundaryInvalid=void
function boundaryAssert(condition,label)
 if not condition then return error(499,"GC allocation boundary: "+label) end if
 return true
end function
function boundaryEvict()
 for index=0 to 31 bytes(24,index) end for
 return void
end function
function boundaryChurn()
 values=array(256,void)
 for index=0 to 255 values[index]=bytes(4096,index%251) end for
 return values
end function
function boundaryVertex(seed)
 child=BoundaryChild(seed,bytes(257,seed%251))
 // 0x02000010 is deliberately a raw non-object word. Interpreting it as
 // a preceding GC header would claim4,194,304 fields beyond this struct.
 return BoundaryVertex(child,[1,2],[3,4],[0,0,1],[7,8,9,255],[255,255,255,255],nativeValueFromRaw(0x02000010),0.0,seed)
end function
function boundaryPrepareStruct()
 global boundaryRoot;global boundaryRaw
 owner=boundaryVertex(137);boundaryRaw=nativeRawValue(owner)
 boundaryRoot=nativeValueFromRaw(boundaryRaw+64)
 return void
end function
function boundaryVerifyStruct()
 owner=nativeValueFromRaw(boundaryRaw)
 boundaryAssert(typeof(owner)=="struct","interior-only struct owner survives")
 boundaryAssert(owner.position.value==137 and owner.position.payload[256]==137,"interior-only struct child graph survives")
 boundaryAssert(owner.shaderTime==0.0 and owner.sourceIndex==137,"real shaderTime and source index survive")
 return void
end function
function boundaryPrepareBytes(offset)
 global boundaryRoot;global boundaryRaw
 owner=bytes(4096,113);owner[4095]=211;boundaryRaw=nativeRawValue(owner)
 // VirtualAlloc heap bases have64KiB alignment. Force an exact bitmap
 // bit index independently of where this allocation landed in the heap.
 if offset<0 then bit=-offset-1;offset=(bit*8-boundaryRaw%256+256)%256 end if
 boundaryRoot=nativeValueFromRaw(boundaryRaw+8+offset)
 return void
end function
function boundaryVerifyBytes()
 owner=nativeValueFromRaw(boundaryRaw)
 boundaryAssert(typeof(owner)=="bytes" and len(owner)==4096,"interior-only bytes owner survives")
 boundaryAssert(owner[0]==113 and owner[4095]==211,"interior-only byte payload survives")
 return void
end function
function boundaryPrepareArray()
 global boundaryRoot;global boundaryRaw
 owner=[BoundaryChild(173,bytes(193,71)),bytes(257,81),[3,5,8],1.25,nativeValueFromRaw(0x02000010),0.0,319]
 boundaryRaw=nativeRawValue(owner);boundaryRoot=nativeValueFromRaw(boundaryRaw+48)
 return void
end function
function boundaryVerifyArray()
 owner=nativeValueFromRaw(boundaryRaw)
 boundaryAssert(typeof(owner)=="array" and len(owner)==7,"interior-only array owner survives")
 boundaryAssert(owner[0].value==173 and owner[0].payload[192]==71,"array child graph survives")
 boundaryAssert(owner[1][256]==81 and owner[2][2]==8 and owner[3]==1.25 and owner[6]==319,"array mixed payload survives")
 return void
end function
function boundaryDropBytes()
 global boundaryRaw
 owner=bytes(1048576,93);boundaryRaw=nativeRawValue(owner);return void
end function
function boundaryWorker(seed)
 owner=boundaryVertex(seed);raw=nativeRawValue(owner)
 boundaryEvict();return nativeValueFromRaw(raw+64)
end function
function boundaryVerifyWorker(interior,seed)
 owner=nativeValueFromRaw(nativeRawValue(interior)-64)
 boundaryAssert(typeof(owner)=="struct" and owner.position.value==seed,"completed thread interior result owns real struct")
 boundaryAssert(owner.position.payload[256]==seed%251,"thread interior retains child payload")
 return void
end function
function main(args)
 global boundaryKeep;global boundaryRoot;global boundaryRaw;global boundaryInvalid
 if len(args)!=1 then return 2 end if;mode=args[0];contracts=0
 if mode=="struct" then
  boundaryPrepareStruct();boundaryEvict();gc_collect();boundaryKeep=boundaryChurn();boundaryVerifyStruct();contracts=3
 else if mode=="bytes" then
  boundaryPrepareBytes(16);boundaryEvict();gc_collect();boundaryKeep=boundaryChurn();boundaryVerifyBytes();contracts=2
 else if mode=="array" then
  boundaryPrepareArray();boundaryEvict();gc_collect();boundaryKeep=boundaryChurn();boundaryVerifyArray();contracts=3
 else if mode=="boundaries" then
  // Every aligned position across several32-bit bitmap words and byte edges,
  // including the first payload word and the final in-bounds payload word.
  for index=0 to 63
   offset=-1-index%32;if index==62 then offset=0 end if;if index==63 then offset=4088 end if
   boundaryPrepareBytes(offset);boundaryEvict();gc_collect();boundaryKeep=boundaryChurn();boundaryVerifyBytes();contracts=contracts+2
  end for
 else if mode=="invalid" then
  canary=BoundaryChild(731,bytes(96,219));boundaryInvalid=array(8,void)
  boundaryRoot=void;boundaryKeep=void;boundaryDropBytes();boundaryEvict();gc_collect()
  // Encoded integers save addresses without creating additional pointer roots.
  boundaryInvalid[0]=nativeValueFromRaw(boundaryRaw)
  boundaryInvalid[1]=nativeValueFromRaw(boundaryRaw+64)
  boundaryInvalid[2]=nativeValueFromRaw(boundaryRaw-8)
  boundaryInvalid[3]=nativeValueFromRaw(0)
  boundaryInvalid[4]=nativeValueFromRaw(8)
  boundaryInvalid[5]=nativeValueFromRaw(0x7ffffffffff0)
  boundaryInvalid[6]=nativeValueFromRaw(-8)
  before=heap_free_bytes();gc_collect();after=heap_free_bytes()
  boundaryAssert(after>=before,"free/interior/header/out-of-range roots do not resurrect dead allocations")
  boundaryAssert(canary.value==731 and canary.payload[95]==219,"invalid roots preserve unrelated live graph");contracts=2
 else if mode=="threads" then
  first=Thread(boundaryWorker);second=Thread(boundaryWorker)
  boundaryAssert(first.Start(211) and second.Start(223),"start interior-root workers")
  for collection=0 to 3 gc_collect();threadSleep(0) end for
  boundaryAssert(first.Join(30000) and second.Join(30000),"join interior-root workers")
  gc_collect();a=first.Result();b=second.Result();first.Close();second.Close();gc_collect()
  boundaryVerifyWorker(a,211);boundaryVerifyWorker(b,223);contracts=6
 else return 2 end if
 print "GC_BOUNDARY_OK mode="+mode+" contracts="+str(contracts)
 return 0
end function
