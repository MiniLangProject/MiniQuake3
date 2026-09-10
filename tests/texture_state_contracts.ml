import mq3.renderer.texture_state as texture

struct Context events warnings drops end struct
function req(ok,message) if not ok then return error(7201,message) end if;return 1 end function
function bindTexture(context,target,texnum) context.events=context.events+[["bind",target,texnum]] end function
function activeTexture(context,unit) context.events=context.events+[["active",unit]] end function
function clientActiveTexture(context,unit) context.events=context.events+[["client",unit]] end function
function log(context,message) context.events=context.events+[["log",message]] end function
function warning(context,message) context.warnings=context.warnings+[message] end function
function drop(context,message) context.drops=context.drops+[message] end function

function main(args)
  count=0;context=Context([],[],[]);host=texture.Services(bindTexture,activeTexture,clientActiveTexture,log,warning,drop,context)
  fallback=texture.image(90);dlight=texture.image(77);a=texture.image(11);b=texture.image(22);value=texture.create(host,fallback)
  count=count+req(value.currentTmu==0 and value.currentTextures==[0,0],"initial cache")
  value.frameCount=4
  count=count+req(texture.bind(value,a),"first bind changes state")
  count=count+req(value.currentTextures==[11,0] and a.frameUsed==4,"bind caches and accounts image")
  count=count+req(context.events==[["bind",texture.GL_TEXTURE_2D,11]],"bind callback")
  value.frameCount=5
  count=count+req(not texture.bind(value,a) and a.frameUsed==4 and len(context.events)==1,"cached bind is silent")
  count=count+req(texture.selectTexture(value,1) and value.currentTmu==1,"select second unit")
  count=count+req(len(context.events)==5,"selection emits four host events")
  count=count+req(context.events[1]==["active",texture.GL_TEXTURE1_ARB] and context.events[3]==["client",texture.GL_TEXTURE1_ARB],"selection callback order")
  count=count+req(not texture.selectTexture(value,1) and len(context.events)==5,"cached selection is silent")
  texture.bind(value,b)
  count=count+req(value.currentTextures==[11,22] and b.frameUsed==5,"bind uses current unit")
  value.frameCount=6
  count=count+req(texture.bindMultitexture(value,a,1,b,2)==0,"cached multitexture is silent")
  c=texture.image(33);context.events=[]
  count=count+req(texture.bindMultitexture(value,c,1,a,2)==2,"multitexture changes both units")
  count=count+req(value.currentTmu==0 and value.currentTextures==[33,11],"multitexture final cache")
  count=count+req(c.frameUsed==6 and a.frameUsed==6,"multitexture accounts requested images")
  count=count+req(context.events[0]==["bind",texture.GL_TEXTURE_2D,11],"unit one is processed first")
  count=count+req(context.events[1]==["active",texture.GL_TEXTURE0_ARB] and context.events[5]==["bind",texture.GL_TEXTURE_2D,33],"unit zero follows")
  context.events=[];value.noBind=true;value.dlightImage=dlight;value.frameCount=7
  count=count+req(texture.bind(value,b),"nobind redirect changes cache")
  count=count+req(value.currentTextures[0]==77 and b.frameUsed==7 and dlight.frameUsed==0,"nobind accounts requested image")
  count=count+req(context.events==[["bind",texture.GL_TEXTURE_2D,77]],"nobind binds dlight texnum")
  value.frameCount=8
  count=count+req(not texture.bind(value,a) and a.frameUsed==6,"cached redirect remains silent")
  value.currentTextures=[1,2];value.currentTmu=0;context.events=[]
  count=count+req(texture.bindMultitexture(value,a,0,b,0)==2,"nobind redirects both texture units")
  count=count+req(value.currentTextures==[77,77] and value.currentTmu==0,"redirected multitexture cache")
  count=count+req(a.frameUsed==8 and b.frameUsed==8,"redirected multitexture accounting")
  value.noBind=false;value.currentTextures[0]=90;context.events=[]
  count=count+req(not texture.bind(value,void),"cached null fallback")
  count=count+req(context.warnings==["GL_Bind: NULL image"] and len(context.events)==0,"null warning and fallback")
  count=count+req(try(texture.selectTexture(value,2)) is error and context.drops==["GL_SelectTexture: unit = 2"],"invalid unit drops")
  count=count+req(try(texture.bindMultitexture(value,void,0,b,0)) is error,"multitexture requires images")
  count=count+req(try(texture.create(host,void)) is error,"default image required")
  empty=texture.create(void,fallback)
  count=count+req(texture.bind(empty,a) and empty.currentTextures[0]==11,"callbacks are optional")
  count=count+req(texture.GL_TEXTURE_2D==3553 and texture.GL_TEXTURE0_ARB==33984 and texture.GL_TEXTURE1_ARB==33985,"GL constants")
  print("PASS: "+str(count)+" texture-state contracts")
  return 0
end function
