import mq3.botlib.aas_main as mainAas

function b(value) if value then return 1 end if;return 0 end function
function main(args)
  state=mainAas.create(4,8);values=array(mainAas.MAX_CONFIGSTRINGS,void)
  print("before="+mainAas.AAS_StringFromIndex(state,"x",values,len(values),1)+","+str(mainAas.AAS_IndexFromString(state,"x",values,len(values),"none")))
  values[mainAas.CS_MODELS+1]="models/mapobjects/tree.md3";values[mainAas.CS_MODELS+2]="*2";mainAas.AAS_UpdateStringIndexes(state,len(values),values)
  print("models="+mainAas.AAS_ModelFromIndex(state,1)+","+str(mainAas.AAS_IndexFromModel(state,"MODELS/MAPOBJECTS/TREE.MD3"))+","+mainAas.AAS_ModelFromIndex(state,2))
  state.loaded=true;state.time=3.5;print("state="+str(b(state.loaded))+","+str(b(state.initialized))+","+str(mainAas.AAS_Time(state)));mainAas.AAS_SetInitialized(state);print("initialized="+str(b(state.initialized)))
  projected=mainAas.AAS_ProjectPointOntoVector([1.0,2.0,0.0],[0.0,0.0,0.0],[4.0,0.0,0.0]);print("project="+str(projected[0])+","+str(projected[1])+","+str(projected[2]));return 0
end function
