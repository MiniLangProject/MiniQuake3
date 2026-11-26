// SPDX-License-Identifier: GPL-2.0-or-later
// Adaptive Huffman tree and LSB-first bit I/O from Baseq3 qcommon/huffman.c.
package mq3.qcommon.huffman

const NYT = 256
const INTERNAL_NODE = 257
const NODE_CAPACITY = 768

/// Node record for qcommon.huffman, containing `code`, `weight`, `next`, `prev`, `parent`, `left`, and 2 further fields.
struct Node
  code
  weight
  next
  prev
  parent
  left
  right
  head
end struct

/// Huff record for qcommon.huffman, containing `nodes`, `loc`, `tree`, `lhead`, `ltail`, `blocNode`, and 3 further fields.
struct Huff
  nodes
  loc
  tree
  lhead
  ltail
  blocNode
  headValues
  blocPtrs
  freelist
end struct

/// Create `mq3.qcommon.huffman.Node` with code=0; weight=0; next=- 1; prev=- 1; parent=- 1; left=- 1; right=- 1; head=- 1.
function blankNode()
  return Node(0,0,-1,-1,-1,-1,-1,-1)
end function

/// Compute init in qcommon.huffman; the normal completion returns `Huff(nodes, loc, 0, 0, 0, 1, array(NODE_CAPACITY, - 1), 0, - 1)`.
function init()
  nodes=array(NODE_CAPACITY,void); nodes[0]=blankNode(); nodes[0].code=NYT
  loc=array(257,-1); loc[NYT]=0
  return Huff(nodes,loc,0,0,0,1,array(NODE_CAPACITY,-1),0,-1)
end function

/// Get head in qcommon.huffman; the normal completion returns `slot`.
///
/// Direct state writes: `h.blocPtrs`, `h.freelist`.
/// @param h Record exposing `freelist`, `blocPtrs`, `headValues`. Updated in place: `blocPtrs`, `freelist`.
function getHead(h)
  if h.freelist == -1 then
    slot=h.blocPtrs; h.blocPtrs=h.blocPtrs+1; return slot
  end if
  slot=h.freelist; h.freelist=h.headValues[slot]; return slot
end function

/// Update `h.freelist` in qcommon.huffman.
///
/// Direct state writes: `h.freelist`.
/// @param h Record exposing `headValues`, `freelist`. Updated in place: `freelist`.
/// @param slot Slot operand used by `freeHead`; its reads are shown in the implementation.
function freeHead(h,slot)
  h.headValues[slot]=h.freelist; h.freelist=slot; return void
end function

/// Update `h.tree` in qcommon.huffman.
///
/// Direct state writes: `h.tree`.
/// @param h Record exposing `nodes`. Updated in place: `tree`.
/// @param a Zero-based index into `h.nodes`.
/// @param b Zero-based index into `h.nodes`.
function swapTree(h,a,b)
  pa=h.nodes[a].parent; pb=h.nodes[b].parent
  if pa != -1 then
    if h.nodes[pa].left == a then h.nodes[pa].left=b else h.nodes[pa].right=b end if
  else h.tree=b
  end if
  if pb != -1 then
    if h.nodes[pb].left == b then h.nodes[pb].left=a else h.nodes[pb].right=a end if
  else h.tree=a
  end if
  h.nodes[a].parent=pb; h.nodes[b].parent=pa
  return void
end function

/// Compute swap list in qcommon.huffman.
/// @param h Record exposing `nodes`.
/// @param a Zero-based index into `h.nodes`.
/// @param b Zero-based index into `h.nodes`.
function swapList(h,a,b)
  value=h.nodes[a].next; h.nodes[a].next=h.nodes[b].next; h.nodes[b].next=value
  value=h.nodes[a].prev; h.nodes[a].prev=h.nodes[b].prev; h.nodes[b].prev=value
  if h.nodes[a].next == a then h.nodes[a].next=b end if
  if h.nodes[b].next == b then h.nodes[b].next=a end if
  if h.nodes[a].next != -1 then h.nodes[h.nodes[a].next].prev=a end if
  if h.nodes[b].next != -1 then h.nodes[h.nodes[b].next].prev=b end if
  if h.nodes[a].prev != -1 then h.nodes[h.nodes[a].prev].next=a end if
  if h.nodes[b].prev != -1 then h.nodes[h.nodes[b].prev].next=b end if
  return void
