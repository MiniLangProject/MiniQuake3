// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native lifecycle/index facade for code/botlib/be_aas_main.c.
package mq3.botlib.aas_main

import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n
import std.string as strings

/// Bot-library status indicating successful completion.
const BLERR_NOERROR=0
/// Bot-library error indicating that no AAS navigation map is loaded.
const BLERR_NOAASFILE=3
/// First configuration-string slot reserved for registered model names.
const CS_MODELS=32
/// These are sent over the net as 8 bits.
const MAX_MODELS=256
/// Number of indexed configuration-string slots in the game protocol.
const MAX_CONFIGSTRINGS=1024

/// `Services` record for aas main, containing `context`, `printFn`, `continueReachabilityFn`, `initClusteringFn` and `initRoutingFn` and related fields.
struct Services
  /// Caller-supplied data associated with AAS subsystem setup, routing initialization, shutdown, and
  /// lifecycle messages.
  context
  /// Host callback that prints AAS initialization, map-loading, and shutdown messages.
  printFn
  /// Host callback that continues incremental AAS reachability generation.
  continueReachabilityFn
  /// Host callback that initializes AAS area clustering.
  initClusteringFn
  /// Host callback that initializes AAS routing tables.
  initRoutingFn
  /// Host callback that releases routing tables and caches.
  freeRoutingFn
  /// Host callback that initializes AAS movement and physics settings.
  initSettingsFn
  /// Host callback that initializes storage for AAS entity links.
  initLinkHeapFn
  /// Host callback that initializes entity-linked navigation data.
  initLinkedFn
  /// Host callback that initializes AAS reachability generation.
  initReachabilityFn
  /// Host callback that initializes alternative-route generation.
  initAlternativeFn
  /// Host callback that releases alternative-route resources.
  shutdownAlternativeFn
  /// Host callback that releases the currently loaded BSP navigation data.
  dumpBspFn
  /// Host callback that releases the AAS entity-link heap.
  freeLinksFn
  /// Host callback that releases navigation records linked to entities.
  freeLinkedFn
  /// Host callback that releases the currently loaded AAS map data.
  dumpAasFn
end struct
/// `State` record for aas main, containing `runtime`, `entities`, `configstrings`, `indexesSetup` and `loaded` and related fields.
struct State
  /// Loaded navigation runtime bound to the currently active AAS map.
  runtime
  /// Game or BSP entity records tracked by this subsystem.
  entities
  /// Server configuration strings indexed by their protocol slot.
  configstrings
  /// True when navigation lookup indexes have been initialized.
  indexesSetup
  /// True after the current map navigation files have been loaded, before full initialization may
  /// finish.
  loaded
  /// True after the active map has completed AAS reachability, clustering, and routing initialization.
  initialized
  /// AAS simulation time supplied by the current bot-library frame.
  time
  /// Number of animation frames represented by this model, surface, or animation.
  numframes
  /// Name of the current game map.
  mapname
  /// Path of the file associated with this operation.
  filename
  /// Client capacity retained by the active AAS lifecycle state.
  maxclients
  /// Maximum number of entities.
  maxentities
  /// True when the current AAS data should be saved back to a file.
  savefile
  /// True when computed routing data should be saved to disk.
  saveroutingcache
  /// Routing-cache updates performed during the current frame.
  frameroutingupdates
  /// Lifecycle hooks used to initialize and shut down navigation subsystems.
  services
end struct

/// Create a `mq3.botlib.aas_main.Services` record, initializing `context` from `context`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Build the `mq3.botlib.aas_main.State` result for `create`.
/// @param maxclients Initial value stored in `mq3.botlib.aas_main.State.maxclients`.
/// @param maxentities Initial value stored in `mq3.botlib.aas_main.State.maxentities`.
function create(maxclients,maxentities)
  if maxclients<=0 then maxclients=128 end if;if maxentities<=0 then maxentities=1024 end if
  return State(void,aasEntities.create(maxentities),array(MAX_CONFIGSTRINGS,void),false,false,false,0.0,0,"","",maxclients,maxentities,false,false,0,services(void))
