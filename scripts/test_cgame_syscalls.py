"""Unchanged-C ABI oracle and native contracts for cgame/cg_syscalls.c."""
import argparse
import re
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

FUNCTIONS=['PASSFLOAT','dllEntry','testPrintFloat','testPrintInt','trap_AddCommand','trap_Argc','trap_Args','trap_Argv','trap_CIN_DrawCinematic','trap_CIN_PlayCinematic','trap_CIN_RunCinematic','trap_CIN_SetExtents','trap_CIN_StopCinematic','trap_CM_BoxTrace','trap_CM_CapsuleTrace','trap_CM_InlineModel','trap_CM_LoadMap','trap_CM_MarkFragments','trap_CM_NumInlineModels','trap_CM_PointContents','trap_CM_TempBoxModel','trap_CM_TempCapsuleModel','trap_CM_TransformedBoxTrace','trap_CM_TransformedCapsuleTrace','trap_CM_TransformedPointContents','trap_Cvar_Register','trap_Cvar_Set','trap_Cvar_Update','trap_Cvar_VariableStringBuffer','trap_Error','trap_FS_FCloseFile','trap_FS_FOpenFile','trap_FS_Read','trap_FS_Seek','trap_FS_Write','trap_GetCurrentCmdNumber','trap_GetCurrentSnapshotNumber','trap_GetEntityToken','trap_GetGameState','trap_GetGlconfig','trap_GetServerCommand','trap_GetSnapshot','trap_GetUserCmd','trap_Key_GetCatcher','trap_Key_GetKey','trap_Key_IsDown','trap_Key_SetCatcher','trap_MemoryRemaining','trap_Milliseconds','trap_PC_AddGlobalDefine','trap_PC_FreeSource','trap_PC_LoadSource','trap_PC_ReadToken','trap_PC_SourceFileAndLine','trap_Print','trap_R_AddAdditiveLightToScene','trap_R_AddLightToScene','trap_R_AddPolyToScene','trap_R_AddPolysToScene','trap_R_AddRefEntityToScene','trap_R_ClearScene','trap_R_DrawStretchPic','trap_R_LerpTag','trap_R_LightForPoint','trap_R_LoadWorldMap','trap_R_ModelBounds','trap_R_RegisterFont','trap_R_RegisterModel','trap_R_RegisterShader','trap_R_RegisterShaderNoMip','trap_R_RegisterSkin','trap_R_RemapShader','trap_R_RenderScene','trap_R_SetColor','trap_R_inPVS','trap_RealTime','trap_RemoveCommand','trap_S_AddLoopingSound','trap_S_AddRealLoopingSound','trap_S_ClearLoopingSounds','trap_S_RegisterSound','trap_S_Respatialize','trap_S_StartBackgroundTrack','trap_S_StartLocalSound','trap_S_StartSound','trap_S_StopBackgroundTrack','trap_S_StopLoopingSound','trap_S_UpdateEntityPosition','trap_SendClientCommand','trap_SendConsoleCommand','trap_SetUserCmdValue','trap_SnapVector','trap_UpdateScreen','trap_getCameraInfo','trap_loadCamera','trap_startCamera']

def exact_function(text,name):
    match=re.search(r'^[\w* \t]+\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',text,re.M)
    if not match: raise RuntimeError('Missing original function '+name)
    index=match.end();depth=1;quote=None;line=False;block=False
    while depth and index<len(text):
        char=text[index];following=text[index+1] if index+1<len(text) else ''
        if line:
            if char=='\n':line=False
        elif block:
            if char=='*' and following=='/':block=False;index+=1
        elif quote:
            if char=='\\':index+=1
            elif char==quote:quote=None
        elif char=='/' and following=='/':line=True;index+=1
        elif char=='/' and following=='*':block=True;index+=1
        elif char in ('"',"'"):quote=char
        elif char=='{':depth+=1
        elif char=='}':depth-=1
        index+=1
    if depth:raise RuntimeError('Unterminated original function '+name)
    return text[match.start():index]

