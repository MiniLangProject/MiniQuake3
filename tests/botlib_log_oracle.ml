import mq3.botlib.log as log
import mq3.botlib.lib_variables as libvars

struct Variables variables end struct
struct Context nextHandle closeResult prints opens closes writes flushes end struct
function hostOpen(context,filename,mode) context.opens=context.opens+[[filename,mode]];if filename=="missing/path/log.txt" then return 0 end if;return context.nextHandle end function
function hostClose(context,handle) context.closes=context.closes+[handle];return context.closeResult end function
function hostWrite(context,handle,text) context.writes=context.writes+[[handle,text]];return len(text) end function
function hostFlush(context,handle) context.flushes=context.flushes+[handle];return 0 end function
function hostPrint(context,severity,text) context.prints=context.prints+[[severity,text]];return 0 end function
function last(context) if len(context.prints)==0 then return [0,""] end if;return context.prints[len(context.prints)-1] end function
function bit(value) if value then return 1 end if;return 0 end function
function line(value) data=bytes(value);if len(data)>0 and data[len(data)-1]==10 then return decode(slice(data,0,len(data)-1)) end if;return value end function
function escaped(value) result="";for each b in bytes(value) if b==13 then result=result+"<r>" else if b==10 then result=result+"<n>" else result=result+decode(bytes([b])) end if end for;return result end function
function main(args)
  vars=Variables([]);context=Context(7,0,[],[],[],[],[]);host=log.services();host.context=context;host.openFn=hostOpen;host.closeFn=hostClose;host.writeFn=hostWrite;host.flushFn=hostFlush;host.printFn=hostPrint;state=log.create(vars,host,false)
  log.open(state,"oracle_log.tmp");print("disabled|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints)))
  libvars.set(vars,"log","1");context.prints=[];log.open(state,"");item=last(context);print("empty|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints))+"|"+str(item[0])+"|"+line(item[1]))
  context.prints=[];log.open(state,"oracle_log.tmp");item=last(context);print("open|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints))+"|"+str(item[0])+"|"+line(item[1]))
  context.prints=[];log.open(state,"other.tmp");item=last(context);print("duplicate|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints))+"|"+str(item[0])+"|"+line(item[1]))
  log.write(state,"value=%4d name=%s float=%1.1f ptr=%p",[log.intArg(7),log.stringArg("bot"),log.floatArg(1.26),log.pointerArg(0x1234)]);state.time=3661.25;log.writeTimeStamped(state," step %d",[log.intArg(9)]);log.logFlush(state);print("pointer|"+str(bit(log.filePointer(state)!=0)))
  context.prints=[];log.close(state);item=last(context);print("close|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints))+"|"+str(item[0])+"|"+line(item[1]));print("file|"+escaped(state.content))
  context.prints=[];log.shutdown(state);print("shutdown|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints)))
  context.prints=[];log.open(state,"missing/path/log.txt");item=last(context);print("failure|"+str(bit(log.filePointer(state)!=0))+"|"+str(len(context.prints))+"|"+str(item[0])+"|"+line(item[1]));return 0
end function
