import std.fs as fs
import mq3.format.pk3 as pk3
import mq3.format.bsp as format
import mq3.botlib.aas_bspq3 as bsp
function req(value,message) if not value then return error(9928,message) end if;return 1 end function
function main(args)
 if len(args)!=1 then return error(9928,"usage: probe pak0.pk3") end if;n=0;archive=pk3.open(args[0]);data=pk3.read(archive,"maps/q3dm1.bsp");map=format.load(data);raw=slice(map.data,map.offsets[0],map.lengths[0]);state=bsp.create();bsp.AAS_LoadBSPFile(state,decode(raw))
 n=n+req(state.loaded and state.numEntities>100,"retail q3dm1 entities loaded")
 n=n+req(bsp.AAS_ValueForBSPEpairKey(state,1,"classname")==[true,"worldspawn"],"retail worldspawn one-based")
 spawns=0;origins=0;entity=bsp.AAS_NextBSPEntity(state,0)
 while entity!=0 className=bsp.AAS_ValueForBSPEpairKey(state,entity,"classname");if className[0] and className[1]=="info_player_deathmatch" then spawns=spawns+1;origin=bsp.AAS_VectorForBSPEpairKey(state,entity,"origin");if origin[0] then origins=origins+1 end if end if;entity=bsp.AAS_NextBSPEntity(state,entity) end while
 n=n+req(spawns>0 and origins==spawns,"retail spawn vectors parsed");print("PASS: "+str(n)+" retail be_aas_bspq3 checks entities="+str(state.numEntities-1)+" spawns="+str(spawns));return 0
end function
