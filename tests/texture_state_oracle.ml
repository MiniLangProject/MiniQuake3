import mq3.renderer.texture_state as texture

struct Context end struct
function bindTexture(context,target,texnum) print("B|"+str(target)+"|"+str(texnum)) end function
function activeTexture(context,unit) print("A|"+str(unit)) end function
function clientActiveTexture(context,unit) print("C|"+str(unit)) end function
function warning(context,message) print("W|null") end function
function state(name,value,a,b,c) print("S|"+name+"|"+str(value.currentTmu)+"|"+str(value.currentTextures[0])+"|"+str(value.currentTextures[1])+"|"+str(a.frameUsed)+"|"+str(b.frameUsed)+"|"+str(c.frameUsed)) end function

function main(args)
  context=Context();host=texture.Services(bindTexture,activeTexture,clientActiveTexture,void,warning,void,context)
  fallback=texture.image(90);dlight=texture.image(77);a=texture.image(11);b=texture.image(22);c=texture.image(33)
  value=texture.create(host,fallback);value.dlightImage=dlight;value.frameCount=5
  texture.bind(value,a);state("bind-a",value,a,b,c)
  value.frameCount=6;texture.bind(value,a);state("cached-a",value,a,b,c)
  texture.selectTexture(value,1);texture.bind(value,b);state("unit1-b",value,a,b,c)
  value.frameCount=7;texture.bindMultitexture(value,a,7681,c,7681);state("multi",value,a,b,c)
  value.frameCount=8;value.noBind=true;texture.bind(value,b);state("nobind",value,a,b,c)
  value.frameCount=9;texture.bind(value,a);state("cached-nobind",value,a,b,c)
  value.frameCount=10;texture.bindMultitexture(value,a,7681,b,7681);state("multi-nobind",value,a,b,c)
  value.noBind=false;value.currentTextures[0]=90;texture.bind(value,void);state("null-cached",value,a,b,c)
  return 0
end function
