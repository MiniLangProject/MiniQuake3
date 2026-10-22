import mq3.botlib.log as log
import mq3.botlib.lib_variables as libvars

struct Variables variables end struct
struct Context nextHandle closeResult prints opens closes writes flushes end struct
function hostOpen(c,filename,mode) c.opens=c.opens+[[filename,mode]];return c.nextHandle end function
function hostClose(c,handle) c.closes=c.closes+[handle];return c.closeResult end function
function hostWrite(c,handle,text) c.writes=c.writes+[[handle,text]];return len(text) end function
function hostFlush(c,handle) c.flushes=c.flushes+[handle];return 0 end function
function hostPrint(c,severity,text) c.prints=c.prints+[[severity,text]];return 0 end function
function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function fixture(retailActive)
  vars=Variables([]);context=Context(7,0,[],[],[],[],[]);host=log.services();host.context=context;host.openFn=hostOpen;host.closeFn=hostClose;host.writeFn=hostWrite;host.flushFn=hostFlush;host.printFn=hostPrint;return [log.create(vars,host,retailActive),vars,context]
end function
function count(state,kind) n=0;for each action in state.actions if action.kind==kind then n=n+1 end if end for;return n end function
function main(args)
  failures=0;f=fixture(false);state=f[0];vars=f[1];context=f[2]
  failures=failures+req(not log.open(state,"bot.log") and state.handle==0 and len(context.opens)==0,"log libvar disables opening")
  libvars.set(vars,"log","1");failures=failures+req(not log.open(state,"") and context.prints[0]==[log.PRT_MESSAGE,"openlog <filename>\n"],"empty filename usage")
  failures=failures+req(log.open(state,"bot.log") and state.handle==7 and state.filename=="bot.log" and context.opens[0]==["bot.log","wb"],"binary open lifecycle")
  failures=failures+req(context.prints[1]==[log.PRT_MESSAGE,"Opened log bot.log\n"] and count(state,"open")==1,"open notification and typed boundary")
  failures=failures+req(not log.open(state,"other.log") and context.prints[2]==[log.PRT_ERROR,"log file bot.log is already opened\n"],"duplicate open error")
  failures=failures+req(log.filePointer(state)==7,"file pointer exposes handle")
  failures=failures+req(log.format("%s %4d %04d",[log.stringArg("x"),log.intArg(7),log.intArg(-3)])=="x    7 -003","string and integer widths")
  failures=failures+req(log.format("%u %x %X",[log.intArg(-1),log.intArg(48879),log.intArg(48879)])=="4294967295 beef BEEF","unsigned and hexadecimal formats")
  failures=failures+req(log.format("%c %% %p",[log.intArg(65),log.pointerArg(0x1234)])=="A % 0000000000001234","character percent and pointer formats")
  failures=failures+req(log.format("%f %1.1f",[log.floatArg(1.5),log.floatArg(1.26)])=="1.500000 1.3","native promoted-float formatting")
  failures=failures+req(try(log.format("%d",[])) is error and try(log.format("",[log.intArg(1)])) is error,"format arity errors")
  beforeFlush=state.flushes;failures=failures+req(log.write(state,"area %d",[log.intArg(12)]) and state.content=="area 12" and state.flushes==beforeFlush+1,"formatted write and immediate flush")
  failures=failures+req(context.writes[0]==[7,"area 12"] and count(state,"write")==1,"write host boundary")
  state.time=3661.25;failures=failures+req(log.writeTimeStamped(state," step %d",[log.intArg(9)]) and state.content=="area 120   01:61:3661:25    step 9\r\n","original total-minute/second timestamp")
  failures=failures+req(state.numwrites==1 and state.flushes==beforeFlush+2,"timestamp counter and flush")
  failures=failures+req(log.logFlush(state) and state.flushes==beforeFlush+3,"explicit flush")
  context.closeResult=1;failures=failures+req(not log.close(state) and state.handle==7 and context.prints[len(context.prints)-1]==[log.PRT_ERROR,"can't close log file bot.log\n"],"close failure retains live file")
  context.closeResult=0;failures=failures+req(log.close(state) and state.handle==0 and context.prints[len(context.prints)-1]==[log.PRT_MESSAGE,"Closed log bot.log\n"],"successful close")
  failures=failures+req(not log.close(state) and not log.logFlush(state),"closed close and flush are silent")
  failures=failures+req(log.open(state,"second.log") and state.numwrites==1 and state.content=="","wb truncates content while write counter persists across reopen")
  failures=failures+req(log.shutdown(state) and state.handle==0,"shutdown closes open log")
  failures=failures+req(not log.shutdown(state),"shutdown without log is silent")
  failure=fixture(false);libvars.set(failure[1],"log","1");failure[2].nextHandle=0;failures=failures+req(not log.open(failure[0],"bad.log") and failure[2].prints[0]==[log.PRT_ERROR,"can't open the log file bad.log\n"],"open failure notification")
  missing=log.create(failure[1],log.services(),false);failures=failures+req(try(log.open(missing,"bad.log")) is error,"production open service required")
  suppressed=fixture(true);libvars.set(suppressed[1],"log","1");failures=failures+req(log.open(suppressed[0],"test.log") and suppressed[0].handle==1 and not suppressed[0].actions[0].dispatched,"suppressible deterministic open")
  failures=failures+req(log.write(suppressed[0],"ok",[]) and suppressed[0].content=="ok" and not suppressed[0].actions[len(suppressed[0].actions)-1].dispatched,"suppressible write and flush")
  failures=failures+req(log.close(suppressed[0]) and suppressed[0].handle==0,"suppressible close")
  closed=fixture(false);failures=failures+req(not log.write(closed[0],"%d",[]) and len(closed[0].actions)==0,"closed write ignores invalid format")
  if failures!=0 then return failures end if;print("PASS: 28 native botlib l_log contracts (7 symbols)");return 0
end function
