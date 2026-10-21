"""Unchanged-C decisions and native contracts for code/cgame/cg_players.c."""
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ['CG_AddPainTwitch','CG_AddRefEntityWithPowerups','CG_BreathPuffs','CG_ClearLerpFrame','CG_ColorFromString','CG_CopyClientInfoModel','CG_CustomSound','CG_DustTrail','CG_FileExists','CG_FindClientHeadFile','CG_FindClientModelFile','CG_HasteTrail','CG_LightVerts','CG_LoadClientInfo','CG_LoadDeferredPlayers','CG_NewClientInfo','CG_ParseAnimationFile','CG_Player','CG_PlayerAngles','CG_PlayerAnimation','CG_PlayerFlag','CG_PlayerFloatSprite','CG_PlayerPowerups','CG_PlayerShadow','CG_PlayerSplash','CG_PlayerSprites','CG_PlayerTokens','CG_RegisterClientModelname','CG_RegisterClientSkin','CG_ResetPlayerEntity','CG_RunLerpFrame','CG_ScanForExistingClientInfo','CG_SetDeferredClientInfo','CG_SetLerpFrameAnimation','CG_SwingAngles','CG_TrailItem']

def main():
    out=ROOT/'build/reference/cgame_players';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_players.c'
    (out/'cgame_players_under_test.inc').write_text(extract(source,['CG_ColorFromString','CG_SwingAngles']),encoding='utf-8',newline='\n')
    host=ROOT/'tests/reference/cgame_players_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    for src,name in [('tests/cgame_players_oracle.ml','cgame_players_oracle.exe'),('tests/cgame_players_contracts.ml','cgame_players_contracts.exe')]:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',src,'--output',name],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_players_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
    contracts=run([ROOT/'build/cgame_players_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert contracts.startswith('PASS:'),contracts
    module=ROOT/'src/mq3/client/cgame_players.ml';text=module.read_text(encoding='utf-8');missing=[name for name in FUNCTIONS if f'// {name}' not in text];assert not missing,missing
    print('PASS: unchanged cg_players C decisions match MiniLang');print(contracts);print(f'PASS: {len(FUNCTIONS)} cg_players contracts covered');print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')
if __name__=='__main__':main()