end function
/// Invoke an optional AAS service with its host context, returning void when the service is unavailable.
/// @param state AAS main state; accesses `services`.
/// @param callback Callback invoked by this operation.
function invoke(state,callback) if state==void or callback==void then return void end if;return callback(state.services.context) end function
/// Use `state.services.printFn` to perform `emit`.
/// @param state AAS main state; accesses `services`.
/// @param kind Value passed as argument 2 to `state.services.printFn`.
/// @param text Text to parse, format or deliver.
function emit(state,kind,text) if state!=void and state.services!=void and state.services.printFn!=void then state.services.printFn(state.services.context,kind,text) end if;return void end function

/// Record or dispatch `"fatal"` actions in `AAS_Error`.
/// @param state AAS main state; accesses `services`.
/// @param message Message text supplied to the diagnostic or chat operation.
function AAS_Error(state,message) emit(state,"fatal",message);return error(7990,message) end function
/// Record or dispatch `"error"` actions in `AAS_StringFromIndex`. Return paths include `stringindex[index]`.
/// @param state AAS main state; accesses `indexesSetup`.
/// @param indexname Value used by `AAS_StringFromIndex` in `if state==void or not state.indexesSetup then emit(state,"error",indexname+": index "+str(index)+" not setup")`.
/// @param stringindex Array or byte sequence accessed at `index`.
/// @param numindexes Value used by `AAS_StringFromIndex` in `if index<0 or index>=numindexes or index>=len(stringindex) then emit(state,"error",indexname+": index "+str(inde...`.
/// @param index Index of the entry to access.
function AAS_StringFromIndex(state,indexname,stringindex,numindexes,index)
  if state==void or not state.indexesSetup then emit(state,"error",indexname+": index "+str(index)+" not setup");return "" end if
  if index<0 or index>=numindexes or index>=len(stringindex) then emit(state,"error",indexname+": index "+str(index)+" out of range");return "" end if
  if stringindex[index]==void then if index!=0 then emit(state,"error",indexname+": reference to unused index "+str(index)) end if;return "" end if
  return stringindex[index]
end function
/// Record or dispatch `"error"` actions in `AAS_IndexFromString`.
/// @param state AAS main state; accesses `indexesSetup`.
/// @param indexname Value used by `AAS_IndexFromString` in `if state==void or not state.indexesSetup then emit(state,"error",indexname+": index not setup")`.
/// @param stringindex Array or byte sequence accessed at `index`.
/// @param numindexes Value used by `AAS_IndexFromString` in `limit=numindexes`.
/// @param string Value passed as argument 1 to `std.string.toLowerAscii`.
function AAS_IndexFromString(state,indexname,stringindex,numindexes,string)
  if state==void or not state.indexesSetup then emit(state,"error",indexname+": index not setup");return 0 end if
  limit=numindexes;if limit>len(stringindex) then limit=len(stringindex) end if
  for index=0 to limit-1 if stringindex[index]!=void and strings.toLowerAscii(stringindex[index])==strings.toLowerAscii(string) then return index end if end for;return 0
end function
/// Record or dispatch `"error"` actions in `AAS_ModelFromIndex`.
/// @param state AAS main state; accesses `indexesSetup` and `configstrings`.
/// @param index Index of the entry to access.
function AAS_ModelFromIndex(state,index)
  if state==void or not state.indexesSetup then emit(state,"error","ModelFromIndex: index "+str(index)+" not setup");return "" end if
  if index<0 or index>=MAX_MODELS then emit(state,"error","ModelFromIndex: index "+str(index)+" out of range");return "" end if;value=state.configstrings[CS_MODELS+index];if value==void then return "" end if;return value
end function
/// Record or dispatch `"error"` actions in `AAS_IndexFromModel`.
/// @param state AAS main state; accesses `indexesSetup` and `configstrings`.
/// @param modelname Value passed as argument 1 to `std.string.toLowerAscii`.
function AAS_IndexFromModel(state,modelname)
  if state==void or not state.indexesSetup then emit(state,"error","IndexFromModel: index not setup");return 0 end if
  for index=0 to MAX_MODELS-1 value=state.configstrings[CS_MODELS+index];if value!=void and strings.toLowerAscii(value)==strings.toLowerAscii(modelname) then return index end if end for;return 0
