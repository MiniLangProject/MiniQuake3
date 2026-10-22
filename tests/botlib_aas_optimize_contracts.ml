import mq3.botlib.aas_optimizer as opt

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function fixture(retailActive)
  vertices=[[1,2,3],[11,12,13],[21,22,23],[31,32,33],[41,42,43]]
  edges=[opt.edge(0,0),opt.edge(1,2),opt.edge(2,3),opt.edge(3,4)]
  faces=[opt.face(0,0,0,0,0,0),opt.face(7,opt.FACE_LADDER,2,0,1,2),opt.face(8,0,1,2,1,0),opt.face(9,opt.FACE_LADDER,1,3,2,0)]
  areas=[opt.area(0,0,0,[0,0,0],[0,0,0],[0,0,0]),opt.area(1,2,0,[1,2,3],[4,5,6],[2,3,4]),opt.area(2,1,2,[7,8,9],[10,11,12],[8,9,10])]
  reaches=[opt.reachability(2,1,-2,[0,0,0],[1,2,3],1,17),opt.reachability(2,-3,-3,[0,0,0],[0,0,0],opt.TRAVEL_ELEVATOR,18),opt.reachability(2,333,444,[0,0,0],[0,0,0],opt.TRAVEL_JUMPPAD,19),opt.reachability(2,-222,-111,[0,0,0],[0,0,0],opt.TRAVEL_FUNCBOB,20)]
  return opt.world("fixture",true,125,vertices,edges,[1,2,-1,3],faces,[1,2,-3],areas,reaches,retailActive)
end function
function main(args)
  failures=0;source=fixture(false)
  failures=failures+req(opt.keepEdge(opt.edge(1,2))==1 and opt.keepEdge(void)==1,"KeepEdge unconditionally keeps every edge")
  failures=failures+req(opt.keepFace(source.faces[1])==1 and opt.keepFace(source.faces[2])==0,"KeepFace selects FACE_LADDER")
  allocated=opt.optimizeAlloc(source);failures=failures+req(len(allocated.vertexes)==0 and len(allocated.edges)==1 and len(allocated.faces)==1,"OptimizeAlloc reserves dummy edge and face")
  failures=failures+req(len(allocated.areas)==3 and allocated.areas[0].areaNum==0 and allocated.vertexOptimizeIndex==[0,0,0,0,0],"OptimizeAlloc cleared areas and maps")
  first=opt.optimizeEdge(source,allocated,1);failures=failures+req(first==1 and allocated.edges[1].vertices==[0,1] and allocated.vertexes==[[11,12,13],[21,22,23]],"OptimizeEdge copies vertices with original zero-sentinel behavior")
  reverse=opt.optimizeEdge(source,allocated,-1);failures=failures+req(reverse==-1 and len(allocated.edges)==2,"OptimizeEdge preserves reversed sign and reuses mapping")
  second=opt.optimizeEdge(source,allocated,2);failures=failures+req(second==2 and allocated.edges[2].vertices==[1,2],"OptimizeEdge deduplicates nonzero vertex map")
  failures=failures+req(try(opt.optimizeEdge(source,allocated,99)) is error,"OptimizeEdge rejects invalid references")
  failures=failures+req(opt.optimizeFace(source,allocated,2)==0 and len(allocated.faces)==1,"OptimizeFace removes non-ladder faces")
  ladder=opt.optimizeFace(source,allocated,1);failures=failures+req(ladder==1 and allocated.faces[1].numEdges==2 and allocated.edgeIndex==[1,2],"OptimizeFace copies ladder topology")
  failures=failures+req(opt.optimizeFace(source,allocated,-1)==-1 and len(allocated.faces)==2,"OptimizeFace preserves side sign and reuses mapping")
  areaResult=opt.optimizeArea(source,allocated,1);failures=failures+req(areaResult.areaNum==1 and areaResult.numFaces==1 and allocated.faceIndex==[1],"OptimizeArea filters its face range")
  failures=failures+req(areaResult.mins==[1,2,3] and areaResult.center==[2,3,4],"OptimizeArea preserves geometry metadata")
  failures=failures+req(try(opt.optimizeArea(source,allocated,9)) is error,"OptimizeArea rejects invalid area")
  stored=opt.optimizeStore(source,allocated);failures=failures+req(stored.edges==allocated.edges and stored.faces==allocated.faces and stored.areas==allocated.areas,"OptimizeStore atomically replaces geometry arrays")
  result=opt.optimize(fixture(false));failures=failures+req(len(result.vertexes)==4 and len(result.edges)==4 and len(result.faces)==3,"Optimize produces compact ladder geometry")
  failures=failures+req(result.edgeIndex==[1,2,3] and result.faceIndex==[1,-2],"Optimize preserves topology signs")
  failures=failures+req(result.areas[1].numFaces==1 and result.areas[2].firstFace==1 and result.areas[2].numFaces==1,"Optimize rewrites area ranges")
  failures=failures+req(result.reachability[0].faceNum==1 and result.reachability[0].edgeNum==-2,"Optimize remaps ordinary reachability")
  failures=failures+req(result.reachability[1].faceNum==-3 and result.reachability[1].edgeNum==-3,"elevator encoded references remain intact")
  failures=failures+req(result.reachability[2].faceNum==333 and result.reachability[2].edgeNum==444,"jumppad encoded velocity remains intact")
  failures=failures+req(result.reachability[3].faceNum==-222 and result.reachability[3].edgeNum==-111,"funcbob encoded information remains intact")
  failures=failures+req(result.reachability[0].travelType==1 and result.reachability[0].travelTime==17 and result.reachability[3].travelTime==20,"travel types and times remain intact")
  failures=failures+req(result.mapName=="fixture" and result.loaded and result.time==125,"map identity loaded state and time remain intact")
  failures=failures+req(len(result.actions)==1 and result.actions[0].kind=="print" and result.actions[0].text=="AAS data optimized.\n" and result.actions[0].dispatched,"typed print boundary")
  suppressed=opt.optimize(fixture(true));failures=failures+req(not suppressed.actions[0].dispatched,"retail probe can suppress host dispatch")
  unloaded=fixture(false);unloaded.loaded=false;failures=failures+req(try(opt.optimize(unloaded)) is error,"Optimize requires loaded map state")
  broken=fixture(false);broken.faceIndex[0]=99;failures=failures+req(try(opt.optimize(broken)) is error,"invalid topology fails deterministically")
  masked=fixture(false);masked.reachability[0].travelType=0x1000000+opt.TRAVEL_ELEVATOR;masked.reachability[0].faceNum=999;masked.reachability[0].edgeNum=999;maskedResult=opt.optimize(masked);failures=failures+req(maskedResult.reachability[0].faceNum==999 and maskedResult.reachability[0].edgeNum==999,"travel type mask controls encoded references")
  if failures!=0 then return failures end if;print("PASS: 29 native botlib AAS optimize contracts (8 symbols)");return 0
end function