end function

/// Compute increment in qcommon.huffman.
/// @param h Record exposing `nodes`, `headValues`.
/// @param index B passed as `b` to `mq3.qcommon.huffman.swapTree`.
function increment(h,index)
  if index == -1 then return void end if
  node=h.nodes[index]
  if node.next != -1 and h.nodes[node.next].weight == node.weight then
    leader=h.headValues[node.head]
    if leader != node.parent then swapTree(h,leader,index) end if
    swapList(h,leader,index)
  end if
  node=h.nodes[index]
  if node.prev != -1 and h.nodes[node.prev].weight == node.weight then
    h.headValues[node.head]=node.prev
  else
    h.headValues[node.head]=-1; freeHead(h,node.head)
  end if
  node.weight=node.weight+1
  if node.next != -1 and h.nodes[node.next].weight == node.weight then
    node.head=h.nodes[node.next].head
  else
    node.head=getHead(h); h.headValues[node.head]=index
  end if
  parent=node.parent
  if parent != -1 then
    increment(h,parent)
    if h.nodes[index].prev == parent then
      swapList(h,index,parent)
      if h.headValues[h.nodes[index].head] == index then h.headValues[h.nodes[index].head]=parent end if
    end if
  end if
  return void
end function

/// Add ref in qcommon.huffman; updates `h.blocNode`, `h.tree`.
///
/// Direct state writes: `h.blocNode`, `h.tree`.
/// @param h Record exposing `loc`, `blocNode`, `nodes`, `lhead`, `headValues`. Updated in place: `blocNode`, `tree`.
/// @param ch Zero-based index into `h.loc`.
function addRef(h,ch)
  existing=h.loc[ch]
  if existing != -1 then increment(h,existing); return void end if
  leafIndex=h.blocNode; h.blocNode=h.blocNode+1; h.nodes[leafIndex]=blankNode()
  internalIndex=h.blocNode; h.blocNode=h.blocNode+1; h.nodes[internalIndex]=blankNode()
  oldHead=h.nodes[h.lhead].next

  internal=h.nodes[internalIndex]; internal.code=INTERNAL_NODE; internal.weight=1
  internal.next=oldHead
  if oldHead != -1 then
    h.nodes[oldHead].prev=internalIndex
    if h.nodes[oldHead].weight == 1 then internal.head=h.nodes[oldHead].head
    else internal.head=getHead(h); h.headValues[internal.head]=internalIndex
    end if
  else internal.head=getHead(h); h.headValues[internal.head]=internalIndex
  end if
  h.nodes[h.lhead].next=internalIndex; internal.prev=h.lhead

  leaf=h.nodes[leafIndex]; leaf.code=ch; leaf.weight=1
  leaf.next=h.nodes[h.lhead].next
  h.nodes[leaf.next].prev=leafIndex
  if h.nodes[leaf.next].weight == 1 then leaf.head=h.nodes[leaf.next].head
  else leaf.head=getHead(h); h.headValues[leaf.head]=internalIndex
  end if
  h.nodes[h.lhead].next=leafIndex; leaf.prev=h.lhead

  nyt=h.lhead; oldParent=h.nodes[nyt].parent
  if oldParent != -1 then
    if h.nodes[oldParent].left == nyt then h.nodes[oldParent].left=internalIndex else h.nodes[oldParent].right=internalIndex end if
  else h.tree=internalIndex
  end if
  internal.right=leafIndex; internal.left=nyt; internal.parent=oldParent
  h.nodes[nyt].parent=internalIndex; leaf.parent=internalIndex; h.loc[ch]=leafIndex
  increment(h,internal.parent)
  return void
end function

/// Update `data entries` in qcommon.huffman; the normal completion returns `(offset + 1)`.
///
/// Direct state writes: `data elements`.
/// @param bit Bit used in `(bit & 1)` and `((bit & 1) << (offset & 7))`.
/// @param data Mutable sequence written at `(offset >> 3)`.
/// @param offset Offset used in `(offset & 7)` and `(offset + 1)`.
function putBit(bit,data,offset)
  if (offset&7)==0 then data[offset>>3]=0 end if
  data[offset>>3]=data[offset>>3] | ((bit&1) << (offset&7))
  return offset+1
end function

