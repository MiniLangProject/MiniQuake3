"""Unchanged-C manager oracle and native contracts for botlib/l_memory.c."""
import subprocess
import sys
import re
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

FUNCTIONS=['AvailableMemory','BlockFromPointer','DumpMemory','FreeMemory','LinkMemoryBlock','MemoryByteSize','PrintMemoryLabels','PrintUsedMemorySize','UnlinkMemoryBlock']
ORACLE=['LinkMemoryBlock','UnlinkMemoryBlock','GetMemory','GetClearedMemory','GetHunkMemory','GetClearedHunkMemory','BlockFromPointer','FreeMemory','AvailableMemory','MemoryByteSize','PrintUsedMemorySize','PrintMemoryLabels','DumpMemory']
def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
 out=ROOT/'build/reference/l_memory';out.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code/botlib/l_memory.c';normalized=out/'l_memory_normalized.c';raw=source.read_text(encoding='utf-8');raw=re.sub(r'#ifdef MEMDEBUG\s+void \*\w+Debug\([^\n]+\)\s+#else\s+void \*(\w+)(\([^\n]+\))\s+#endif[^\n]*\s*\{',r'void *\1\2\n{',raw);normalized.write_text(raw,encoding='utf-8',newline='\n');(out/'l_memory_under_test.inc').write_text(extract(normalized,ORACLE),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/l_memory_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4100','/wd4244','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log');build('tests/l_memory_oracle.ml','l_memory_oracle.exe');build('tests/l_memory_contracts.ml','l_memory_contracts.exe');mini=run([ROOT/'build/l_memory_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini);contracts=run([ROOT/'build/l_memory_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert contracts.startswith('PASS:'),contracts;module=ROOT/'src/mq3/botlib/l_memory.ml';text=module.read_text(encoding='utf-8');missing=[name for name in FUNCTIONS if f'// {name}' not in text];assert not missing,missing;print('PASS: unchanged l_memory C manager matches MiniLang');print(contracts.strip());print(f'PASS: {len(FUNCTIONS)} l_memory Ledger symbols covered');print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')
if __name__=='__main__':main()
