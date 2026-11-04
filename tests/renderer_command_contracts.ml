import mq3.renderer.command_queue as commands

struct Context events end struct
function req(ok,message) if not ok then return error(7261,message) end if;return 1 end function
function shader(context,handle) return "shader:"+str(handle) end function
function set2D(context) context.events=context.events+[["2d"]] end function
function endSurface(context) context.events=context.events+[["end"]] end function
function beginSurface(context,shader,fog) context.events=context.events+[["begin",shader,fog]] end function
function quad(context,shader,vertices,texcoords,indexes,color) context.events=context.events+[["quad",shader,vertices,texcoords,indexes,color]] end function
function drawBuffer(context,buffer) context.events=context.events+[["buffer",buffer]] end function
function clear(context,r,g,b,a) context.events=context.events+[["clear",r,g,b,a]] end function
function finish(context) context.events=context.events+[["finish"]] end function
function endFrame(context) context.events=context.events+[["frame"]] end function
function diagnostic(context,kind,value) context.events=context.events+[["diag",kind,value]] end function

function main(args)
  count=0;q=commands.create(shader,void)
  count=count+req(q.used==0 and q.commands==[] and q.registered,"empty registered queue")
  count=count+req(commands.setColor(q,void),"default color queued")
  count=count+req(q.used==commands.SET_COLOR_BYTES and q.commands[0].values==[1.0,1.0,1.0,1.0],"default white and byte size")
  count=count+req(commands.stretchPic(q,10.0,20.0,30.0,40.0,0.1,0.2,0.8,0.9,7),"stretch queued")
  count=count+req(q.commands[1].shader=="shader:7" and q.used==60,"shader resolution and stretch size")
  count=count+req(commands.drawBuffer(q,1029) and commands.swapBuffers(q),"frame commands queued")
  count=count+req(q.used==72 and len(q.commands)==4,"command accounting")
  context=Context([]);host=commands.Services(set2D,endSurface,beginSurface,quad,drawBuffer,clear,finish,endFrame,diagnostic,context);state=commands.backend(host)
  state.clearOnDrawBuffer=true
  count=count+req(commands.execute(state,q)==4,"all commands executed")
  count=count+req(state.color2D==[255,255,255,255],"backend byte color")
  count=count+req(context.events[1]==["2d"] and context.events[2]==["begin","shader:7",0],"2D and surface begin order")
  draw=context.events[3]
  count=count+req(draw[0]=="quad" and draw[2]==[[10.0,20.0,0.0],[40.0,20.0,0.0],[40.0,60.0,0.0],[10.0,60.0,0.0]],"quad positions")
  count=count+req(draw[3]==[[0.1,0.2],[0.8,0.2],[0.8,0.9],[0.1,0.9]],"quad texture coordinates")
  count=count+req(draw[4]==[3,0,2,2,0,1] and draw[5]==[255,255,255,255],"quad indexes and color")
  count=count+req(context.events[4]==["buffer",1029] and context.events[5]==["clear",1.0,0.0,0.5,1.0],"draw buffer and debug clear")
  count=count+req(context.events[6]==["end"] and context.events[7]==["finish"] and context.events[8]==["frame"],"swap flush order")
  count=count+req(not state.projection2D and state.numIndexes==0 and not state.finishCalled,"swap preserves finish flag like Baseq3")
  q2=commands.create(void,void);commands.setColor(q2,[0.5,0.25,0.0,1.0]);commands.stretchPic(q2,0.0,0.0,2.0,3.0,0.0,0.0,1.0,1.0,"a");commands.stretchPic(q2,2.0,3.0,4.0,5.0,0.0,0.0,1.0,1.0,"a");commands.stretchPic(q2,1.0,1.0,1.0,1.0,0.0,0.0,1.0,1.0,"b")
  context.events=[];state=commands.backend(host);commands.execute(state,q2)
  count=count+req(state.color2D==[127,63,0,255],"C-compatible truncating color conversion")
  count=count+req(context.events[3][4]==[3,0,2,2,0,1] and context.events[4][4]==[7,4,6,6,4,5],"batched quad index bases")
  count=count+req(context.events[5]==["end"] and context.events[6]==["begin","b",0],"shader change flushes")
  q3=commands.create(void,void);q3.used=commands.MAX_RENDER_COMMANDS-commands.END_COMMAND_BYTES-commands.DRAW_BUFFER_BYTES
  count=count+req(commands.drawBuffer(q3,1),"last fitting allocation")
  count=count+req(not commands.swapBuffers(q3) and len(q3.commands)==1,"ordinary overflow drops command")
  count=count+req(try(commands.allocate(q3,commands.MAX_RENDER_COMMANDS)) is error,"oversized allocation is fatal")
  count=count+req(try(commands.allocate(q3,0)) is error,"zero allocation rejected")
  q3.registered=false
  count=count+req(not commands.setColor(q3,void) and not commands.stretchPic(q3,0,0,0,0,0,0,0,0,0),"unregistered renderer ignores commands")
  count=count+req(try(commands.setColor(commands.create(void,void),[1.0])) is error,"color arity checked")
  bad=commands.create(void,void);bad.commands=[commands.Command(99,4,[],void)]
  count=count+req(try(commands.execute(commands.backend(void),bad)) is error,"unknown backend command rejected")
  commands.reset(q)
  count=count+req(q.used==0 and q.commands==[],"queue reset")
  fast=commands.createFast(void,void,2)
  for index=0 to 99 commands.stretchPic(fast,index,0,1,1,0,0,1,1,index) end for
  count=count+req(commands.count(fast)==100 and fast.commands==[],"fast queue accumulates without per-command array materialization")
  fastCommands=commands.snapshot(fast);count=count+req(len(fastCommands)==100 and fastCommands[0].shader==0 and fastCommands[99].shader==99,"fast queue materializes one ordered legacy command array")
  commands.reset(fast);count=count+req(commands.count(fast)==0 and commands.snapshot(fast)==[],"fast queue reset clears list and snapshot")
  count=count+req(commands.RC_END_OF_LIST==0 and commands.RC_SET_COLOR==1 and commands.RC_STRETCH_PIC==2 and commands.RC_DRAW_BUFFER==4 and commands.RC_SWAP_BUFFERS==5,"command ABI values")
  count=count+req(commands.MAX_RENDER_COMMANDS==262144 and commands.END_COMMAND_BYTES==4,"Baseq3 command capacity")
  print("PASS: "+str(count)+" renderer-command contracts")
  return 0
end function
