import mq3.client.ui_local as u
function req(ok,label) if not ok then return error(7982,"ui_local.h: "+label) end if;return 1 end function
function main(args)
 count=0
 count=count+req(u.UI_API_VERSION==4,"old UI API")
 count=count+req(u.RCOLUMN_OFFSET==16 and u.LCOLUMN_OFFSET==-16,"column offsets")
 count=count+req(u.MAX_EDIT_LINE==256 and u.MAX_MENUDEPTH==8 and u.MAX_MENUITEMS==64,"menu capacities")
 count=count+req(u.MTYPE_NULL==0 and u.MTYPE_BTEXT==10,"menu item ordinals")
 count=count+req(u.QMF_BLINK==1 and u.QMF_SILENT==1048576,"menu flag range")
 count=count+req(u.QM_GOTFOCUS==1 and u.QM_ACTIVATED==3,"callback events")
 count=count+req(u.AWARD_ACCURACY==0 and u.AWARD_PERFECT==5,"award ordinals")
 count=count+req(len(u.typeNames())==15,"ABI type inventory")
 count=count+req(len(u.declaredFunctions())==226,"function declaration inventory")
 count=count+req(len(u.declaredGlobals())==79,"global declaration inventory")
 count=count+req(u.menuAcceptsInput(0) and not u.menuAcceptsInput(u.QMF_GRAYED) and not u.menuAcceptsInput(u.QMF_HIDDEN),"input flags")
 count=count+req(u.normalizeCharacterEvent(1024|65)==65 and u.normalizeCharacterEvent(13)==13,"character normalization")
 print("PASS: "+str(count)+" ui_local.h ABI contracts")
 return 0
end function
