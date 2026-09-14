import mq3.botlib.lifecycle_runtime as botlib

function require(ok,label) if not ok then return error(7696,"botlib lifecycle: "+label) end if;return 1 end function
function main(args)
  count=0;state=botlib.create()
  count=count+require(botlib.startFrame(state,1.0)==botlib.BLERR_LIBRARYNOTSETUP and botlib.loadMap(state,"q3dm1")==botlib.BLERR_LIBRARYNOTSETUP,"setup guards frame and map")
  count=count+require(botlib.varSet(state,"maxclients","8")==0 and botlib.varSet(state,"MAXENTITIES","1024")==0,"pre-setup libvars accepted")
  count=count+require(botlib.varGet(state,"MaxClients")=="8" and botlib.varGet(state,"missing")=="","case-insensitive get and empty missing value")
  botlib.varSet(state,"maxclients","12");count=count+require(len(state.variables)==2 and botlib.varGet(state,"maxclients")=="12" and state.variables[0].modified,"set updates existing libvar")
  count=count+require(botlib.setup(state)==0 and state.setup and state.maxclients==12 and state.maxentities==1024,"setup consumes library limits")
  count=count+require(botlib.loadMap(state,"q3dm1")==0 and state.mapName=="q3dm1" and state.mapLoads==1,"map lifecycle retained")
  count=count+require(botlib.startFrame(state,1.25)==0 and botlib.startFrame(state,1.30)==0 and state.frames==2 and state.time==1.30,"frame time retained in seconds")
  count=count+require(botlib.updateEntity(state,0,true)==0 and botlib.updateEntity(state,1024,false)==0 and state.entityUpdates==2 and state.removedEntities==1,"entity boundary and removal retained")
  count=count+require(botlib.updateEntity(state,-1,true)==botlib.BLERR_INVALIDENTITYNUMBER and botlib.updateEntity(state,1025,true)==botlib.BLERR_INVALIDENTITYNUMBER,"invalid entity numbers rejected")
  count=count+require(botlib.setup(state)==0 and state.frames==0 and state.mapLoads==0 and len(state.variables)==2,"repeat setup resets globals but preserves libvars")
  count=count+require(botlib.shutdown(state)==0 and not state.setup and len(state.variables)==0,"shutdown releases library variables")
  count=count+require(botlib.shutdown(state)==botlib.BLERR_LIBRARYNOTSETUP and botlib.updateEntity(state,0,true)==botlib.BLERR_LIBRARYNOTSETUP,"post-shutdown calls report library-not-setup")
  print("PASS: "+str(count)+" botlib lifecycle runtime contracts");return 0
end function
