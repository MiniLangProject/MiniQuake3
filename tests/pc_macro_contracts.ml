import mq3.vm.pc_parser as pc

struct Files text end struct
function load(files,name) if name=="macros.menu" then return bytes(files.text) end if;return void end function
function req(ok,message) if not ok then return error(7695,message) end if;return 1 end function
function collect(registry,handle)
  result=[];types=[]
  while true token=pc.read(registry,handle);if token is error then return token end if;if token==void then return [result,types] end if;result=result+[token.text];types=types+[token.type] end while
end function
function parse(text)
  files=Files(text);registry=pc.create(files,load);handle=pc.load(registry,"macros.menu");return collect(registry,handle)
end function

function main(args)
  count=0
  source="#define ADD(a,b) a + b\n#define WRAP(x) [ x ]\n#define FIRST(a,b) a\n#define STR(x) # x\n#define CAT(a,b) a ## b\n#define TWICE(x) ADD(x,x)\n#define EMPTY_FN(x)\n#define OBJ 9\n#define CHAIN(x) OBJ + x\nADD(2,3) WRAP((1 + 2)) FIRST(call(1,2),tail) STR(hello + world) STR(\"quoted\") CAT(shader,42) TWICE(5) EMPTY_FN(gone) CHAIN(1) ADD\n"
  parsed=parse(source);count=count+req(not (parsed is error),"function macro source parses")
  expected=["2","+","3","[","(","1","+","2",")","]","call","(","1",",","2",")","hello+world","\"quoted\"","shader42","5","+","5","9","+","1","ADD"]
  count=count+req(parsed[0]==expected,"arguments, nesting, recursive expansion and empty replacement")
  count=count+req(parsed[1][16]==pc.TT_STRING and parsed[1][17]==pc.TT_STRING and parsed[1][18]==pc.TT_NAME,"stringification and token-paste types")

  conditional=parse("#define ADD(a,b) a + b\n#define TWICE(x) ADD(x,x)\n#define GROUP (2 + 3)\n#if TWICE(3) == 6 && ADD(2,(1 + 2)) == 5 && GROUP == 5\ncondition_true\n#endif\n");count=count+req(conditional[0]==["condition_true"],"function macros recurse in #if while spaced parentheses stay object macros")
  chained=parse("#define A(x) B(x)\n#define B(x) x * 2\nA(4)\n");count=count+req(chained[0]==["4","*","2"],"function macro chain expands recursively")
  zero=parse("#define NOW() ready\nNOW()\n");count=count+req(zero[0]==["ready"],"zero-argument function macro")
  stringMerge=parse("#define JOIN(a,b) a ## b\nJOIN(\"left\",\"right\")\n");count=count+req(stringMerge[0]==["leftright"] and stringMerge[1]==[pc.TT_STRING],"string token merge")

  bad=try(parse("#define PAIR(a,b) a b\nPAIR(1,2,3)\n"));count=count+req(bad is error,"too many macro arguments rejected")
  bad=try(parse("#define OPEN(a) a\nOPEN((1 + 2)\n"));count=count+req(bad is error,"unterminated macro invocation rejected")
  registry=pc.create(Files(""),load);count=count+req(pc.addDefine(registry,"DUP(a,a) a")==0,"duplicate parameters rejected")
  count=count+req(pc.addDefine(registry,"BROKEN(a) ## a")==0 and pc.addDefine(registry,"BROKEN2(a) a ##")==0,"edge token paste rejected")
  print("PASS: "+str(count)+" PC macro contracts");return 0
end function
