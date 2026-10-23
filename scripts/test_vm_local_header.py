#!/usr/bin/env python3
"""Exact ABI and productive ownership gate for qcommon/vm_local.h."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

OPCODES=['OP_UNDEF','OP_IGNORE','OP_BREAK','OP_ENTER','OP_LEAVE','OP_CALL','OP_PUSH','OP_POP','OP_CONST','OP_LOCAL','OP_JUMP','OP_EQ','OP_NE','OP_LTI','OP_LEI','OP_GTI','OP_GEI','OP_LTU','OP_LEU','OP_GTU','OP_GEU','OP_EQF','OP_NEF','OP_LTF','OP_LEF','OP_GTF','OP_GEF','OP_LOAD1','OP_LOAD2','OP_LOAD4','OP_STORE1','OP_STORE2','OP_STORE4','OP_ARG','OP_BLOCK_COPY','OP_SEX8','OP_SEX16','OP_NEGI','OP_ADD','OP_SUB','OP_DIVI','OP_DIVU','OP_MODI','OP_MODU','OP_MULI','OP_MULU','OP_BAND','OP_BOR','OP_BXOR','OP_BCOM','OP_LSH','OP_RSHI','OP_RSHU','OP_NEGF','OP_ADDF','OP_SUBF','OP_DIVF','OP_MULF','OP_CVIF','OP_CVFI']

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/vm_local_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/qcommon/vm_local.h';port=ROOT/'src/mq3/vm/abi.ml'
 original=header.read_text(encoding='latin1');native=port.read_text(encoding='utf-8')
 missing=[name for name in OPCODES if not re.search(r'\b'+name+r'\b',original) or not re.search(r'\bconst\s+'+name+r'=',native)]
 for name in ['vmSymbol_t','vm_s','VM_OFFSET_PROGRAM_STACK','VM_OFFSET_SYSTEM_CALL','VM_Compile','VM_CallCompiled','VM_PrepareInterpreter','VM_CallInterpreted','VM_ValueToFunctionSymbol','VM_SymbolToValue','VM_ValueToSymbol','VM_LogSyscalls']:
  if not re.search(r'\b'+name+r'\b',original): missing.append(name)
 if missing: raise RuntimeError('vm_local.h surface mismatch: '+', '.join(missing))
 oracle=out/'oracle.exe';source=ROOT/'tests/reference/vm_local_header_oracle.c'
 run(['cl','/nologo','/Od','/MT','/DWIN32',source,f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log')
 actual=run([build('tests/vm_local_header_oracle.ml','vm_local_header_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if expected!=actual: raise RuntimeError('vm_local.h ABI mismatch\nC: '+expected+'\nM: '+actual)
 contracts=run([build('tests/vm_local_header_contracts.ml','vm_local_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 64 vm_local.h ABI contracts': raise RuntimeError(contracts)
 files=[header,port,source,ROOT/'tests/vm_local_header_oracle.ml',ROOT/'tests/vm_local_header_contracts.ml']
 result={'passed':True,'opcodes':len(OPCODES),'exact_records':len(expected.splitlines()),'contracts':64,'scope':'Complete vm_local.h opcode, assembler-offset, symbol, managed vm_s and declared VM entry-point surface; productive behavior is owned by interpreter.ml and runtime.ml.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print('PASS: vm_local.h 60 opcodes + 3 exact ABI records + 64 contracts')
if __name__=='__main__': main()
