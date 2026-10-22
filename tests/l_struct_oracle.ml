import mq3.botlib.l_struct as lstruct
function escaped(text)
 result="";data=bytes(text);if len(data)>0 then for index=0 to len(data)-1 value=data[index];if value==13 then result=result+"\\r" else if value==10 then result=result+"\\n" else if value==9 then result=result+"\\t" else result=result+decode(bytes([value])) end if end for end if;return result
end function
function main(args)
 fields=[lstruct.field("letter",0,lstruct.FT_CHAR,0,0.0,0.0,void),lstruct.field("count",4,lstruct.FT_INT,0,0.0,0.0,void),lstruct.field("ratio",8,lstruct.FT_FLOAT|lstruct.FT_BOUNDED,0,-2.0,2.0,void),lstruct.field("title",12,lstruct.FT_STRING,0,0.0,0.0,void),lstruct.field("values",92,lstruct.FT_INT|lstruct.FT_ARRAY,3,0.0,0.0,void)];def=lstruct.definition(104,fields)
 print("find|"+lstruct.FindField(fields,"count").name+"|none")
 reader=lstruct.sourceReader("oracle","{ letter 'Z' count - 12 ratio 1.5 title \"arena\" values {1,2,3} }");record=lstruct.createStructure(def);parsed=lstruct.ReadStructure(reader,def,record);ok=0;if not (parsed is error) then ok=1 end if;print("read|"+str(ok)+"|"+str(len(reader.diagnostics)));print("values|"+str(lstruct.value(record,"letter",0))+"|"+str(lstruct.value(record,"count",0))+"|"+str(lstruct.value(record,"ratio",0))+"|"+lstruct.value(record,"title",0)+"|"+str(lstruct.value(record,"values",0))+","+str(lstruct.value(record,"values",1))+","+str(lstruct.value(record,"values",2)))
 print("floats|"+escaped(lstruct.WriteFloat(1.5)+"|"+lstruct.WriteFloat(2.0)+"|"+lstruct.WriteFloat(-0.125)))
 print("write|"+escaped(lstruct.WriteStructure(def,record)))
 unsigned=lstruct.field("u",0,lstruct.FT_INT|lstruct.FT_UNSIGNED,0,0.0,0.0,void);bad=lstruct.sourceReader("unsigned","- 1");result=try(lstruct.ReadNumber(bad,unsigned));print("unsigned|0|"+str(len(bad.diagnostics))+"|0")
 return 0
end function
