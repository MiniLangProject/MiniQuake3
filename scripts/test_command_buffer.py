"""Differential Baseq3 cmd.c tokenizer and command-buffer test."""
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'Cmd_Wait_f', 'Cbuf_Init', 'Cbuf_AddText', 'Cbuf_InsertText',
    'Cbuf_ExecuteText', 'Cbuf_Execute', 'Cmd_Argc', 'Cmd_Argv',
    'Cmd_ArgvBuffer', 'Cmd_Args', 'Cmd_ArgsFrom', 'Cmd_ArgsBuffer',
    'Cmd_Cmd', 'Cmd_TokenizeString'
]

def main():
    out = ROOT/'build/reference/command_buffer'; out.mkdir(parents=True,exist_ok=True)
    original = ROOT/'Quake-III-Arena-original-source/code/qcommon/cmd.c'
    include = out/'cmd_under_test.inc'
    include.write_text(extract(original,FUNCTIONS),encoding='utf-8',newline='\n')
    harness = ROOT/'tests/reference/cmd_oracle.c'; oracle = out/'cmd_oracle.exe'
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',
         f'/I{out}',harness,f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native = run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/command_buffer_oracle.ml','--output','command_buffer_oracle.exe'],check=True)
    mini = run([ROOT/'build/command_buffer_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native != mini:
        native_lines=native.splitlines(); mini_lines=mini.splitlines()
        for index in range(max(len(native_lines),len(mini_lines))):
            a=native_lines[index] if index<len(native_lines) else '<missing>'
            b=mini_lines[index] if index<len(mini_lines) else '<missing>'
            if a!=b: raise RuntimeError(f'cmd.c differential mismatch at record {index+1}\nnative: {a[:500]}\nmini:   {b[:500]}')
        raise RuntimeError('cmd.c differential byte mismatch')
    records=native.count('\n')
    result={'passed':True,'records':records,
            'scope':'Unchanged Baseq3 Cmd_TokenizeString, argument accessors, Cbuf_AddText, Cbuf_InsertText, Cbuf_ExecuteText, Cbuf_Execute and Cmd_Wait_f including quote, comment, separator, insertion, wait and buffer-limit behavior.',
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/qcommon/command_buffer.ml',ROOT/'tests/command_buffer_oracle.ml']}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {records} exact Baseq3 cmd.c differential records')

if __name__=='__main__': main()
