import mq3.platform.win_syscon as console
function dump(text) raw=bytes(text);line=str(len(raw));limit=len(raw);if limit>24 then limit=24 end if;if limit>0 then for index=0 to limit-1 line=line+" "+str(raw[index]) end for end if;print(line);return void end function
function main(args)
  state=console.create(false);dump(console.Conbuf_AppendText(state,"abc\n^1red\rx\n\ry"));state.displayText="";state.totalChars=0
  dump(console.Conbuf_AppendText(state,"^^caret\n\rZ"));state.displayText="";state.totalChars=0
  text="";alphabet=bytes("abcdefghijklmnopqrstuvwxyz");for index=0 to 16408 text=text+decode(slice(alphabet,index%26,1)) end for;dump(console.Conbuf_AppendText(state,text));return 0
end function
