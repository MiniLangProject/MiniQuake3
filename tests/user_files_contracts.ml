// SPDX-License-Identifier: GPL-2.0-or-later
// Run in an isolated directory. "reopen" is a second process, not a new Store
// in the writer process, so success requires actual on-disk persistence.
import mq3.engine.user_files as files
function require(ok,label) if not ok then return error(7795,label) end if;return 1 end function
function main(args)
  if len(args)!=2 then return error(7795,"isolated home and phase required") end if
  store=files.create(void,args[0]);count=0
  if args[1]=="reopen" then
    opened=files.open(store,"durable.dat",0)
    count=count+require(opened.handle>0 and opened.length==7,"second process opens saved file")
    count=count+require(decode(files.read(store,opened.handle,100))=="persist","second process reads durable bytes")
    files.close(store,opened.handle)
    print("PASS: "+str(count)+" cross-process user-file contracts");return 0
  end if
  if args[1]!="exercise" then return error(7795,"unknown phase") end if
  opened=files.open(store,"nested/probe.dat",1)
  count=count+require(opened.handle>0,"open writable file")
  count=count+require(files.write(store,opened.handle,bytes("hello"))==5,"write reports accepted bytes")
  count=count+require(files.seek(store,opened.handle,8,2)==0,"absolute seek beyond EOF")
  count=count+require(files.write(store,opened.handle,bytes("!"))==1,"write after seek")
  files.close(store,opened.handle)
  input=files.open(store,"nested/probe.dat",0);data=files.read(store,input.handle,20)
  count=count+require(len(data)==9 and decode(slice(data,0,5))=="hello" and data[5]==0 and data[7]==0 and data[8]==33,"seek gap is zero filled")
  count=count+require(files.seek(store,input.handle,-1,1)==0 and decode(files.read(store,input.handle,1))=="!","end-relative read")
  count=count+require(files.seek(store,input.handle,-100,0)==-1,"negative seek rejected")
  count=count+require(files.write(store,input.handle,bytes("x"))==0,"read handle cannot write")
  files.close(store,input.handle)
  // Duplicate path spellings must be rejected before the file is truncated.
  append=files.open(store,"nested/probe.dat",3)
  duplicate=files.open(store,"NESTED/PROBE.DAT",1)
  count=count+require(duplicate.handle==0,"case-equivalent writer rejected")
  duplicate=files.open(store,"nested\\probe.dat",1)
  count=count+require(duplicate.handle==0,"separator-equivalent writer rejected")
  count=count+require(len(files.readUser(store,"nested/probe.dat"))==9,"duplicate attempts preserve existing data")
  count=count+require(files.seek(store,append.handle,0,2)==0,"seek accepted on append handle")
  count=count+require(files.write(store,append.handle,bytes("x"))==1,"append-sync write succeeds")
  data=files.readUser(store,"nested/probe.dat")
  count=count+require(len(data)==10 and data[0]==104 and data[9]==120,"append-sync ignores seek for writes and flushes")
  files.close(store,append.handle)
  append=files.open(store,"nested/probe.dat",2);files.seek(store,append.handle,1,2)
  count=count+require(files.write(store,append.handle,bytes("y"))==1,"buffered append write succeeds")
  files.close(store,append.handle);data=files.readUser(store,"nested/probe.dat")
  count=count+require(len(data)==11 and data[0]==104 and data[10]==121,"buffered append also ignores seek")
  empty=files.open(store,"empty.dat",1);files.seek(store,empty.handle,12345,2)
  count=count+require(files.write(store,empty.handle,bytes(0,0))==0,"zero-byte write returns zero")
  files.close(store,empty.handle)
  count=count+require(len(files.readUser(store,"empty.dat"))==0,"zero-byte write does not extend file")
  unicode=files.open(store,"nested/Grüße.dat",1)
  count=count+require(unicode.handle>0 and files.write(store,unicode.handle,bytes("utf8"))==4,"Unicode path writes through actual Windows boundary")
  duplicate=files.open(store,"NESTED/GRÜßE.DAT",1)
  count=count+require(duplicate.handle==0,"Windows Unicode case-equivalent writer rejected")
  files.close(store,unicode.handle)
  count=count+require(decode(files.readUser(store,"nested/Grüße.dat"))=="utf8","Unicode data read back by MiniLang")
  for each name in ["../escape","nested/../../escape","/absolute","C:/absolute","secret:ads","NUL","CON.txt","dir/LPT1.txt","trailing.","trailing ","bad//path"]
    rejected=files.open(store,name,1);count=count+require(rejected.handle==0,"unsafe qpath rejected: "+name)
  end for
  count=count+require(files.open(store,"mode.dat",-1).handle==0 and files.open(store,"mode.dat",4).handle==0,"invalid modes rejected")
  durable=files.open(store,"durable.dat",1);files.write(store,durable.handle,bytes("persist"));files.close(store,durable.handle)
  handles=array(63,0)
  for index=0 to 62
    opened=files.open(store,"durable.dat",0);count=count+require(opened.handle==index+1,"bounded distinct read handle");handles[index]=opened.handle
  end for
  count=count+require(files.open(store,"durable.dat",0).handle==0,"handle exhaustion fails without overwrite")
  for each handle in handles files.close(store,handle) end for
  reopened=files.open(store,"durable.dat",0);count=count+require(reopened.handle==1,"closed handle slot is reusable");files.close(store,reopened.handle)
  files.closeAll(store)
  print("PASS: "+str(count)+" user-file contracts");return 0
end function
