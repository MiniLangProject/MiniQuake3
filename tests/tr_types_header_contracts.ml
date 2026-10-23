import mq3.renderer.tr_types as t
function req(ok,label) if not ok then return error(7957,"tr_types.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(t.MAX_DLIGHTS==32 and t.MAX_ENTITIES==1023,"renderer limits")
  count=count+req(t.validRefEntityType(t.RT_MODEL) and t.validRefEntityType(t.RT_PORTALSURFACE) and not t.validRefEntityType(-1) and not t.validRefEntityType(t.RT_MAX_REF_ENTITY_TYPE),"entity type bounds")
  count=count+req(t.RT_MODEL==0 and t.RT_BEAM==3 and t.RT_PORTALSURFACE==7,"entity ordinals")
  count=count+req(t.visibleInView(0,false) and not t.visibleInView(t.RF_THIRD_PERSON,false) and t.visibleInView(t.RF_THIRD_PERSON,true),"third-person visibility")
  count=count+req(t.visibleInView(t.RF_FIRST_PERSON,false) and not t.visibleInView(t.RF_FIRST_PERSON,true),"first-person visibility")
  count=count+req(t.isWorldRequired(0) and not t.isWorldRequired(t.RDF_NOWORLDMODEL),"world requirement")
  count=count+req(t.STEREO_CENTER==0 and t.STEREO_RIGHT==2 and t.TC_S3TC==1,"public enum values")
  count=count+req(t.GLDRV_ICD==0 and t.GLDRV_VOODOO==2 and t.GLHW_PERMEDIA2==4,"GL enum values")
  names=t.typeNames();count=count+req(len(names)==10 and names[0]=="polyVert_t" and names[9]=="glconfig_t","type inventory")
  entity=t.RefEntity(t.RT_MODEL,t.RF_MINLIGHT,7,[1,2,3],4,[[1,0,0],[0,1,0],[0,0,1]],false,[4,5,6],2,[3,4,5],1,0.5,0,0,0,[255,255,255,255],[0,0],0,16,45);count=count+req(entity.hModel==7 and entity.radius==16 and entity.rotation==45,"refEntity mirror")
  print "PASS: "+str(count)+" tr_types.h ABI contracts";return 0
end function
