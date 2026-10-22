import mq3.game.bg_lib as lib

function require(ok,label) if not ok then return error(7991,"bg_lib contract: "+label) end if;return 1 end function
function compareInt(left,right) if left<right then return -1 end if;if left>right then return 1 end if;return 0 end function
function near(left,right,tolerance) return lib.fabs(left-right)<=tolerance end function
function main(args)
  checks=0
  checks=checks+require(lib.strlen("quake")==5 and lib.strlen(bytes("ab\0cd"))==2,"strlen")
  joined=lib.strcat(bytes("id\0"),"tech");checks=checks+require(decode(slice(joined,0,lib.strlen(joined)))=="idtech","strcat")
  copied=lib.strcpy(bytes(2,0),"arena");checks=checks+require(lib.strlen(copied)==5 and decode(slice(copied,0,5))=="arena","strcpy")
  checks=checks+require(lib.strcmp("abc","abc")==0 and lib.strcmp("abc","abd")<0 and lib.strcmp("abd","abc")>0,"strcmp")
  checks=checks+require(lib.strchr("arena",101)==2 and lib.strchr("arena",0)==-1 and lib.strchr("arena",120)==-1,"strchr")
  checks=checks+require(lib.strstr("miniquake","quake")==4 and lib.strstr("abc","z")==-1 and lib.strstr("","")==-1,"strstr")
  checks=checks+require(lib.tolower(65)==97 and lib.tolower(33)==33 and lib.toupper(122)==90 and lib.toupper(33)==33,"case conversion")
  moved=bytes("abcdef\0");lib.memmove(moved,1,moved,0,5);checks=checks+require(decode(slice(moved,0,6))=="aabcde","overlap-safe memmove")
  random=lib.randomState(0);lib.srand(random,1);r1=lib.rand(random);r2=lib.rand(random);r3=lib.rand(random);checks=checks+require(r1==3534 and r2==1015 and r3==14284,"srand/rand 32-bit LCG")
  checks=checks+require(near(lib.atof(" -12.75e9"),-12.75,0.00001) and near(lib.atof(".5"),0.5,0.00001),"atof no exponent")
  parsed=lib._atof("  4.25!rest",0);checks=checks+require(near(parsed.value,4.25,0.00001) and parsed.next==7,"_atof cursor consumes terminator")
  leading=lib._atof(".5",0);checks=checks+require(leading.value==0.0 and leading.next==0,"_atof original leading-dot bug")
  checks=checks+require(lib.atoi(" -123x")==-123 and lib.atoi("+0")==0,"atoi")
  parsedInt=lib._atoi(" 77,9",0);checks=checks+require(parsedInt.value==77 and parsedInt.next==4,"_atoi cursor consumes terminator")
  checks=checks+require(lib.abs(-17)==17 and lib.abs(4)==4 and lib.fabs(-2.5)==2.5,"abs/fabs")
  checks=checks+require(lib.AddInt(-42,6,lib.ZEROPAD)=="000-42" and lib.AddInt(12,4,lib.LADJUST)=="12  ","AddInt flags")
  checks=checks+require(lib.AddFloat(-0.25,2,3)=="-0.250" and lib.AddFloat(2.99,0,1)=="2.9","AddFloat truncation")
  checks=checks+require(lib.AddString("abcdef",8,3)=="abc     " and lib.AddString(void,0,-1)=="(null)","AddString precision/null")
  formatted=lib.vsprintf("%05d|%-4d|%.3s|%6.2f|%c|%%",[-7,12,"abcdef",3.25,65]);checks=checks+require(formatted.text=="000-7|12  |abc|     3.25|A|%" and formatted.count==len(bytes(formatted.text)),"vsprintf subset")
  scanned=lib.sscanf("12 3.5","%d %f");checks=checks+require(scanned.count==0 and scanned.values[0]==12 and near(scanned.values[1],3.5,0.00001),"sscanf values and original zero-count bug")
  values=[5,1,3,3,9,0,-2,8,7,6,4,2];lib.qsort(values,len(values),compareInt);checks=checks+require(values==[-2,0,1,2,3,3,4,5,6,7,8,9],"qsort Bentley/McIlroy ordering")
  prefix=[4,2,3,1,99];lib.qsort(prefix,4,compareInt);checks=checks+require(prefix==[1,2,3,4,99],"qsort element count")
  disabled=lib.disabledIf0Symbols();checks=checks+require(len(disabled)==10 and disabled[0]=="floor" and disabled[9]=="atan2","explicit #if 0 inventory")
  checks=checks+require(lib.floor(3.9)==3 and lib.floor(-3.2)==-4,"disabled floor translation")
  memory=bytes(8,1);lib.memset(memory,2,65,3);checks=checks+require(memory[0]==1 and memory[2]==65 and memory[4]==65 and memory[5]==1,"disabled memset translation")
  source=bytes([1,2,3,4]);target=bytes(4,0);lib.memcpy(target,0,source,0,4);checks=checks+require(target==source,"disabled memcpy translation")
  target=bytes(6,88);lib.strncpy(target,0,"ab",5);checks=checks+require(target[0]==97 and target[1]==98 and target[2]==0 and target[4]==0 and target[5]==88,"disabled strncpy translation")
  checks=checks+require(near(lib.sqrt(9.0),3.0,0.01) and lib.sqrt(-1.0)==0.0,"disabled sqrt translation")
  checks=checks+require(near(lib.sin(lib.PI/2.0),1.0,0.000001) and near(lib.cos(0.0),1.0,0.000001),"disabled sin/cos translation")
  checks=checks+require(near(lib.acos(0.0),lib.PI/2.0,0.000001) and near(lib.atan2(1.0,0.0),lib.PI/2.0,0.000001),"disabled acos/atan2 translation")
  table=lib.create_acostable();checks=checks+require(len(table)==1024 and near(table[512],lib.PI/2.0,0.000001),"disabled create_acostable translation")
  checks=checks+require(near(lib.tan(lib.PI/4.0),1.0,0.000001),"active tan")
  checks=checks+require(try(lib.memmove(bytes(2,0),1,bytes(2,0),0,2)) is error,"safe memory range contract")
  print("PASS: "+str(checks)+" native bg_lib contracts (33 ledger symbols + qsort)");return 0
end function
