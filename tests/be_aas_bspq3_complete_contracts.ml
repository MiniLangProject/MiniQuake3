import mq3.botlib.aas_bspq3 as bsp
function req(value,message) if not value then return error(9927,message) end if;return 1 end function
function main(args)
 n=0;state=bsp.create();source="{ \"classname\" \"worldspawn\" \"message\" \"first\" \"message\" \"last\" } { \"classname\" \"info_player_deathmatch\" \"origin\" \"1 2 3\" \"wait\" \"2.5\" \"count\" \"-7\" }"
 n=n+req(bsp.AAS_LoadBSPFile(state,source)==0 and state.loaded and state.entDataSize==len(bytes(source))+1,"load BSP entity text")
 n=n+req(state.numEntities==3 and bsp.AAS_NextBSPEntity(state,0)==1 and bsp.AAS_NextBSPEntity(state,1)==2 and bsp.AAS_NextBSPEntity(state,2)==0,"one-based BSP entity iteration")
 n=n+req(bsp.AAS_BSPEntityInRange(state,1) and not bsp.AAS_BSPEntityInRange(state,0) and not bsp.AAS_BSPEntityInRange(state,3),"BSP entity range")
 n=n+req(bsp.AAS_ValueForBSPEpairKey(state,1,"classname")==[true,"worldspawn"],"worldspawn stored at entity one")
 n=n+req(bsp.AAS_ValueForBSPEpairKey(state,1,"message")==[true,"last"],"prepended epairs preserve duplicate-key precedence")
 n=n+req(bsp.AAS_ValueForBSPEpairKey(state,2,"missing")==[false,""],"missing epair")
 n=n+req(bsp.AAS_VectorForBSPEpairKey(state,2,"origin")==[true,[1.0,2.0,3.0]],"vector epair")
 n=n+req(bsp.AAS_VectorForBSPEpairKey(state,2,"missing")==[false,[0.0,0.0,0.0]],"missing vector cleared")
 n=n+req(bsp.AAS_FloatForBSPEpairKey(state,2,"wait")==[true,2.5] and bsp.AAS_FloatForBSPEpairKey(state,2,"missing")==[false,0.0],"float epair")
 n=n+req(bsp.AAS_IntForBSPEpairKey(state,2,"count")==[true,-7] and bsp.AAS_IntForBSPEpairKey(state,2,"missing")==[false,0],"integer epair")
 n=n+req(bsp.AAS_inPHS([0.0,0.0,0.0],[1.0,1.0,1.0]),"Q3 PHS stub")
 n=n+req(bsp.AAS_BSPLinkEntity([],[],1,1)==void and bsp.AAS_UnlinkFromBSPLeaves(void)==void,"Q3 leaf-link stubs")
 n=n+req(bsp.AAS_BoxEntities([],[],[],99)==0 and bsp.AAS_BSPTraceLight([],[],[],0,0,0)==0,"Q3 box/light stubs")
 n=n+req(bsp.PrintContents(1|8|32)==["CONTENTS_SOLID","CONTENTS_LAVA","CONTENTS_WATER"],"debug content names")
 n=n+req(bsp.PrintContents(64)==["CONTENTS_MIST","LAST_VISIBLE_CONTENTS"] and bsp.PrintContents(262144|536870912)==["CONTENTS_CURRENT_0","CONTENTS_LADDER"],"complete debug content table")
 bsp.AAS_DumpBSPData(state);n=n+req(not state.loaded and state.numEntities==0 and state.dentData=="" and state.entDataSize==0,"dump BSP data")
 bad=bsp.create();n=n+req(try(bsp.AAS_LoadBSPFile(bad,"oops")) is error and bad.numEntities==0,"malformed entity text rejected")
 print("PASS: "+str(n)+" complete be_aas_bspq3 contracts");return 0
end function
