import mq3.renderer.tr_public as trPublic
import mq3.renderer.qgl as qgl
import mq3.renderer.qgl_linked as linked
import mq3.renderer.tr_local as local
function req(ok,message) if not ok then return error(7961,"renderer headers: "+message) end if;return 1 end function
function main(args)
  count=0
  count=count+req(trPublic.compatible(8) and not trPublic.compatible(7),"REF API")
  count=count+req(len(trPublic.declaredExportNames())==30 and len(trPublic.exportNames())==29 and len(trPublic.importNames())==27,"public table counts")
  count=count+req(trPublic.exportNames()[0]=="Shutdown" and trPublic.exportNames()[28]=="inPVS","export order")
  count=count+req(trPublic.importNames()[0]=="Printf" and trPublic.importNames()[26]=="CIN_RunCinematic","import order")
  count=count+req(trPublic.entrypointName()=="GetRefAPI","entrypoint")
  count=count+req(len(qgl.coreEntryPoints())==341,"qgl core count")
  count=count+req(len(qgl.wglEntryPoints())==24,"WGL count")
  count=count+req(len(qgl.platformEntryPoints())==12,"platform GL count")
  count=count+req(len(qgl.procedureTypes())==34,"extension typedef count")
  count=count+req(qgl.GL_ACTIVE_TEXTURE_ARB==0x84e0 and qgl.GL_TEXTURE3_ARB==0x84c3,"multitexture constants")
  count=count+req(qgl.GL_RGB_S3TC==0x83a0 and qgl.GL_RGB4_S3TC==0x83a1,"S3TC constants")
  reg=qgl.createRegistry();count=count+req(len(qgl.missingRequired(reg))==26,"missing required")
  for each name in qgl.requiredEntryPoints() qgl.bind(reg,name,100,false) end for
  count=count+req(qgl.activate(reg,"opengl32") and reg.loaded,"activate registry")
  count=count+req(qgl.address(reg,"qglBindTexture")==100 and qgl.has(reg,"qwglMakeCurrent"),"resolve registry")
  qgl.bind(reg,"qglBindTexture",200,true);count=count+req(qgl.address(reg,"qglBindTexture")==200,"replace binding")
  qgl.reset(reg);count=count+req(not reg.loaded and len(reg.bindings)==0,"reset registry")
  count=count+req(len(linked.aliases())==334 and len(linked.qglNames())==334,"linked aliases")
  count=count+req(linked.glName("qglAccum")=="glAccum" and linked.glName("qglViewport")=="glViewport","linked mapping")
  count=count+req(linked.contains("qglDrawElements") and not linked.contains("qwglSwapBuffers"),"linked lookup")
  count=count+req(len(local.macroNames())==73 and len(local.enumNames())==111,"local definitions")
  count=count+req(len(local.typeNames())==61 and len(local.functionNames())==159 and len(local.globalNames())==98,"local declarations")
  packed=local.packSort(17,513,9,2);count=count+req(local.sortShader(packed)==17 and local.sortEntity(packed)==513 and local.sortFog(packed)==9 and local.sortDlight(packed)==2,"draw sort")
  count=count+req(local.commandBytesAvailable(0,64) and not local.commandBytesAvailable(local.MAX_RENDER_COMMANDS-4,1),"command capacity")
  count=count+req(local.checkOverflow(90,40,10,10,100,50) and not local.checkOverflow(10,10,10,10,100,50),"tess overflow")
  print "PASS: "+str(count)+" renderer header contracts";return 0
end function

