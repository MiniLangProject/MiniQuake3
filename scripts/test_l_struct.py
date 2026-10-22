"""Unchanged-C differential oracle and native contracts for botlib/l_struct.c."""
import subprocess
import sys
import re
from inventory import sha
from toolchain import ROOT,msvc_env,run

FUNCTIONS=['FindField','ReadChar','ReadNumber','ReadString','ReadStructure','WriteFloat','WriteIndent','WriteStructWithIndent','WriteStructure']
ORACLE=['FindField','ReadNumber','ReadChar','ReadString','ReadStructure','WriteIndent','WriteFloat','WriteStructWithIndent','WriteStructure']

def unchanged_functions(source,names):
    """Extract exact C text while ignoring braces inside comments and literals."""
    text=source.read_text(encoding='utf-8');result=[]
    for name in names:
        match=re.search(r'^[\w* \t]+\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',text,re.M)
        if not match: raise RuntimeError('Missing original function '+name)
        index=match.end();depth=1;quote=None;line_comment=False;block_comment=False
        while depth and index<len(text):
            char=text[index];following=text[index+1] if index+1<len(text) else ''
            if line_comment:
                if char=='\n': line_comment=False
            elif block_comment:
                if char=='*' and following=='/': block_comment=False;index+=1
            elif quote:
                if char=='\\': index+=1
                elif char==quote: quote=None
            elif char=='/' and following=='/': line_comment=True;index+=1
            elif char=='/' and following=='*': block_comment=True;index+=1
            elif char in ('"',"'"): quote=char
            elif char=='{': depth+=1
            elif char=='}': depth-=1
            index+=1
        if depth: raise RuntimeError('Unterminated original function '+name)
        result.append(text[match.start():index])
    return '\n\n'.join(result)+'\n'

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)

def main():
    out=ROOT/'build/reference/l_struct';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/botlib/l_struct.c'
    (out/'l_struct_under_test.inc').write_text(unchanged_functions(source,ORACLE),encoding='utf-8',newline='\n')
    host=ROOT/'tests/reference/l_struct_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4100','/wd4244','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    build('tests/l_struct_oracle.ml','l_struct_oracle.exe');build('tests/l_struct_contracts.ml','l_struct_contracts.exe')
    mini=run([ROOT/'build/l_struct_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    assert native==mini,(native,mini)
    contracts=run([ROOT/'build/l_struct_contracts.exe'],ROOT/'build',log=out/'contracts.log')
    assert contracts.startswith('PASS:'),contracts
    module=ROOT/'src/mq3/botlib/l_struct.ml';text=module.read_text(encoding='utf-8')
    missing=[name for name in FUNCTIONS if f'// {name}' not in text];assert not missing,missing
    print('PASS: unchanged l_struct C behavior matches MiniLang')
    print(contracts.strip())
    print(f'PASS: {len(FUNCTIONS)} l_struct Ledger symbols covered')
    print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')

if __name__=='__main__':main()