/// Compute qcommon.huffman.getBit as `[((data[(offset >> 3)] >> (offset & 7)) & 1), (offset + 1)]`.
/// @param data Data used in `data[(offset >> 3)]` and `(data[(offset >> 3)] >> (offset & 7))`.
/// @param offset Offset used in `(offset & 7)` and `(offset + 1)`.
function getBit(data,offset)
  return [(data[offset>>3]>>(offset&7))&1,offset+1]
end function

/// Get bit bounded in qcommon.huffman; the normal completion returns `[((data[(offset >> 3)] >> (offset & 7)) & 1), (offset + 1), true]`.
/// @param data Data used in `len(data)` and `data[(offset >> 3)]`.
/// @param offset Offset used in `(offset & 7)` and `(offset + 1)`.
/// @param limit Limit used in `(offset >= limit)` and `((offset >= limit) or ((offset >> 3) >= len(data)))`.
function getBitBounded(data,offset,limit)
  if offset>=limit or (offset>>3)>=len(data) then return [0,offset,false] end if
  return [(data[offset>>3]>>(offset&7))&1,offset+1,true]
end function

/// Compute bit length in qcommon.huffman; the normal completion returns `count`.
/// @param h Record exposing `loc`, `nodes`.
/// @param ch Zero-based index into `h.loc`.
function bitLength(h,ch)
  index=h.loc[ch]
  if index == -1 then return -1 end if
  count=0
  while h.nodes[index].parent != -1 count=count+1; index=h.nodes[index].parent end while
  return count
end function

/// Compute transmit in qcommon.huffman; the normal completion returns `offset`.
///
/// Validation failures include `huffman.transmit: unknown symbol`.
/// @param h Record exposing `loc`, `nodes`.
/// @param ch Zero-based index into `h.loc`.
/// @param data Data passed as `data` to `mq3.qcommon.huffman.putBit`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.huffman.putBit`.
function transmit(h,ch,data,offset)
  index=h.loc[ch]
  if index == -1 then return error(6810,"huffman.transmit: unknown symbol") end if
  path=array(NODE_CAPACITY,0); count=0
  while h.nodes[index].parent != -1
    parent=h.nodes[index].parent
    if h.nodes[parent].right == index then path[count]=1 else path[count]=0 end if
    count=count+1; index=parent
  end while
  if count>0 then
    step=count-1
    while step>=0 offset=putBit(path[step],data,offset); step=step-1 end while
  end if
  return offset
end function

/// Receive huffman in qcommon.huffman; the normal completion returns `[h.nodes[index].code, offset, true]`.
/// @param h Record exposing `tree`, `nodes`.
/// @param data Data passed as `data` to `mq3.qcommon.huffman.getBit`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.huffman.getBit`.
function receive(h,data,offset)
  index=h.tree
  while index != -1 and h.nodes[index].code == INTERNAL_NODE
    pair=getBit(data,offset); offset=pair[1]
    if pair[0] != 0 then index=h.nodes[index].right else index=h.nodes[index].left end if
  end while
  if index == -1 then return [0,offset,false] end if
  return [h.nodes[index].code,offset,true]
end function

/// Receive bounded in qcommon.huffman; the normal completion returns `[h.nodes[index].code, offset, true]`.
/// @param h Record exposing `tree`, `nodes`.
/// @param data Data passed as `data` to `mq3.qcommon.huffman.getBitBounded`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.huffman.getBitBounded`.
/// @param limit Limit passed as `limit` to `mq3.qcommon.huffman.getBitBounded`.
function receiveBounded(h,data,offset,limit)
  index=h.tree
  while index != -1 and h.nodes[index].code == INTERNAL_NODE
    pair=getBitBounded(data,offset,limit)
    if not pair[2] then return [0,offset,false] end if
    offset=pair[1]
    if pair[0] != 0 then index=h.nodes[index].right else index=h.nodes[index].left end if
  end while
  if index == -1 then return [0,offset,false] end if
  return [h.nodes[index].code,offset,true]
end function

/// Compute transmit adaptive in qcommon.huffman; the normal completion returns `offset`.
/// @param h Record exposing `loc`.
/// @param ch Ch passed as `ch` to `mq3.qcommon.huffman.transmit`.
/// @param data Data passed as `data` to `mq3.qcommon.huffman.transmit`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.huffman.transmit`.
function transmitAdaptive(h,ch,data,offset)
  if h.loc[ch] == -1 then
    offset=transmit(h,NYT,data,offset)
    shift=7
    while shift>=0 offset=putBit((ch>>shift)&1,data,offset); shift=shift-1 end while
  else offset=transmit(h,ch,data,offset)
  end if
  addRef(h,ch); return offset
