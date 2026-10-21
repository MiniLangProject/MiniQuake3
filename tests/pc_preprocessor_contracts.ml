import mq3.vm.pc_parser as pc

struct Files main included end struct
function load(files,name)
  if name=="conditions.menu" then return bytes(files.main) end if
  if name=="included.menu" then return bytes(files.included) end if
  return void
end function
function req(ok,message) if not ok then return error(7694,message) end if;return 1 end function
function collect(registry,handle)
  result=[]
  while true token=pc.read(registry,handle);if token is error then return token end if;if token==void then return result end if;result=result+[token.text] end while
end function
function parseText(text)
  files=Files(text,"");registry=pc.create(files,load);handle=pc.load(registry,"conditions.menu");return collect(registry,handle)
end function
function quotedClock(text)
  data=bytes(text);return len(data)==10 and data[0]==34 and data[3]==58 and data[6]==58 and data[9]==34
end function
function quotedDate(text)
  data=bytes(text);return len(data)==13 and data[0]==34 and data[4]==32 and data[7]==32 and data[12]==34
end function

function main(args)
  count=0
  source="#define ENABLE 1\n#define MASK 4\n#if defined(ENABLE) && ((MASK << 1) == 8) && !defined(MISSING)\nif_true\n#else\nif_false\n#endif\n#ifndef MISSING\nifndef_true\n#endif\n#ifdef MISSING\nbad_ifdef\n#elif (3 * 4 + 2 == 14) && ((9 % 4) == 1)\nelif_true\n#else\nbad_else\n#endif\n#if 0\nbad_outer\n#if 1\nbad_nested\n#endif\n#else\nouter_else\n#endif\n#define EMPTY\n#ifdef EMPTY\nempty_defined\n#endif\n#undef EMPTY\n#ifndef EMPTY\nundef_true\n#endif\n#if 1\nselected\n#elif 1 / 0\nbad_unreached_elif\n#endif\n#if 0 ? 11 : 2\nternary_true\n#endif\n"
  files=Files(source,"#if ENABLE\ninclude_true\n#else\ninclude_false\n#endif\n");registry=pc.create(files,load);count=count+req(pc.addDefine(registry,"GLOBAL 3")==1,"global integer macro")
  handle=pc.load(registry,"conditions.menu");tokens=collect(registry,handle);count=count+req(not (tokens is error),"conditional source parses")
  count=count+req(tokens==["if_true","ifndef_true","elif_true","outer_else","empty_defined","undef_true","selected","ternary_true"],"conditional branches and precedence")
  count=count+req(pc.free(registry,handle)==1,"conditional source closes")

  includeText="#define ENABLE 1\n#if GLOBAL == 3\n#include \"included.menu\"\n#endif\nafter_include\n"
  files=Files(includeText,"#ifdef ENABLE\ninclude_true\n#else\ninclude_false\n#endif\n");registry=pc.create(files,load);pc.addDefine(registry,"GLOBAL 3");handle=pc.load(registry,"conditions.menu");tokens=collect(registry,handle)
  count=count+req(tokens==["include_true","after_include"],"conditional include keeps source-local pending tokens")

  value=try(parseText("#else\nbad\n"));count=count+req(value is error,"orphan else rejected")
  value=try(parseText("#if 1\nunterminated\n"));count=count+req(value is error,"missing endif rejected at EOF")
  value=try(parseText("#if defined()\nbad\n#endif\n"));count=count+req(value is error,"malformed defined rejected")
  value=try(parseText("#if 4 / 0\nbad\n#endif\n"));count=count+req(value is error,"integer divide by zero rejected")
  value=try(parseText("#if 1\nyes\n#else\nno\n#else\nbad\n#endif\n"));count=count+req(value is error,"duplicate else rejected")
  value=parseText("#if 1 + 2 * 3 == 7 && (8 >> 2) == 2 && (5 & 1)\nprecedence\n#endif\n");count=count+req(value==["precedence"],"integer operator precedence")
  value=parseText("#if (0 && 1) || (1 || 0)\nlogical\n#endif\n");count=count+req(value==["logical"],"logical operators consume both operands")
  value=try(parseText("#if UNKNOWN\nbad\n#endif\n"));count=count+req(value is error,"undefined expression name rejected like l_precomp")
  builtins="#ifdef __LINE__\nbuiltin_defined\n#endif\n#undef __LINE__\n#ifdef __LINE__\nstill_defined\n#endif\n#if __LINE__ == 8\nbuiltin_line_expression\n#endif\n#define PAIR 40 \\\n+ 2\n#if PAIR == 42\ncontinued\n#endif\n#include <included.menu>\n__LINE__ __FILE__ __DATE__ __TIME__\n"
  files=Files(builtins,"inside __FILE__ __LINE__\n");registry=pc.create(files,load);handle=pc.load(registry,"conditions.menu")
  count=count+req(pc.read(registry,handle).text=="builtin_defined" and pc.read(registry,handle).text=="still_defined","fixed builtins survive undef and satisfy ifdef")
  count=count+req(pc.read(registry,handle).text=="builtin_line_expression","line builtin expands inside conditional expressions")
  count=count+req(pc.read(registry,handle).text=="continued","backslash continues a define onto the next physical line")
  count=count+req(pc.read(registry,handle).text=="inside","angle include loads its joined path")
  file=pc.read(registry,handle);line=pc.read(registry,handle);count=count+req(file.text=="included.menu" and file.type==pc.TT_NAME and line.intValue==1,"included file and line builtins use active script")
  line=pc.read(registry,handle);file=pc.read(registry,handle);date=pc.read(registry,handle);clock=pc.read(registry,handle)
  count=count+req(line.intValue==17 and line.type==pc.TT_NUMBER and line.subtype==(pc.TT_DECIMAL|pc.TT_INTEGER),"line builtin preserves physical source line")
  count=count+req(file.text=="conditions.menu" and file.type==pc.TT_NAME,"file builtin returns base script after include pop")
  count=count+req(date.type==pc.TT_NAME and quotedDate(date.text),"date builtin follows quoted ctime field layout")
  count=count+req(clock.type==pc.TT_NAME and quotedClock(clock.text),"time builtin follows quoted HH:MM:SS layout")
  count=count+req(pc.read(registry,handle)==void,"extended source reaches EOF")
  value=try(parseText("#define __FILE__ nope\n"));count=count+req(value is error,"fixed builtin redefinition rejected")
  print("PASS: "+str(count)+" PC preprocessor contracts");return 0
end function
