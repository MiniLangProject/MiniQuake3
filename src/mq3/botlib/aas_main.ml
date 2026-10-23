// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native lifecycle/index facade for code/botlib/be_aas_main.c.
package mq3.botlib.aas_main

import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n
import std.string as strings

const BLERR_NOERROR=0
const BLERR_NOAASFILE=3
const CS_MODELS=32
const MAX_MODELS=256
const MAX_CONFIGSTRINGS=1024

struct Services context printFn continueReachabilityFn initClusteringFn initRoutingFn freeRoutingFn initSettingsFn initLinkHeapFn initLinkedFn initReachabilityFn initAlternativeFn shutdownAlternativeFn dumpBspFn freeLinksFn freeLinkedFn dumpAasFn end struct
struct State runtime entities configstrings indexesSetup loaded initialized time numframes mapname filename maxclients maxentities savefile saveroutingcache frameroutingupdates services end struct

function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function create(maxclients,maxentities)
  if maxclients<=0 then maxclients=128 end if;if maxentities<=0 then maxentities=1024 end if
  return State(void,aasEntities.create(maxentities),array(MAX_CONFIGSTRINGS,void),false,false,false,0.0,0,"","",maxclients,maxentities,false,false,0,services(void))
end function
function invoke(state,callback) if state==void or callback==void then return void end if;return callback(state.services.context) end function
function emit(state,kind,text) if state!=void and state.services!=void and state.services.printFn!=void then state.services.printFn(state.services.context,kind,text) end if;return void end function

function AAS_Error(state,message) emit(state,"fatal",message);return error(7990,message) end function
function AAS_StringFromIndex(state,indexname,stringindex,numindexes,index)
  if state==void or not state.indexesSetup then emit(state,"error",indexname+": index "+str(index)+" not setup");return "" end if
  if index<0 or index>=numindexes or index>=len(stringindex) then emit(state,"error",indexname+": index "+str(index)+" out of range");return "" end if
  if stringindex[index]==void then if index!=0 then emit(state,"error",indexname+": reference to unused index "+str(index)) end if;return "" end if
  return stringindex[index]
end function
function AAS_IndexFromString(state,indexname,stringindex,numindexes,string)
  if state==void or not state.indexesSetup then emit(state,"error",indexname+": index not setup");return 0 end if
  limit=numindexes;if limit>len(stringindex) then limit=len(stringindex) end if
  for index=0 to limit-1 if stringindex[index]!=void and strings.toLowerAscii(stringindex[index])==strings.toLowerAscii(string) then return index end if end for;return 0
end function
function AAS_ModelFromIndex(state,index)
  if state==void or not state.indexesSetup then emit(state,"error","ModelFromIndex: index "+str(index)+" not setup");return "" end if
  if index<0 or index>=MAX_MODELS then emit(state,"error","ModelFromIndex: index "+str(index)+" out of range");return "" end if;value=state.configstrings[CS_MODELS+index];if value==void then return "" end if;return value
end function
function AAS_IndexFromModel(state,modelname)
  if state==void or not state.indexesSetup then emit(state,"error","IndexFromModel: index not setup");return 0 end if
  for index=0 to MAX_MODELS-1 value=state.configstrings[CS_MODELS+index];if value!=void and strings.toLowerAscii(value)==strings.toLowerAscii(modelname) then return index end if end for;return 0
end function
function AAS_UpdateStringIndexes(state,numconfigstrings,configstrings)
  if state==void then return void end if;limit=numconfigstrings;if limit>len(configstrings) then limit=len(configstrings) end if;if limit>len(state.configstrings) then limit=len(state.configstrings) end if
  if limit>0 then for index=0 to limit-1 if configstrings[index]!=void then state.configstrings[index]=configstrings[index] end if end for end if;state.indexesSetup=true;return void
end function
function AAS_Loaded(state) return state!=void and state.loaded end function
function AAS_Initialized(state) return state!=void and state.initialized end function
function AAS_SetInitialized(state) if state!=void then state.initialized=true;emit(state,"message","AAS initialized.") end if;return void end function
function AAS_ContinueInit(state,time)
  if state==void or not state.loaded or state.initialized then return false end if
  if state.services.continueReachabilityFn!=void and state.services.continueReachabilityFn(state.services.context,time) then return true end if
  invoke(state,state.services.initClusteringFn);invoke(state,state.services.initRoutingFn);AAS_SetInitialized(state);return false
end function
function AAS_StartFrame(state,time)
  if state==void then return BLERR_NOAASFILE end if;state.time=time
  aasEntities.AAS_UnlinkInvalidEntities(state.entities);aasEntities.AAS_InvalidateEntities(state.entities);state.entities.time=time
  AAS_ContinueInit(state,time);state.frameroutingupdates=0;state.numframes=state.numframes+1;state.entities.frames=state.numframes;return BLERR_NOERROR
end function
function AAS_Time(state) if state==void then return 0.0 end if;return state.time end function
function AAS_ProjectPointOntoVector(point,vStart,vEnd)
  x=vEnd[0]-vStart[0];y=vEnd[1]-vStart[1];z=vEnd[2]-vStart[2];length=n.fsqrt(x*x+y*y+z*z);if length==0.0 then return [vStart[0],vStart[1],vStart[2]] end if;x=x/length;y=y/length;z=z/length;scale=(point[0]-vStart[0])*x+(point[1]-vStart[1])*y+(point[2]-vStart[2])*z;return [vStart[0]+scale*x,vStart[1]+scale*y,vStart[2]+scale*z]
end function
function AAS_LoadFiles(state,mapname,runtime)
  if state==void or runtime==void or not runtime.initialized then return BLERR_NOAASFILE end if
  state.mapname=mapname;state.filename="maps/"+mapname+".aas";state.runtime=runtime;state.loaded=true;aasEntities.bindRuntime(state.entities,runtime);aasEntities.AAS_ResetEntityLinks(state.entities);return BLERR_NOERROR
end function
function AAS_LoadMap(state,mapname,runtime)
  if state==void or mapname==void then return BLERR_NOERROR end if;state.initialized=false;invoke(state,state.services.freeRoutingFn)
  result=AAS_LoadFiles(state,mapname,runtime);if result!=BLERR_NOERROR then state.loaded=false;return result end if
  invoke(state,state.services.initSettingsFn);invoke(state,state.services.initLinkHeapFn);invoke(state,state.services.initLinkedFn);invoke(state,state.services.initReachabilityFn);invoke(state,state.services.initAlternativeFn);return BLERR_NOERROR
end function
function AAS_Setup(state)
  if state==void then return BLERR_NOAASFILE end if;state.entities=aasEntities.create(state.maxentities);aasEntities.AAS_InvalidateEntities(state.entities);state.numframes=0;state.time=0.0;state.initialized=false;state.loaded=false;return BLERR_NOERROR
end function
function AAS_Shutdown(state)
  if state==void then return void end if;invoke(state,state.services.shutdownAlternativeFn);invoke(state,state.services.dumpBspFn);invoke(state,state.services.freeRoutingFn);invoke(state,state.services.freeLinksFn);invoke(state,state.services.freeLinkedFn);invoke(state,state.services.dumpAasFn)
  state.runtime=void;state.entities=aasEntities.create(state.maxentities);state.loaded=false;state.initialized=false;state.indexesSetup=false;state.configstrings=array(MAX_CONFIGSTRINGS,void);state.mapname="";state.filename="";state.time=0.0;state.numframes=0;emit(state,"message","AAS shutdown.");return void
end function