def split_arguments(text):
    values=[];start=0;depth=0
    for index,char in enumerate(text):
        if char in '([':depth+=1
        elif char in ')]':depth-=1
        elif char==',' and depth==0:values.append(text[start:index].strip());start=index+1
    tail=text[start:].strip()
    if tail:values.append(tail)
    return values

def verify_wrapper_shapes(original,module):
    failures=[]
    for name in FUNCTIONS:
        if name in ('dllEntry','PASSFLOAT'):continue
        cbody=exact_function(original,name);mini_match=re.search(r'^function\s+'+re.escape(name)+r'\s*\(.*?end function',module,re.M|re.S);mbody=mini_match.group(0) if mini_match else ''
        ccall=re.search(r'\bsyscall\s*\((.*?)\)\s*;',cbody,re.S)
        mcall=re.search(r'\binvoke\s*\(\s*gateway\s*,\s*(CG_[A-Z0-9_]+)\s*,\s*\[(.*?)\]\s*\)',mbody,re.S)
        if not ccall or not mcall:failures.append(name+': missing call');continue
        cargs=split_arguments(ccall.group(1));margs=split_arguments(mcall.group(2))
        if not cargs or cargs[0]!=mcall.group(1) or len(cargs)-1!=len(margs):failures.append(name+': opcode/arity')
    if failures:raise RuntimeError('wrapper ABI shape mismatch: '+', '.join(failures))

def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/cgame_syscalls';out.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_syscalls.c';raw=source.read_text(encoding='utf-8')
    declaration=raw[raw.index('static int (QDECL *syscall'):raw.index(';',raw.index('static int (QDECL *syscall'))+1]
    body=declaration+'\n\n'+'\n\n'.join(exact_function(raw,name) for name in FUNCTIONS)+'\n';(out/'cgame_syscalls_under_test.inc').write_text(body,encoding='utf-8',newline='\n')
    original=ROOT/'Quake-III-Arena-original-source/code';includes=[f'/I{original/name}' for name in ('game','cgame','qcommon','renderer')]
    exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W3','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',*includes,f'/I{out}',ROOT/'tests/reference/cgame_syscalls_oracle.c',f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
    build('tests/cgame_syscalls_oracle.ml','cgame_syscalls_oracle.exe');build('tests/cgame_syscalls_contracts.ml','cgame_syscalls_contracts.exe');mini=run([ROOT/'build/cgame_syscalls_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
    contracts=run([ROOT/'build/cgame_syscalls_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert contracts.startswith('PASS:'),contracts
    module=ROOT/'src/mq3/client/cgame_syscalls.ml';text=module.read_text(encoding='utf-8');missing=[name for name in FUNCTIONS if f'// {name}' not in text or not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)];assert not missing,missing;verify_wrapper_shapes(raw,text)
    retail='not requested';pak=None
    if args.data_root:
        candidates=[args.data_root/'baseq3/pak0.pk3',args.data_root/'pak0.pk3'];pak=next((path for path in candidates if path.is_file()),None)
        if pak is None:raise RuntimeError('retail pak0.pk3 missing below '+str(args.data_root))
        build('tests/cgame_syscalls_retail_probe.ml','cgame_syscalls_retail_probe.exe');qvms=ROOT/'build/reference/qvms';result=run([ROOT/'build/cgame_syscalls_retail_probe.exe',pak,qvms],ROOT/'build',log=out/'retail-qvm.log',timeout=300);assert result.startswith('PASS:'),result;retail=result.strip()
    print('PASS: unchanged cg_syscalls C ABI matches MiniLang');print(contracts.strip());print(f'PASS: {len(FUNCTIONS)} cg_syscalls Ledger symbols covered');print('retail_qvm='+retail);print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')
if __name__=='__main__':main()
