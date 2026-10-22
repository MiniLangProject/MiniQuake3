import mq3.botlib.l_script as lex
import mq3.botlib.l_precomp as pre
import mq3.vm.pc_parser as pc
import mq3.format.pk3 as pk3

struct Context files actions end struct
function req(ok,label) if not ok then return error(499,"l_script contract: "+label) end if;return 1 end function
function load(ctx,name) for each pair in ctx.files if pair[0]==name then return bytes(pair[1]) end if end for;return void end function
function action(ctx,kind,file,line,message) ctx.actions=ctx.actions+[[kind,file,line,message]];return void end function
function runtime(files) ctx=Context(files,[]);h=lex.host();h.context=ctx;h.loadFn=load;h.actionFn=action;return [lex.create(h),ctx] end function
function token() return lex.emptyToken() end function

function main(args)
  count=0;pair=runtime([["base/sample.cfg","name 0x1a 0b101 077 89 3.25uL // c\n\"one\"  \"two\" 'x' >>= $"]]);r=pair[0];ctx=pair[1]
  lex.PS_SetBaseFolder(r,"base");s=lex.LoadScriptFile(r,"sample.cfg");count=count+req(s!=void and lex.FileLength(s.source.data)>20,"file load and length")
  t=token();count=count+req(lex.PS_ReadToken(s,t) and t.type==lex.TT_NAME and t.string=="name" and t.subtype==4,"name")
  count=count+req(lex.PS_ReadToken(s,t) and t.subtype==(lex.TT_HEX|lex.TT_INTEGER) and t.intValue==26,"hex")
  count=count+req(lex.PS_ReadToken(s,t) and t.subtype==(lex.TT_BINARY|lex.TT_INTEGER) and t.intValue==5,"binary")
  count=count+req(lex.PS_ReadToken(s,t) and t.subtype==(lex.TT_OCTAL|lex.TT_INTEGER) and t.intValue==63,"octal")
  count=count+req(lex.PS_ReadToken(s,t) and t.subtype==(lex.TT_DECIMAL|lex.TT_INTEGER) and t.intValue==89,"decimal")
  count=count+req(lex.PS_ReadToken(s,t) and (t.subtype&lex.TT_FLOAT)!=0 and (t.subtype&lex.TT_UNSIGNED)==0 and t.floatValue==3.25,"float and suffix")
  count=count+req(lex.PS_ReadToken(s,t) and t.string=="uL" and t.type==lex.TT_NAME,"float suffix remains")
  count=count+req(lex.PS_ReadToken(s,t) and t.string=="\"onetwo\"" and t.type==lex.TT_STRING and t.linescrossed==1,"joined strings and comments")
  count=count+req(lex.PS_ReadToken(s,t) and t.string=="'x'" and t.type==lex.TT_LITERAL and t.subtype==3,"literal through string reader")
  count=count+req(lex.PS_ReadToken(s,t) and t.string==">>=" and t.subtype==lex.P_RSHIFT_ASSIGN,"long punctuation")
  count=count+req(lex.PunctuationFromNum(s,lex.P_DOLLAR)=="$" and lex.PS_ReadToken(s,t) and t.string=="$","punctuation lookup")
  count=count+req(lex.EndOfScript(s) and lex.NumLinesCrossed(s)==0,"end and lines")
  lex.ResetScript(s);count=count+req(not lex.EndOfScript(s) and lex.GetScriptFlags(s)==0,"reset")
  count=count+req(lex.PS_CheckTokenString(s,"name") and not lex.PS_CheckTokenString(s,"wrong"),"check token string")
  count=count+req(lex.PS_ReadToken(s,t) and t.string=="0x1a","failed check rewinds")
  lex.PS_UnreadLastToken(s);copy=token();count=count+req(lex.PS_ReadToken(s,copy) and copy.string=="0x1a","unread last")
  custom=token();custom.string="custom";custom.type=lex.TT_NAME;lex.PS_UnreadToken(s,custom);count=count+req(lex.PS_ReadToken(s,copy) and copy.string=="custom","unread supplied")
  lex.ResetScript(s);count=count+req(lex.PS_ExpectTokenString(s,"name"),"expect string");count=count+req(lex.PS_ExpectTokenType(s,lex.TT_NUMBER,lex.TT_HEX|lex.TT_INTEGER,t) and t.intValue==26,"expect type")
  count=count+req(lex.PS_CheckTokenType(s,lex.TT_NUMBER,lex.TT_BINARY,t) and t.intValue==5,"check type")
  count=count+req(lex.PS_SkipUntilString(s,"$"),"skip until")
  quotes="\"hello\"";count=count+req(lex.StripDoubleQuotes(quotes)=="hello" and lex.StripSingleQuotes("'q'")=="q","quote strip")
  signed=lex.LoadScriptMemory(r,"- 12 2.5",8,"signed");count=count+req(lex.ReadSignedInt(signed)==-12 and lex.ReadSignedFloat(signed)==2.5,"signed numbers")
  white=lex.LoadScriptMemory(r," \t/*x*/\nname",13,"white");count=count+req(lex.PS_ReadToken(white,t) and t.linescrossed==1,"whitespace line");chars=[];while true ch=lex.PS_NextWhiteSpaceChar(white);if ch==0 then break end if;chars=chars+[ch] end while;count=count+req(len(chars)>2,"whitespace iteration")
  escape=lex.LoadScriptMemory(r,"\"a\\n\\x41\\300\"",13,"escape");count=count+req(lex.PS_ReadToken(escape,t) and t.string=="\"a\nA"+decode(bytes([255]))+"\"" and len(ctx.actions)==1,"escapes and warning")
  noEscape=lex.LoadScriptMemory(r,"\"a\\n\"",5,"raw");lex.SetScriptFlags(noEscape,lex.SCFL_NOSTRINGESCAPECHARS|lex.SCFL_NOSTRINGWHITESPACES);count=count+req(lex.PS_ReadToken(noEscape,t) and t.string=="\"a\\n\"" and lex.GetScriptFlags(noEscape)==12,"string flags")
  primitive=lex.LoadScriptMemory(r,"alpha/beta; x",13,"primitive");lex.SetScriptFlags(primitive,lex.SCFL_PRIMITIVE);count=count+req(lex.PS_ReadToken(primitive,t) and t.string=="alpha/beta","primitive")
  literal=lex.LoadScriptMemory(r,"'\\n'",4,"literal");count=count+req(lex.PS_ReadLiteral(literal,t) and t.subtype==10,"literal entry")
  value=lex.NumberValue("0b1011",lex.TT_BINARY,void,void);count=count+req(value[0]==11 and value[1]==11.0,"number value")
  legacy=lex.LoadScriptMemory(r,"0b11",4,"legacy flags");lex.SetScriptFlags(legacy,lex.SCFL_NOBINARYNUMBERS|lex.SCFL_NONUMBERVALUES);count=count+req(lex.PS_ReadToken(legacy,t) and t.intValue==3 and (t.subtype&lex.TT_BINARY)!=0,"documented legacy flags are inert")
  source=pc.Source("shared",bytes("one two"),0,1,0);wrapped=lex.WrapPCSource(r,source);count=count+req(lex.PS_ReadToken(wrapped,t) and t.string=="one" and source.offset==3 and pc.raw(source).text=="two","shared pc cursor");pct=lex.ToPCToken(t);count=count+req(pct.text=="one" and lex.FromPCToken(pct).string=="one","token adapters")
  preHost=pre.host();preHost.context=ctx;preHost.loadFn=load;preRuntime=pre.create(preHost);preSource=pre.LoadSourceMemory(preRuntime,"alpha beta",10,"precomp bridge");preView=pre.PC_LexerView(preSource);count=count+req(lex.PS_ReadToken(preView,t) and t.string=="alpha" and pre.PC_ReadSourceToken(preSource).text=="beta","l_precomp shares lexer cursor");pre.FreeSource(preSource)
  skip=lex.LoadScriptMemory(r,"a /* b */ target rest",21,"skip");count=count+req(lex.ScriptSkipTo(skip,"target") and lex.PS_ReadToken(skip,t) and t.string=="target","script skip")
  lex.SetScriptPunctuations(skip,[lex.Punctuation("@@",90),lex.Punctuation("@",91)]);customScript=lex.LoadScriptMemory(r,"@@ @",4,"custom punctuation");lex.SetScriptPunctuations(customScript,[lex.Punctuation("@",91),lex.Punctuation("@@",90)]);count=count+req(lex.PS_ReadToken(customScript,t) and t.subtype==90 and lex.PS_ReadToken(customScript,t) and t.subtype==91,"custom punctuation longest")
  silent=lex.LoadScriptMemory(r,"?",1,"silent");lex.SetScriptFlags(silent,lex.SCFL_NOERRORS|lex.SCFL_NOWARNINGS);before=len(ctx.actions);lex.ScriptError(silent,"hidden");lex.ScriptWarning(silent,"hidden");count=count+req(len(ctx.actions)==before,"diagnostic flags")
  count=count+req(lex.FreeScript(s) and not lex.FreeScript(s),"free ownership")
  print("PASS: "+str(count)+" l_script native contracts\n");return 0
end function
