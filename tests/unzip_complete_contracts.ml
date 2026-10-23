import mq3.format.unzip as unzip
import mq3.format.deflate as deflate
import std.fs as fs

function req(ok,label) if not ok then return error(7801,"unzip contract: "+label) end if;return 1 end function
function main(args)
  count=0;path=args[0];rawPath=args[1];expectedPath=args[2]
  handle=unzip.unzOpen(path);count=count+req(handle!=void,"open prefixed archive")
  gi=unzip.unzGetGlobalInfo(handle);count=count+req(gi.numberEntry==2 and gi.sizeComment==15,"global info")
  count=count+req(unzip.unzGetGlobalComment(handle,100)=="archive-comment" and unzip.unzGetGlobalComment(handle,7)=="archive","global comment bounds")
  count=count+req(unzip.unzGoToFirstFile(handle)==unzip.UNZ_OK,"first file")
  first=unzip.unzGetCurrentFileInfo(handle);count=count+req(first.name=="stored.txt" and first.compressionMethod==0 and first.comment=="stored-comment" and first.extra==bytes([0x99,0,3,0,7,8,9]),"central metadata")
  date=first.tmuDate;count=count+req(date.tmYear>=1980 and date.tmMon>=0 and date.tmMon<=11,"DOS date")
  firstPosition=unzip.unzGetCurrentFileInfoPosition(handle);count=count+req(firstPosition>0,"central position")
  count=count+req(unzip.unzOpenCurrentFile(handle)==unzip.UNZ_OK and unzip.unzGetLocalExtrafield(handle,99)==bytes([0x98,0,3,0,1,2,3]),"local header and extra")
  part=unzip.unzReadCurrentFile(handle,4);rest=unzip.unzReadCurrentFile(handle,99);count=count+req(decode(part)=="stor" and decode(rest)=="ed payload" and unzip.unztell(handle)==14 and unzip.unzeof(handle)==1,"stored streaming read")
  count=count+req(unzip.unzCloseCurrentFile(handle)==unzip.UNZ_OK and unzip.unzGoToNextFile(handle)==unzip.UNZ_OK,"close and next")
  secondPosition=unzip.unzGetCurrentFileInfoPosition(handle);second=unzip.unzGetCurrentFileInfo(handle);count=count+req(second.name=="deflated.bin" and second.compressionMethod==8 and secondPosition>firstPosition,"deflated metadata")
  count=count+req(unzip.unzOpenCurrentFile(handle)==unzip.UNZ_OK and unzip.unzReadCurrentFile(handle,100000)==fs.readAllBytes(expectedPath) and unzip.unzeof(handle)==1,"deflated read")
  unzip.unzCloseCurrentFile(handle);count=count+req(unzip.unzLocateFile(handle,"STORED.TXT",unzip.UNZ_NOTCASESENSITIVE)==unzip.UNZ_OK and unzip.unzGetCurrentFileInfo(handle).name=="stored.txt","case insensitive locate")
  count=count+req(unzip.unzLocateFile(handle,"STORED.TXT",unzip.UNZ_CASESENSITIVE)==unzip.UNZ_END_OF_LIST_OF_FILE and unzip.unzGetCurrentFileInfo(handle).name=="stored.txt","failed locate restores cursor")
  count=count+req(unzip.unzSetCurrentFileInfoPosition(handle,secondPosition)==unzip.UNZ_OK and unzip.unzGetCurrentFileInfo(handle).name=="deflated.bin","position restore")
  reopened=unzip.unzReOpen(path,handle);count=count+req(reopened!=void and unzip.unzGetCurrentFileInfo(reopened).name=="deflated.bin","reopen preserves cursor")
  count=count+req(unzip.unzClose(reopened)==unzip.UNZ_OK and unzip.unzClose(reopened)==unzip.UNZ_PARAMERROR,"close semantics")
  input=fs.readAllBytes(rawPath);expected=fs.readAllBytes(expectedPath);stream=unzip.inflateInit2_(-15);actual=unzip.inflate(stream,input,len(expected));count=count+req(actual==expected and stream.totalIn==len(input) and stream.totalOut==len(expected),"inflate facade")
  count=count+req(unzip.inflateSyncPoint(stream)==1 and unzip.inflateReset(stream)==unzip.Z_OK and unzip.inflateSyncPoint(stream)==0 and unzip.inflateEnd(stream)==unzip.Z_OK,"inflate lifecycle")
  sync=unzip.inflateInit_();count=count+req(unzip.inflateSync(sync,bytes([3,0,0,255,255,9]))==unzip.Z_OK and unzip.inflateSyncPoint(sync)==1,"inflate synchronization")
  count=count+req(unzip.adler32(1,bytes("Wikipedia"))==300286872,"adler32")
  count=count+req(len(unzip.zcalloc(void,3,7))==21 and unzip.zcfree(void,void)==void,"allocator facade")
  count=count+req(unzip.unzlocal_SearchCentralDir(fs.readAllBytes(path))>0,"central directory search")
  unzip.unzClose(handle)
  print("PASS: "+str(count)+" complete unzip contracts")
end function