end function

/// Receive adaptive in qcommon.huffman; the normal completion returns `[ch, offset, true]`.
/// @param h H passed as `h` to `mq3.qcommon.huffman.receive`.
/// @param data Data passed as `data` to `mq3.qcommon.huffman.receive`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.huffman.receive`.
function receiveAdaptive(h,data,offset)
  decoded=receive(h,data,offset); ch=decoded[0]; offset=decoded[1]
  if not decoded[2] then return [0,offset,false] end if
  if ch == NYT then
    ch=0
    for index=0 to 7 pair=getBit(data,offset); ch=(ch<<1)+pair[0]; offset=pair[1] end for
  end if
  addRef(h,ch); return [ch,offset,true]
end function

// Packet-level adaptive codec used by Huff_Compress/Huff_Decompress.  The
// first two bytes store the uncompressed length in network byte order; the
// bitstream starts at bit 16 and Baseq3 reserves one final padding byte.
/// @param data Data used in `len(data)` and `(data == void)`.
/// @param offset Offset used in `(offset < 0)` and `(offset + index)`.
function compressPacket(data,offset)
  if data==void or offset<0 or offset>len(data) then return error(6811,"huffman.compressPacket: invalid input") end if
  size=len(data)-offset
  if size<=0 then return data end if
  encoded=bytes(size*2+3,0);encoded[0]=(size>>8)&255;encoded[1]=size&255
  codec=init();bit=16
  for index=0 to size-1 bit=transmitAdaptive(codec,data[offset+index],encoded,bit) end for
  bit=bit+8;packed=bit>>3
  return slice(data,0,offset)+slice(encoded,0,packed)
end function

/// Decompress packet in qcommon.huffman; the normal completion returns `(slice(data, 0, offset) + decoded)`.
///
/// Validation failures include `huffman.decompressPacket: invalid input`; `huffman.decompressPacket: truncated length`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
/// @param maxsize Maxsize used in `(maxsize < offset)` and `(maxsize - offset)`.
function decompressPacket(data,offset,maxsize)
  if data==void or offset<0 or offset>len(data) or maxsize<offset then return error(6812,"huffman.decompressPacket: invalid input") end if
  size=len(data)-offset
  if size<=0 then return data end if
  if size<2 then return error(6812,"huffman.decompressPacket: truncated length") end if
  count=data[offset]*256+data[offset+1]
  if count>maxsize-offset then count=maxsize-offset end if
  encoded=slice(data,offset,size);codec=init();bit=16;decoded=bytes(count,0)
  for index=0 to count-1
    // The original guard is byte based and permits the final partially used
    // byte.  Keep malformed packets bounded while preserving valid streams.
    if (bit>>3)>size then return slice(data,0,offset)+slice(decoded,0,index) end if
    got=receiveAdaptive(codec,encoded,bit);bit=got[1]
    if not got[2] then return slice(data,0,offset)+slice(decoded,0,index) end if
    decoded[index]=got[0]
  end for
  return slice(data,0,offset)+decoded
end function

/// Provide the message frequencies lookup table in qcommon.huffman.
function messageFrequencies()
  return [250315,41193,6292,7106,3730,3750,6110,23283,33317,6950,7838,9714,9257,17259,3949,1778,8288,1604,1590,1663,1100,1213,1238,1134,1749,1059,1246,1149,1273,4486,2805,3472,21819,1159,1670,1066,1043,1012,1053,1070,1726,888,1180,850,960,780,1752,3296,10630,4514,5881,2685,4650,3837,2093,1867,2584,1949,1972,940,1134,1788,1670,1206,5719,6128,7222,6654,3710,3795,1492,1524,2215,1140,1355,971,2180,1248,1328,1195,1770,1078,1264,1266,1168,965,1155,1186,1347,1228,1529,1600,2617,2048,2546,3275,2410,3585,2504,2800,2675,6146,3663,2840,14253,3164,2221,1687,3208,2739,3512,4796,4091,3515,5288,4016,7937,6031,5360,3924,4892,3743,4566,4807,5852,6400,6225,8291,23243,7838,7073,8935,5437,4483,3641,5256,5312,5328,5370,3492,2458,1694,1821,2121,1916,1149,1516,1367,1236,1029,1258,1104,1245,1006,1149,1025,1241,952,1287,997,1713,1009,1187,879,1099,929,1078,951,1656,930,1153,1030,1262,1062,1214,1060,1621,930,1106,912,1034,892,1158,990,1175,850,1121,903,1087,920,1144,1056,3462,2240,4397,12136,7758,1345,1307,3278,1950,886,1023,1112,1077,1042,1061,1071,1484,1001,1096,915,1052,995,1070,876,1111,851,1059,805,1112,923,1103,817,1899,1872,976,841,1127,956,1159,950,7791,954,1289,933,1127,3207,1020,927,1355,768,1040,745,952,805,1073,740,1013,805,1008,796,996,1057,11457,13504]