end function
/// Set `state.configstrings[index]` to `configstrings[index]` and `state.indexesSetup` to `true` in `mq3.botlib.aas_main.AAS_UpdateStringIndexes`.
/// @param state AAS main state; accesses `configstrings` and `indexesSetup`. May update `state.configstrings[index]` and `state.indexesSetup` in place.
/// @param numconfigstrings Value used by `AAS_UpdateStringIndexes` in `limit=numconfigstrings`.
/// @param configstrings Array or byte sequence accessed at `index`. Entries are written in place.
function AAS_UpdateStringIndexes(state,numconfigstrings,configstrings)
  if state==void then return void end if;limit=numconfigstrings;if limit>len(configstrings) then limit=len(configstrings) end if;if limit>len(state.configstrings) then limit=len(state.configstrings) end if
  if limit>0 then for index=0 to limit-1 if configstrings[index]!=void then state.configstrings[index]=configstrings[index] end if end for end if;state.indexesSetup=true;return void
end function
/// Test `state!=void and state.loaded` as the condition for `AAS_Loaded`.
/// @param state AAS main state; accesses `loaded`.
function AAS_Loaded(state) return state!=void and state.loaded end function
/// Test `state!=void and state.initialized` as the condition for `AAS_Initialized`.
/// @param state AAS main state; accesses `initialized`.
function AAS_Initialized(state) return state!=void and state.initialized end function
/// Record or dispatch `"message"` actions in `AAS_SetInitialized`.
/// @param state AAS main state; accesses `initialized`. May update `state.initialized` in place.
function AAS_SetInitialized(state) if state!=void then state.initialized=true;emit(state,"message","AAS initialized.") end if;return void end function
/// Use `state.services.continueReachabilityFn` to perform `AAS_ContinueInit`.
/// @param state AAS main state; accesses `loaded`, `initialized` and `services`.
/// @param time Time value in the units expected by this module.
function AAS_ContinueInit(state,time)
  if state==void or not state.loaded or state.initialized then return false end if
  if state.services.continueReachabilityFn!=void and state.services.continueReachabilityFn(state.services.context,time) then return true end if
  invoke(state,state.services.initClusteringFn);invoke(state,state.services.initRoutingFn);AAS_SetInitialized(state);return false
end function
/// Update `state.time`, `state.entities.time`, `state.frameroutingupdates` and `state.numframes` and related state during `AAS_StartFrame`. Return paths include `BLERR_NOERROR`.
/// @param state AAS main state; accesses `time`, `entities`, `frameroutingupdates` and `numframes`. May update `state.time`, `state.entities.time` and `state.frameroutingupdates` and additional fields in place.
/// @param time Time value in the units expected by this module.
function AAS_StartFrame(state,time)
  if state==void then return BLERR_NOAASFILE end if;state.time=time
  aasEntities.AAS_UnlinkInvalidEntities(state.entities);aasEntities.AAS_InvalidateEntities(state.entities);state.entities.time=time
  AAS_ContinueInit(state,time);state.frameroutingupdates=0;state.numframes=state.numframes+1;state.entities.frames=state.numframes;return BLERR_NOERROR
end function
/// Return the AAS frame time, or zero when no AAS state is available.
/// @param state AAS main state; accesses `time`.
function AAS_Time(state) if state==void then return 0.0 end if;return state.time end function
/// Project a point onto the infinite line through the supplied endpoints, retaining the start for a zero-length line.
/// @param point Three-component point used by the geometric query.
/// @param vStart Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param vEnd Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_ProjectPointOntoVector(point,vStart,vEnd)
  x=vEnd[0]-vStart[0];y=vEnd[1]-vStart[1];z=vEnd[2]-vStart[2];length=n.fsqrt(x*x+y*y+z*z);if length==0.0 then return [vStart[0],vStart[1],vStart[2]] end if;x=x/length;y=y/length;z=z/length;scale=(point[0]-vStart[0])*x+(point[1]-vStart[1])*y+(point[2]-vStart[2])*z;return [vStart[0]+scale*x,vStart[1]+scale*y,vStart[2]+scale*z]
