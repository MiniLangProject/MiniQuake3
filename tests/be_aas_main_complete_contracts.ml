import mq3.botlib.aas_main as mainAas
import mq3.botlib.aas_runtime as runtime

struct Context events pending end struct
function require(ok,label) if not ok then return error(7992,"be_aas_main complete: "+label) end if;return 1 end function
function mark(c,name) c.events=c.events+[name];return void end function
function printHost(c,kind,text) c.events=c.events+[kind+":"+text];return void end function
function pending(c,time) c.events=c.events+["continue:"+str(time)];return c.pending end function
function clustering(c) return mark(c,"cluster") end function
function routing(c) return mark(c,"route") end function
function freeRouting(c) return mark(c,"free-route") end function
function initSettings(c) return mark(c,"settings") end function
function initLink(c) return mark(c,"link-heap") end function
function initLinked(c) return mark(c,"linked") end function
function initReach(c) return mark(c,"reach") end function
function initAlt(c) return mark(c,"alternative") end function
function main(args)
  state=mainAas.create(4,8);context=Context([],false);state.services.context=context;state.services.printFn=printHost;state.services.continueReachabilityFn=pending;state.services.initClusteringFn=clustering;state.services.initRoutingFn=routing;state.services.freeRoutingFn=freeRouting;state.services.initSettingsFn=initSettings;state.services.initLinkHeapFn=initLink;state.services.initLinkedFn=initLinked;state.services.initReachabilityFn=initReach;state.services.initAlternativeFn=initAlt;checks=0
  checks=checks+require(mainAas.AAS_Setup(state)==0 and not mainAas.AAS_Loaded(state) and not mainAas.AAS_Initialized(state),"setup")
  values=array(mainAas.MAX_CONFIGSTRINGS,void);values[mainAas.CS_MODELS+1]="models/mapobjects/tree.md3";values[mainAas.CS_MODELS+2]="*2";mainAas.AAS_UpdateStringIndexes(state,len(values),values)
  checks=checks+require(mainAas.AAS_ModelFromIndex(state,1)=="models/mapobjects/tree.md3" and mainAas.AAS_IndexFromModel(state,"MODELS/MAPOBJECTS/TREE.MD3")==1,"model indexes")
  checks=checks+require(mainAas.AAS_StringFromIndex(state,"x",values,len(values),-1)=="" and mainAas.AAS_IndexFromString(state,"x",values,len(values),"missing")==0,"index guards")
  point=mainAas.AAS_ProjectPointOntoVector([1.0,2.0,0.0],[0.0,0.0,0.0],[4.0,0.0,0.0]);checks=checks+require(point==[1.0,0.0,0.0],"projection")
  context.events=[];fake=runtime.Runtime(void,true,[],0.0,0);checks=checks+require(mainAas.AAS_LoadMap(state,"q3dm1",fake)==0 and mainAas.AAS_Loaded(state) and state.filename=="maps/q3dm1.aas","load map")
  checks=checks+require(len(context.events)==6 and context.events[0]=="free-route" and context.events[1]=="settings" and context.events[2]=="link-heap" and context.events[3]=="linked" and context.events[4]=="reach" and context.events[5]=="alternative","load callbacks")
  context.events=[];context.pending=true;mainAas.AAS_StartFrame(state,1.25);checks=checks+require(not mainAas.AAS_Initialized(state) and mainAas.AAS_Time(state)==1.25 and state.numframes==1,"incremental init pending")
  context.events=[];context.pending=false;mainAas.AAS_StartFrame(state,2.5);checks=checks+require(mainAas.AAS_Initialized(state) and len(context.events)==4 and context.events[0]=="continue:2.5" and context.events[1]=="cluster" and context.events[2]=="route" and context.events[3]=="message:AAS initialized.","incremental init complete")
  checks=checks+require(mainAas.AAS_LoadMap(state,void,fake)==0,"null map refresh")
  mainAas.AAS_Shutdown(state);checks=checks+require(not state.loaded and not state.initialized and state.runtime==void and state.numframes==0,"shutdown")
  print("PASS: "+str(checks)+" complete be_aas_main contracts");return 0
end function
