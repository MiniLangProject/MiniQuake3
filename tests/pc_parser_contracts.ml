import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n

struct Files loads end struct
function load(files,name)
  files.loads=files.loads+[name]
  if name=="main.menu" then return bytes("menuDef { rect -1 02 3.5 0x10 name_1 \"hello world\" >= }\n#include \"inc.menu\"\n#define PAIR 7 8\nPAIR VALUE") end if
  if name=="inc.menu" then return bytes("itemDef { }\n") end if
  return void
end function
function req(ok,message) if not ok then return error(7692,message) end if;return 1 end function

function main(args)
  count=0;files=Files([]);registry=pc.create(files,load)
  count=count+req(pc.addDefine(registry,"VALUE 42")==1,"global define accepted")
  handle=pc.load(registry,"main.menu");count=count+req(handle==1 and files.loads==["main.menu"],"lowest source handle allocated")
  token=pc.read(registry,handle);count=count+req(token.type==pc.TT_NAME and token.subtype==7 and token.text=="menuDef" and token.line==1,"name token")
  token=pc.read(registry,handle);count=count+req(token.type==pc.TT_PUNCTUATION and token.subtype==46 and token.text=="{","brace punctuation")
  pc.read(registry,handle);token=pc.read(registry,handle);count=count+req(token.type==pc.TT_PUNCTUATION and token.subtype==30 and token.text=="-","minus remains punctuation")
  token=pc.read(registry,handle);count=count+req(token.type==pc.TT_NUMBER and token.subtype==(pc.TT_DECIMAL|pc.TT_INTEGER) and token.intValue==1,"decimal integer")
  token=pc.read(registry,handle);count=count+req(token.subtype==(pc.TT_OCTAL|pc.TT_INTEGER) and token.intValue==2 and token.floatValue==2.0,"octal integer values")
  token=pc.read(registry,handle);count=count+req(token.subtype==(pc.TT_DECIMAL|pc.TT_FLOAT) and token.intValue==3 and token.floatValue==3.5,"floating number values")
  token=pc.read(registry,handle);count=count+req(token.subtype==(pc.TT_HEX|pc.TT_INTEGER) and token.intValue==16 and token.floatValue==16.0,"hex integer values")
  token=pc.read(registry,handle);count=count+req(token.text=="name_1" and token.type==pc.TT_NAME,"name suffix")
  token=pc.read(registry,handle);count=count+req(token.text=="hello world" and token.type==pc.TT_STRING and token.subtype==13,"quoted string strips quotes")
  token=pc.read(registry,handle);count=count+req(token.text==">=" and token.subtype==7,"longest punctuation match")
  token=pc.read(registry,handle);count=count+req(token.text=="}" and token.subtype==47,"closing brace")
  token=pc.read(registry,handle);count=count+req(token.text=="itemDef" and files.loads==["main.menu","inc.menu"],"include source pushed")
  location=pc.location(registry,handle);count=count+req(location[0]=="main.menu" and location[1]==1,"base source name and included line match PC_SourceFileAndLine")
  pc.read(registry,handle);pc.read(registry,handle);first=pc.read(registry,handle);second=pc.read(registry,handle);count=count+req(first.text=="7" and second.text=="8","file define retains every replacement token")
  token=pc.read(registry,handle);count=count+req(token.text=="42" and token.type==pc.TT_NUMBER and token.intValue==42,"global define expanded")
  encoded=pc.encode(token);count=count+req(len(encoded)==pc.TOKEN_SIZE and n.readI32(encoded,0)==pc.TT_NUMBER and n.readI32(encoded,8)==42,"pc_token_t header ABI")
  count=count+req(decode(slice(encoded,16,2))=="42" and encoded[18]==0,"pc_token_t string ABI")
  count=count+req(pc.read(registry,handle)==void,"end of source")
  count=count+req(pc.free(registry,handle)==1 and pc.free(registry,handle)==0,"source free ownership")
  count=count+req(pc.read(registry,0)==void and pc.location(registry,63)==void,"invalid handles fail")
  handles=[];for index=1 to 63 value=pc.load(registry,"main.menu");handles=handles+[value] end for
  count=count+req(handles[0]==1 and handles[62]==63 and pc.load(registry,"main.menu")==0,"63-source handle ceiling")
  print("PASS: "+str(count)+" PC parser contracts");return 0
end function