end function
/// Update `state.mapname`, `state.filename`, `state.runtime` and `state.loaded` during `AAS_LoadFiles`. Return paths include `BLERR_NOERROR`.
/// @param state AAS main state; accesses `mapname`, `filename`, `runtime`, `loaded` and `entities`. May update `state.mapname`, `state.filename` and `state.runtime` and additional fields in place.
/// @param mapname Value used by `AAS_LoadFiles` in `state.mapname=mapname`.
/// @param runtime AAS main runtime; accesses `initialized`.
function AAS_LoadFiles(state,mapname,runtime)
  if state==void or runtime==void or not runtime.initialized then return BLERR_NOAASFILE end if
  state.mapname=mapname;state.filename="maps/"+mapname+".aas";state.runtime=runtime;state.loaded=true;aasEntities.bindRuntime(state.entities,runtime);aasEntities.AAS_ResetEntityLinks(state.entities);return BLERR_NOERROR
end function
/// Set `state.initialized` to `false` and `state.loaded` to `false` in `mq3.botlib.aas_main.AAS_LoadMap`. Return paths include `BLERR_NOERROR`.
/// @param state AAS main state; accesses `initialized`, `services` and `loaded`. May update `state.initialized` and `state.loaded` in place.
/// @param mapname Value used by `AAS_LoadFiles` in `state.mapname=mapname`.
/// @param runtime AAS main runtime; accesses `initialized`.
function AAS_LoadMap(state,mapname,runtime)
  if state==void or mapname==void then return BLERR_NOERROR end if;state.initialized=false;invoke(state,state.services.freeRoutingFn)
  result=AAS_LoadFiles(state,mapname,runtime);if result!=BLERR_NOERROR then state.loaded=false;return result end if
  invoke(state,state.services.initSettingsFn);invoke(state,state.services.initLinkHeapFn);invoke(state,state.services.initLinkedFn);invoke(state,state.services.initReachabilityFn);invoke(state,state.services.initAlternativeFn);return BLERR_NOERROR
end function
/// Update `state.entities`, `state.numframes`, `state.time` and `state.initialized` and related state during `AAS_Setup`. Return paths include `BLERR_NOERROR`.
/// @param state AAS main state; accesses `entities`, `maxentities`, `numframes`, `time` and `initialized` and related fields. May update `state.entities`, `state.numframes` and `state.time` and additional fields in place.
function AAS_Setup(state)
  if state==void then return BLERR_NOAASFILE end if;state.entities=aasEntities.create(state.maxentities);aasEntities.AAS_InvalidateEntities(state.entities);state.numframes=0;state.time=0.0;state.initialized=false;state.loaded=false;return BLERR_NOERROR
end function
/// Record or dispatch `"message"` actions in `AAS_Shutdown`.
/// @param state AAS main state; accesses `services`, `runtime`, `entities`, `maxentities` and `loaded` and related fields. May update `state.runtime`, `state.entities` and `state.loaded` and additional fields in place.
function AAS_Shutdown(state)
  if state==void then return void end if;invoke(state,state.services.shutdownAlternativeFn);invoke(state,state.services.dumpBspFn);invoke(state,state.services.freeRoutingFn);invoke(state,state.services.freeLinksFn);invoke(state,state.services.freeLinkedFn);invoke(state,state.services.dumpAasFn)
  state.runtime=void;state.entities=aasEntities.create(state.maxentities);state.loaded=false;state.initialized=false;state.indexesSetup=false;state.configstrings=array(MAX_CONFIGSTRINGS,void);state.mapname="";state.filename="";state.time=0.0;state.numframes=0;emit(state,"message","AAS shutdown.");return void
end function
