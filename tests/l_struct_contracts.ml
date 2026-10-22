import mq3.botlib.l_struct as lstruct
import mq3.vm.pc_parser as pc
import std.string as strings
struct Loader text end struct
function loadText(loader,name) return loader.text end function
function req(value,message) if not value then return error(7903,message) end if;return 1 end function
function main(args)
 count=0
 bounded=lstruct.field("score",0,lstruct.FT_INT|lstruct.FT_BOUNDED,0,-10.0,10.0,void);reader=lstruct.sourceReader("bounds","10");count=count+req(lstruct.ReadNumber(reader,bounded)==10,"inclusive integer bound");bad=lstruct.sourceReader("bounds","11");count=count+req(try(lstruct.ReadNumber(bad,bounded)) is error and len(bad.diagnostics)==1,"integer bound diagnostic")
 ch=lstruct.field("c",0,lstruct.FT_CHAR,0,0.0,0.0,void);reader=lstruct.sourceReader("literal","'Q'");count=count+req(lstruct.ReadChar(reader,ch)==81,"literal character")
 long="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuv";reader=lstruct.sourceReader("string","\""+long+"\"");strfd=lstruct.field("text",0,lstruct.FT_STRING,0,0.0,0.0,void);count=count+req(len(bytes(lstruct.ReadString(reader,strfd)))==79,"MAX_STRINGFIELD termination")
 innerFields=[lstruct.field("x",0,lstruct.FT_FLOAT,0,0.0,0.0,void)];inner=lstruct.definition(4,innerFields);outerFields=[lstruct.field("child",0,lstruct.FT_STRUCT,0,0.0,0.0,inner),lstruct.field("items",4,lstruct.FT_INT|lstruct.FT_ARRAY,3,0.0,0.0,void)];outer=lstruct.definition(16,outerFields);record=lstruct.createStructure(outer);reader=lstruct.sourceReader("nested","{ child { x - 1.25 } items { 7 } }");parsed=lstruct.ReadStructure(reader,outer,record);count=count+req(not (parsed is error) and lstruct.value(lstruct.value(record,"child",0),"x",0)==-1.25,"nested structure");count=count+req(lstruct.value(record,"items",0)==7 and lstruct.value(record,"items",1)==0 and lstruct.value(record,"items",2)==0,"short array retains defaults")
 rendered=lstruct.WriteStructure(outer,record);count=count+req(strings.indexOf(rendered,"child\t\t{",0)>=0 and strings.indexOf(rendered,"items\t{7,0,0}",0)>=0,"nested writer and fixed array")
 loader=Loader("#define RATE 125\n{ score RATE }");registry=pc.create(loader,loadText);handle=pc.load(registry,"macro.cfg");pre=lstruct.precompilerReader(registry,handle);def=lstruct.definition(4,[bounded]);macroRecord=lstruct.createStructure(def);parsed=try(lstruct.ReadStructure(pre,def,macroRecord));count=count+req(parsed is error,"macro value still enforces field bound");pc.free(registry,handle)
 loader=Loader("#define RATE 9\n{ score RATE }");registry=pc.create(loader,loadText);handle=pc.load(registry,"macro.cfg");pre=lstruct.precompilerReader(registry,handle);macroRecord=lstruct.createStructure(def);parsed=lstruct.ReadStructure(pre,def,macroRecord);count=count+req(not (parsed is error) and lstruct.value(macroRecord,"score",0)==9,"precompiler define path");pc.free(registry,handle)
 reader=lstruct.sourceReader("unknown","{ nope 1 }");record=lstruct.createStructure(def);count=count+req(try(lstruct.ReadStructure(reader,def,record)) is error and len(reader.diagnostics)==1,"unknown field diagnostic")
 count=count+req(lstruct.WriteFloat(0.0)=="0" and lstruct.WriteFloat(1.250000)=="1.25","float trailing zeros")
 count=count+req(lstruct.FindField(outerFields,"Child")==void,"case-sensitive field lookup")
 print("PASS: "+str(count)+" native l_struct contracts");return 0
end function