end function

/// Compute init message in qcommon.huffman; the normal completion returns `h`.
function initMessage()
  h=init(); frequencies=messageFrequencies()
  for ch=0 to 255
    count=frequencies[ch]
    for occurrence=1 to count addRef(h,ch) end for
  end for
  return h
end function

/// Compute init message static in qcommon.huffman; the normal completion returns `Huff(nodes, loc, 2, 0, 0, 513, array(NODE_CAPACITY, - 1), 0, - 1)`.
function initMessageStatic()
  codes=[256,0,257,1,257,2,257,3,257,4,257,5,257,6,257,7,257,8,257,9,257,10,257,11,257,12,257,13,257,14,257,15,257,16,257,17,257,18,257,19,257,20,257,21,257,22,257,23,257,24,257,25,257,26,257,27,257,28,257,29,257,30,257,31,257,32,257,33,257,34,257,35,257,36,257,37,257,38,257,39,257,40,257,41,257,42,257,43,257,44,257,45,257,46,257,47,257,48,257,49,257,50,257,51,257,52,257,53,257,54,257,55,257,56,257,57,257,58,257,59,257,60,257,61,257,62,257,63,257,64,257,65,257,66,257,67,257,68,257,69,257,70,257,71,257,72,257,73,257,74,257,75,257,76,257,77,257,78,257,79,257,80,257,81,257,82,257,83,257,84,257,85,257,86,257,87,257,88,257,89,257,90,257,91,257,92,257,93,257,94,257,95,257,96,257,97,257,98,257,99,257,100,257,101,257,102,257,103,257,104,257,105,257,106,257,107,257,108,257,109,257,110,257,111,257,112,257,113,257,114,257,115,257,116,257,117,257,118,257,119,257,120,257,121,257,122,257,123,257,124,257,125,257,126,257,127,257,128,257,129,257,130,257,131,257,132,257,133,257,134,257,135,257,136,257,137,257,138,257,139,257,140,257,141,257,142,257,143,257,144,257,145,257,146,257,147,257,148,257,149,257,150,257,151,257,152,257,153,257,154,257,155,257,156,257,157,257,158,257,159,257,160,257,161,257,162,257,163,257,164,257,165,257,166,257,167,257,168,257,169,257,170,257,171,257,172,257,173,257,174,257,175,257,176,257,177,257,178,257,179,257,180,257,181,257,182,257,183,257,184,257,185,257,186,257,187,257,188,257,189,257,190,257,191,257,192,257,193,257,194,257,195,257,196,257,197,257,198,257,199,257,200,257,201,257,202,257,203,257,204,257,205,257,206,257,207,257,208,257,209,257,210,257,211,257,212,257,213,257,214,257,215,257,216,257,217,257,218,257,219,257,220,257,221,257,222,257,223,257,224,257,225,257,226,257,227,257,228,257,229,257,230,257,231,257,232,257,233,257,234,257,235,257,236,257,237,257,238,257,239,257,240,257,241,257,242,257,243,257,244,257,245,257,246,257,247,257,248,257,249,257,250,257,251,257,252,257,253,257,254,257,255,257]
  weights=[0,250315,1053340,41193,591364,6292,461976,7106,332475,3730,258889,3750,211661,6110,177673,23283,154802,33317,135775,6950,123114,7838,111584,9714,100077,9257,92056,17259,85617,3949,80813,1778,73989,8288,69441,1604,66334,1590,63013,1663,60101,1100,56962,1213,54622,1238,51358,1134,48719,1749,46526,1059,45530,1246,43333,1149,42284,1273,39620,4486,37748,2805,36241,3472,35243,21819,34198,1159,33017,1670,31788,1066,31225,1043,30519,1012,29582,1053,28663,1070,28299,1726,27743,888,26879,1180,26076,850,25282,960,24575,780,24144,1752,23190,3296,22340,10630,21514,4514,21270,5881,21014,2685,20114,4650,19506,3837,19180,2093,18568,1867,18285,2584,17956,1949,17804,1972,17439,940,16939,1134,16579,1788,16438,1670,15989,1206,15799,5719,15676,6128,15549,7222,15410,6654,15109,3710,14913,3795,14669,1492,14410,1524,14199,2215,14100,1140,13943,1355,13800,971,13375,2180,13172,1248,12904,1328,12765,1195,12517,1770,12337,1078,12238,1264,12008,1266,11733,1168,11364,965,10976,1155,10794,1186,10720,1347,10640,1228,10578,1529,10436,1600,10156,2617,9958,2048,9792,2546,9636,3275,9544,2410,9311,3585,9197,2504,9088,2800,9000,2675,8956,6146,8869,3663,8795,2840,8644,14253,8510,3164,8429,2221,8266,1687,8172,3208,8051,2739,7938,3512,7862,4796,7751,4091,7659,3515,7597,5288,7512,4016,7473,7937,7440,6031,7372,5360,7297,3924,7188,4892,7093,3743,7027,4566,6993,4807,6934,5852,6866,6400,6721,6225,6617,8291,6555,23243,6489,7838,6415,7073,6365,8935,6191,5437,5977,4483,5645,3641,5539,5256,5424,5312,5360,5328,5290,5370,5180,3492,5106,2458,5050,1694,4998,1821,4960,2121,4900,1916,4829,1149,4748,1516,4661,1367,4615,1236,4582,1029,4522,1258,4473,1104,4444,1245,4425,1006,4398,1149,4345,1025,4299,1241,4268,952,4242,1287,4231,997,4198,1713,4159,1009,4107,1187,4081,879,4035,1099,3989,929,3938,1078,3899,951,3852,1656,3822,930,3802,1153,3762,1030,3730,1262,3709,1062,3656,1214,3603,1060,3558,1621,3535,930,3501,1106,3453,912,3413,1034,3381,892,3340,1158,3321,990,3277,1175,3214,850,3201,1121,3138,903,3053,1087,3008,920,2969,1144,2722,1056,2702,3462,2673,2240,2596,4397,2560,12136,2530,7758,2520,1345,2494,1307,2486,3278,2474,1950,2442,886,2419,1023,2382,1112,2366,1077,2343,1042,2318,1061,2313,1071,2302,1484,2298,1001,2284,1096,2268,915,2254,1052,2233,995,2223,1070,2210,876,2203,1111,2195,851,2165,1059,2155,805,2144,1112,2140,923,2128,1103,2121,817,2118,1899,2113,1872,2105,976,2085,841,2074,1127,2059,956,2048,1159,2033,950,2021,7791,2014,954,1998,1289,1991,933,1966,1127,1936,3207,1916,1020,1906,927,1903,1355,1890,768,1863,1040,1859,745,1850,952,1835,805,1815,1073,1780,740,1765,1013,1727,805,1700,1008,1658,796,1610,996,1601,1057,1548,11457,1485,13504,740]
  parents=[512,6,-1,30,2,160,2,144,4,234,4,230,6,164,8,50,8,36,10,148,10,130,12,106,12,110,14,66,14,220,16,352,16,122,18,370,18,374,20,366,20,432,22,404,22,400,24,422,24,356,26,448,26,396,28,418,28,390,30,200,32,268,32,248,34,54,34,412,36,364,38,444,38,454,40,464,40,452,42,442,42,358,44,494,44,408,46,500,46,476,48,508,48,356,52,254,52,100,54,200,56,168,56,274,58,194,58,226,60,320,60,344,62,278,62,334,64,332,64,482,66,422,68,350,68,364,70,404,70,170,72,164,72,142,74,152,74,234,76,228,76,378,78,376,80,306,80,420,82,384,82,474,84,310,86,396,86,386,88,406,88,354,90,436,90,392,92,392,94,410,96,474,96,414,98,408,98,384,100,402,102,376,102,372,104,276,104,326,106,280,108,258,108,290,110,240,112,284,112,270,114,274,114,162,116,236,118,268,118,78,120,262,120,304,124,362,124,260,126,270,126,244,128,192,134,216,134,244,136,180,136,218,138,128,138,166,140,176,140,222,142,188,144,232,146,198,148,190,150,168,150,158,152,160,154,122,154,50,156,130,156,146,158,116,162,172,166,202,170,238,172,182,174,178,176,178,180,174,182,246,184,288,184,362,186,348,186,316,188,338,190,418,192,378,194,382,196,400,196,458,198,394,202,430,204,398,204,466,206,416,208,460,208,398,210,478,210,390,212,468,212,360,214,464,214,406,216,496,218,434,220,486,222,438,224,480,224,368,226,484,228,416,230,458,232,394,236,444,238,402,240,446,242,368,242,486,246,430,250,492,250,456,252,494,252,414,254,472,256,410,258,500,262,426,264,492,264,436,266,490,266,420,272,450,272,248,276,302,278,206,280,92,282,132,282,386,284,388,286,256,286,334,288,496,290,460,292,426,292,438,294,454,294,446,296,440,296,380,298,468,298,434,300,490,300,452,302,470,304,442,306,498,308,428,308,498,310,448,312,504,312,428,314,488,314,432,316,502,318,340,318,342,320,472,322,502,322,424,324,476,324,412,326,482,328,132,328,478,330,388,330,484,332,424,336,260,336,462,338,488,340,382,342,508,344,456,346,510,346,480,348,506,350,440,352,512,354,462,358,504,360,466,366,506,370,470,372,450,374,94,380,84,510]
  lefts=[-1,-1,6,-1,10,-1,12,-1,16,-1,20,-1,24,-1,28,-1,32,-1,36,-1,40,-1,44,-1,48,-1,52,-1,56,-1,58,-1,62,-1,66,-1,68,-1,72,-1,76,-1,80,-1,84,-1,88,-1,92,-1,257,-1,96,-1,98,-1,102,-1,106,-1,110,-1,114,-1,118,-1,120,-1,124,-1,128,-1,132,-1,136,-1,140,-1,209,-1,146,-1,150,-1,152,-1,156,-1,160,-1,164,-1,166,-1,509,-1,172,-1,176,-1,97,-1,182,-1,186,-1,23,-1,192,-1,25,-1,198,-1,202,-1,204,-1,208,-1,212,-1,33,-1,216,-1,220,-1,222,-1,259,-1,393,-1,226,-1,230,-1,234,-1,238,-1,240,-1,242,-1,244,-1,19,-1,250,-1,135,-1,256,-1,260,-1,262,-1,253,-1,203,-1,13,-1,266,-1,249,-1,268,-1,265,-1,277,-1,237,-1,273,-1,229,-1,278,-1,282,-1,286,-1,241,-1,247,-1,292,-1,105,-1,298,-1,300,-1,59,-1,302,-1,306,-1,389,-1,312,-1,316,-1,320,-1,324,-1,326,-1,231,-1,29,-1,239,-1,336,-1,338,-1,139,-1,11,-1,344,-1,137,-1,205,-1,269,-1,195,-1,354,-1,221,-1,279,-1,385,-1,360,-1,364,-1,95,-1,368,-1,370,-1,475,-1,211,-1,376,-1,380,-1,61,-1,219,-1,384,-1,201,-1,185,-1,113,-1,189,-1,394,-1,396,-1,400,-1,402,-1,193,-1,408,-1,412,-1,416,-1,420,-1,424,-1,426,-1,213,-1,430,-1,434,-1,436,-1,440,-1,444,-1,287,-1,450,-1,109,-1,456,-1,460,-1,462,-1,466,-1,470,-1,472,-1,115,-1,476,-1,478,-1,449,-1,451,-1,484,-1,488,-1,285,-1,123,-1,31,-1,496,-1,49,-1,81,-1,500,-1,215,-1,69,-1,502,-1,353,-1,35,-1,183,-1,508,-1,143,-1,141,-1,417,-1,481,-1,177,-1,157,-1,469,-1,57,-1,165,-1,301,-1,53,-1,313,-1,297,-1,349,-1,127,-1,325,-1,85,-1,169,-1,67,-1,173,-1,309,-1,291,-1,147,-1,121,-1,457,-1,407,-1,433,-1,303,-1,41,-1,421,-1,163,-1,409,-1,415,-1,429,-1,347,-1,351,-1,51,-1,383,-1,425,-1,411,-1,361,-1,299,-1,405,-1,497,-1,323,-1,307,-1,319,-1,427,-1,453,-1,171,-1,459,-1,315,-1,335,-1,119,-1,339,-1,331,-1,443,-1,423,-1,375,-1,83,-1,327,-1,435,-1,87,-1,447,-1,439,-1,503,-1,483,-1,512,-1,0]
  rights=[-1,-1,4,-1,8,-1,1,-1,14,-1,18,-1,22,-1,26,-1,30,-1,34,-1,38,-1,42,-1,46,-1,50,-1,54,-1,3,-1,60,-1,64,-1,17,-1,70,-1,74,-1,78,-1,82,-1,86,-1,90,-1,15,-1,94,-1,65,-1,100,-1,104,-1,108,-1,112,-1,116,-1,27,-1,122,-1,126,-1,130,-1,134,-1,138,-1,142,-1,144,-1,148,-1,511,-1,154,-1,158,-1,162,-1,391,-1,168,-1,170,-1,174,-1,178,-1,180,-1,184,-1,188,-1,190,-1,194,-1,196,-1,200,-1,263,-1,206,-1,210,-1,255,-1,214,-1,218,-1,233,-1,21,-1,465,-1,224,-1,228,-1,232,-1,236,-1,133,-1,7,-1,261,-1,246,-1,248,-1,252,-1,254,-1,258,-1,251,-1,5,-1,264,-1,131,-1,235,-1,101,-1,129,-1,270,-1,272,-1,274,-1,275,-1,276,-1,271,-1,280,-1,284,-1,288,-1,290,-1,223,-1,294,-1,296,-1,245,-1,99,-1,267,-1,304,-1,308,-1,310,-1,314,-1,318,-1,322,-1,225,-1,328,-1,330,-1,332,-1,334,-1,107,-1,340,-1,342,-1,243,-1,9,-1,346,-1,348,-1,350,-1,352,-1,227,-1,356,-1,63,-1,358,-1,362,-1,366,-1,399,-1,191,-1,217,-1,372,-1,374,-1,378,-1,207,-1,199,-1,382,-1,103,-1,386,-1,388,-1,390,-1,392,-1,197,-1,398,-1,281,-1,404,-1,406,-1,410,-1,414,-1,418,-1,422,-1,387,-1,428,-1,145,-1,432,-1,153,-1,438,-1,442,-1,446,-1,448,-1,452,-1,454,-1,458,-1,187,-1,464,-1,468,-1,117,-1,401,-1,474,-1,289,-1,480,-1,482,-1,111,-1,486,-1,490,-1,492,-1,494,-1,161,-1,93,-1,498,-1,321,-1,283,-1,125,-1,39,-1,337,-1,504,-1,506,-1,37,-1,181,-1,293,-1,510,-1,295,-1,149,-1,395,-1,397,-1,317,-1,167,-1,345,-1,155,-1,305,-1,45,-1,179,-1,43,-1,159,-1,175,-1,369,-1,461,-1,365,-1,341,-1,55,-1,381,-1,47,-1,473,-1,373,-1,441,-1,357,-1,445,-1,329,-1,377,-1,333,-1,493,-1,79,-1,71,-1,413,-1,437,-1,507,-1,77,-1,73,-1,485,-1,343,-1,311,-1,477,-1,75,-1,501,-1,419,-1,505,-1,367,-1,151,-1,89,-1,467,-1,489,-1,463,-1,471,-1,355,-1,479,-1,379,-1,359,-1,363,-1,403,-1,431,-1,371,-1,455,-1,499,-1,491,-1,91,-1,487,-1,495]
  nodes=array(NODE_CAPACITY,void); loc=array(257,-1)
  for index=0 to 512
    nodes[index]=Node(codes[index],weights[index],-1,-1,parents[index],lefts[index],rights[index],-1)
    if codes[index]>=0 and codes[index]<=NYT then loc[codes[index]]=index end if
  end for
  return Huff(nodes,loc,2,0,0,513,array(NODE_CAPACITY,-1),0,-1)
end function
