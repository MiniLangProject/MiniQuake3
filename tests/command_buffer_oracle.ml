// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.command_buffer as command

struct Trace
  lines
  prints
end struct

function encodeHex(text)
  data = bytes(text); result = ""; digits = bytes("0123456789abcdef")
  for each value in data
    result = result+decode(bytes([digits[(value>>4)&15],digits[value&15]]))
  end for
  return result
end function
function joinedToken(state,name,joins)
  count = command.argc(state); original = command.cmd(state)
  result = "T|"+name+"|"+str(count)+"|"+encodeHex(original)
  for each part in state.argv result = result+"|"+encodeHex(part) end for
  if joins then
    result = result+"|A:"+encodeHex(command.args(state))+"|F:"+encodeHex(command.argsFrom(state,-2))
    result = result+"|V:"+encodeHex(command.argvBuffer(state,1,4))+"|B:"+encodeHex(command.argsBuffer(state,7))
  end if
  print result; return void
end function
function tokenCase(state,name,input,joins)
  command.tokenizeString(state,input); return joinedToken(state,name,joins)
end function
function executeCallback(state,line)
  state.context.lines = state.context.lines+[line]
  command.tokenizeString(state,line)
  if command.argv(state,0) == "wait" then command.waitCommand(state)
  else if command.argv(state,0) == "insert" then command.insertText(state,command.argv(state,1))
  else if command.argv(state,0) == "append" then command.addText(state,command.argv(state,1))
  end if
  return void
end function
function printCallback(state,message)
  state.context.prints = state.context.prints+[message]; return void
end function
function resetBuffer(state)
  state.buffer = ""; state.wait = 0; state.context = Trace([],[])
  return void
end function
function bufferResult(state,name)
  result = "B|"+name+"|"+str(len(state.context.lines))+"|"+str(state.wait)+"|"+encodeHex(state.buffer)
  for each line in state.context.lines result = result+"|"+encodeHex(line) end for
  for each message in state.context.prints result = result+"|P:"+encodeHex(message) end for
  print result; return void
end function

function main(args)
  state = command.create(); state.executeFn = executeCallback; state.printFn = printCallback; state.context = Trace([],[])
  tokenCase(state,"empty","",true); tokenCase(state,"space"," \t\r\n a\tb  c ",true)
  tokenCase(state,"quotes","say \"hello world\" tail",true); tokenCase(state,"adjacent","ab\"cd ef\"gh",true)
  tokenCase(state,"linecomment","a b//ignored c",true); tokenCase(state,"blockcomment","a/* ignored */b / lone",true)
  tokenCase(state,"unterminated_block","a /* missing",true); tokenCase(state,"unterminated_quote","a \"missing tail",true)
  tokenCase(state,"quoted_comments","a \"// x /* y */\" z",true); tokenCase(state,"semicolon","a;b ; c",true)
  tokenCase(state,"slash","/ // stop",true); tokenCase(state,"controls",decode(bytes([97,1,98,31,99])),true)
  tokenCase(state,"signed_char",decode(bytes([97,128,32,98,32,34,99,128,100,34])),true)
  command.tokenizeString(state,"preserved"); tokenCase(state,"null",void,true)
  many = ""; for index = 0 to 1024 many = many+"x " end for; tokenCase(state,"token_limit",many,false)
  tokenCase(state,"command_limit",decode(bytes(8300,113)),false)

  resetBuffer(state); command.addText(state,"echo one;echo \"a;b\"\nlast\rend"); command.execute(state); bufferResult(state,"breaks")
  resetBuffer(state); command.addText(state,"echo \"odd;still\";after"); command.execute(state); bufferResult(state,"quoted_semicolon")
  resetBuffer(state); command.addText(state,"a //comment;hidden\nb /* x;y */;c"); command.execute(state); bufferResult(state,"comment_boundaries")
  resetBuffer(state); command.addText(state,"insert \"first;second\";tail"); command.execute(state); bufferResult(state,"callback_insert")
  resetBuffer(state); command.addText(state,"one;wait 2;two;three"); command.execute(state); command.execute(state); command.execute(state); bufferResult(state,"wait")
  resetBuffer(state); command.addText(state,"foo"); command.addText(state,"bar"); command.execute(state); bufferResult(state,"append_no_newline")
  resetBuffer(state); command.addText(state,"held"); command.executeText(state,command.EXEC_NOW,"direct now"); bufferResult(state,"now_direct")
  command.executeText(state,command.EXEC_NOW,""); bufferResult(state,"now_empty_drains")
  resetBuffer(state); command.executeText(state,command.EXEC_INSERT,"head"); command.executeText(state,command.EXEC_APPEND,"tail"); command.execute(state); bufferResult(state,"execute_modes")
  resetBuffer(state); command.addText(state,decode(bytes(16382,122))); command.addText(state,"x"); command.addText(state,"y"); bufferResult(state,"add_overflow")
  resetBuffer(state); command.insertText(state,decode(bytes(16383,105))); command.insertText(state,""); bufferResult(state,"insert_boundary")
  resetBuffer(state); command.addText(state,decode(bytes(1100,108))+";z"); command.execute(state); bufferResult(state,"long_line_chunks")
  return 0
end function
