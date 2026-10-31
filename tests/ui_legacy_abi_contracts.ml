import mq3.client.ui_legacy_abi as legacy
import mq3.client.ui_syscalls_missionpack as traps

function req(value,label) if not value then return error(7972,"legacy UI ABI contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(legacy.UI_API_VERSION==6 and legacy.UI_CLIENT_STATE_X86_SIZE==3084,"public ABI")
  count=count+req(legacy.UIMENU_NONE==0 and legacy.UIMENU_POSTGAME==6,"menu ordinals")
  count=count+req(legacy.UI_GETAPIVERSION==0 and legacy.UI_HASUNIQUECDKEY==10,"export ordinals")
  count=count+req(legacy.SORT_HOST==0 and legacy.SORT_PUNKBUSTER==5,"sort ordinals")
  count=count+req(len(legacy.keyNames())==112 and legacy.keyNames()[111]=="K_CHAR_FLAG","key inventory")
  count=count+req(len(legacy.publicImportNames())==97 and legacy.publicImportNames()[30]=="UI_CM_LOADMODEL","import inventory")
  count=count+req(traps.UI_CM_LOADMODEL==30 and traps.UI_FS_SEEK==86 and traps.UI_SET_PBCLSTATUS==87,"trap ordinals")
  count=count+req(len(legacy.assemblyNames())==97 and len(legacy.assemblyOrdinals())==97,"assembly inventory")
  count=count+req(legacy.assemblyOrdinals()[0]==-1 and legacy.assemblyOrdinals()[87]==-88 and legacy.assemblyOrdinals()[96]==-109,"assembly ordinals")
  count=count+req(len(legacy.localDefineNames())>70 and len(legacy.localFunctionNames())>200 and len(legacy.localGlobalNames())>100,"local header inventory")
  count=count+req(len(legacy.sharedDefineNames())>60 and len(legacy.sharedTypeNames())>=16 and len(legacy.sharedFunctionNames())>50,"shared header inventory")
  count=count+req(not legacy.utilHasRuntimeCode(),"empty utility unit")
  print "PASS: "+str(count)+" legacy UI ABI contracts";return 0
end function
