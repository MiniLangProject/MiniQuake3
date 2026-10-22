import mq3.game.bg_lib as lib

function main(args)
  a=lib.strcat(bytes("quake\0"),"3");b=lib.strcpy(bytes(32,0),"bot");print("strings:"+str(lib.strlen(a))+","+decode(slice(a,0,lib.strlen(a)))+","+decode(slice(b,0,lib.strlen(b)))+","+str(lib.strcmp("abc","abd"))+","+str(lib.strchr("arena",101))+","+str(lib.strstr("miniquake","quake"))+","+str(lib.tolower(81))+","+str(lib.toupper(97)))
  move=bytes("abcdef\0");lib.memmove(move,1,move,0,5);print("move:"+decode(slice(move,0,lib.strlen(move))))
  random=lib.randomState(0);lib.srand(random,1);first=lib.rand(random);second=lib.rand(random);third=lib.rand(random);print("rand:"+str(third)+","+str(second)+","+str(first))
  scan=" -12.75x";parsedFloat=lib._atof(scan,0);parsedInt=lib._atoi(" -42!",0);print("numbers:"+lib.AddFloat(lib.atof(scan),0,8)+","+str(lib.atoi(" +314z"))+","+lib.AddFloat(parsedFloat.value,0,8)+","+str(parsedFloat.next)+","+str(parsedInt.value)+","+str(parsedInt.next)+","+str(lib.abs(-7))+","+lib.AddFloat(lib.fabs(-2.5),0,1))
  print("addint:"+lib.AddInt(-42,6,lib.ZEROPAD));print("left:"+lib.AddInt(17,5,lib.LADJUST));print("float:"+lib.AddFloat(-12.375,6,3));print("string:"+lib.AddString("abcdef",8,3));return 0
end function
