#!/usr/bin/env python3
"""Real UDP acceptance against a separately running pinned id Software server.

Loopback only, separate writable home, caller-supplied retail assets. The
MiniLang peer exercises protocol 68; it does not render or validate pure paks.
No retail archives are copied into evidence. Both child processes are bounded.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path
import secrets
import shutil
import socket
import subprocess
import sys
import tempfile
import time

from toolchain import ROOT


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--data-root', type=Path, default=ROOT / 'build')
    args = parser.parse_args()
    if sys.platform != 'win32':
        parser.error('Windows/MSVC reference build required')
    data_root = args.data_root.resolve()
    if not (data_root / 'baseq3/pak0.pk3').is_file():
        parser.error('caller-supplied baseq3/pak0.pk3 is required')
    out = ROOT / 'build/protocol68-original'; out.mkdir(parents=True, exist_ok=True)
    report = {'status': 'running', 'source_commit': subprocess.check_output(['git','rev-parse','HEAD'], cwd=ROOT, text=True).strip(),
              'upstream_commit': subprocess.check_output(['git','rev-parse','HEAD'], cwd=ROOT / 'Quake-III-Arena-original-source', text=True).strip(),
              'limits': ['Loopback protocol 68 against pinned id Software source, not all historical releases.',
                         'sv_pure=0; pure/download asset verification is not bypassed or claimed.',
                         'Protocol client has no renderer: not desktop menu/connect acceptance.',
                         'Reverse full-game direction and Internet/NAT conditions are not covered.'], 'steps': []}
    def run(name: str, command: list, timeout=900) -> str:
        log = out / (name + '.log'); begin = time.monotonic()
        with log.open('w', encoding='utf-8') as stream:
            completed = subprocess.run([str(x) for x in command], cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT, timeout=timeout)
        text = log.read_text(encoding='utf-8', errors='replace')
        report['steps'].append({'name': name, 'exit': completed.returncode, 'seconds': round(time.monotonic()-begin,3)})
        print(text[-12000:], flush=True)
        if completed.returncode: raise RuntimeError(name + ' failed')
        return text
    server = None
    home = Path(tempfile.mkdtemp(prefix='mq3-original-', dir=out))
    try:
        run('reference-build', [sys.executable, ROOT/'scripts/build_reference.py'], 1200)
        run('peer-build', [sys.executable, ROOT/'scripts/build_release.py','--source','tests/original_server_probe.ml','--output','original_server_probe.exe'])
        base = home / 'baseq3'; base.mkdir()
        for dll in (ROOT/'build/reference').glob('*x86.dll'):
            shutil.copy2(dll, base/dll.name)
        exe = ROOT/'build/reference/quake3-reference.exe'
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as reservation:
            reservation.bind(('127.0.0.1',0)); port = reservation.getsockname()[1]
        password = secrets.token_hex(16)
        command = [str(exe), '+set','dedicated','1','+set','net_ip','127.0.0.1','+set','net_port',str(port),
                   '+set','fs_basepath',str(home),'+set','fs_homepath',str(home),'+set','fs_cdpath',str(data_root),
                   '+set','logfile','2','+set','vm_game','0','+set','sv_pure','0','+set','bot_enable','0',
                   '+set','sv_maxclients','4','+set','rconPassword',password,'+map','q3dm1']
        startup = subprocess.STARTUPINFO(); startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW; startup.wShowWindow=0
        server = subprocess.Popen(command, cwd=home, startupinfo=startup)
        log = base/'qconsole.log'
        with socket.socket(socket.AF_INET,socket.SOCK_DGRAM) as observer:
            observer.settimeout(0.4)
            deadline = time.monotonic()+40; ready = False
            while time.monotonic()<deadline and server.poll() is None:
                observer.sendto(b'\xff'*4+b'getinfo MQ3_READY',('127.0.0.1',port))
                try:
                    packet, endpoint = observer.recvfrom(65535)
                    if endpoint==('127.0.0.1',port) and b'infoResponse' in packet and b'\\protocol\\68' in packet and b'\\mapname\\q3dm1' in packet:
                        ready=True; report['info_response']=packet.decode('latin1'); break
                except socket.timeout: pass
            if not ready: raise RuntimeError('Original server did not load q3dm1 and answer protocol-68 getinfo')
            text = run('original-peer',[ROOT/'build/original_server_probe.exe',str(port)],40)
            if 'PASS: original protocol-68 server' not in text: raise RuntimeError('Missing compiled peer acceptance marker')
            time.sleep(0.3)
            observer.sendto(b'\xff'*4+f'rcon {password} status'.encode(),('127.0.0.1',port))
            time.sleep(0.2)
            observer.sendto(b'\xff'*4+f'rcon {password} quit'.encode(),('127.0.0.1',port))
        try: server.wait(timeout=5)
        except subprocess.TimeoutExpired: server.terminate();server.wait(timeout=5)
        server_text=log.read_text(encoding='latin1', errors='replace') if log.exists() else ''
        server_text=server_text.replace(password,'[test credential redacted]')
        (out/'original-server.log').write_text(server_text,encoding='utf-8')
        if 'ClientBegin:' not in server_text or 'MQ3_PROTOCOL68_ROUNDTRIP' not in server_text:
            raise RuntimeError('Original server log lacks independent client-begin/chat proof')
        report.update(status='passed', original_server_sha256=digest(exe), peer_sha256=digest(ROOT/'build/original_server_probe.exe'),
                      pak0_sha256=digest(data_root/'baseq3/pak0.pk3'), server_exit=server.returncode,
                      original_server_client_begin=True, original_server_chat_received=True)
        print('PASS: separate original dedicated server accepted MiniLang client over real UDP', flush=True)
        return 0
    except BaseException as error:
        report.update(status='failed',error=str(error)); raise
    finally:
        if server is not None and server.poll() is None:
            server.terminate()
            try: server.wait(timeout=5)
            except subprocess.TimeoutExpired: server.kill(); server.wait(timeout=5)
        log=home/'baseq3/qconsole.log'
        if log.exists():
            text=log.read_text(encoding='latin1',errors='replace')
            if 'password' in locals(): text=text.replace(password,'[test credential redacted]')
            (out/'original-server.log').write_text(text,encoding='utf-8')
        (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
        shutil.rmtree(home,ignore_errors=True)


if __name__=='__main__':
    raise SystemExit(main())
