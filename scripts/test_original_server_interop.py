#!/usr/bin/env python3
"""Real UDP acceptance against a separately running pinned id Software server.

Loopback only, separate writable home, caller-supplied retail assets. The
MiniLang peer exercises protocol 68, application command delivery and a live
map_restart; it does not render or validate pure paks. A nonce-bearing loopback
control packet asks Python to restart the server only after initial acceptance.
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


def metrics(text: str, prefix: str) -> dict:
    lines = [line for line in text.splitlines() if line.startswith(prefix + ' ')]
    if len(lines) != 1:
        raise RuntimeError('Missing or duplicate peer evidence: ' + prefix)
    result = {}
    for field in lines[0].split()[1:]:
        key, value = field.split('=', 1)
        result[key] = value == 'true' if value in ('true', 'false') else int(value)
    return result


def decode_rcon_packet(packet: bytes, endpoint: tuple[str, int],
                       expected_endpoint: tuple[str, int]) -> str | None:
    """Decode only an original-server OOB print from the expected UDP endpoint."""
    prefix = b'\xff'*4+b'print\n'
    if endpoint != expected_endpoint or not packet.startswith(prefix):
        return None
    # SV_FlushRedirect can split output into several datagrams. Preserve each
    # payload exactly so joining them does not alter a split line.
    return packet[len(prefix):].decode('latin1')


def validate_server_evidence(console_text: str, rcon_text: str, token: str) -> dict:
    """Require independent original-server evidence from both output paths."""
    def begin_clients(text: str) -> set[int]:
        prefix = 'ClientBegin: '
        return {int(line[len(prefix):]) for line in text.splitlines()
                if line.startswith(prefix) and line[len(prefix):].isdigit()}
    initial_clients = begin_clients(console_text)
    restart_clients = begin_clients(rcon_text)
    restarted_clients = initial_clients & restart_clients
    missing = []
    if not initial_clients:
        missing.append('initial ClientBegin in qconsole')
    if not restarted_clients:
        missing.append('same-client restart ClientBegin in server RCON output')
    if 'map_restart' not in console_text.splitlines():
        missing.append('map_restart in qconsole')
    if f'MQ3_PROTOCOL68_ROUNDTRIP_{token}' not in console_text:
        missing.append('initial chat in qconsole')
    if f'MQ3_PROTOCOL68_RESTART_{token}' not in console_text:
        missing.append('post-restart chat in qconsole')
    if missing:
        raise RuntimeError('Original server evidence missing: ' + ', '.join(missing))
    return {'initial_client_numbers': sorted(initial_clients),
            'restart_client_numbers': sorted(restart_clients),
            'restarted_client_numbers': sorted(restarted_clients),
            'map_restart_logged': True, 'both_chats_logged': True}


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
              'startup_port_unreachable': 0, 'restart_requested': False,
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
    peer = None
    restart_output: list[str] = []
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
            observer.bind(('127.0.0.1',0))
            observer.settimeout(0.4)
            deadline = time.monotonic()+40; ready = False
            while time.monotonic()<deadline and server.poll() is None:
                try:
                    observer.sendto(b'\xff'*4+b'getinfo MQ3_READY',('127.0.0.1',port))
                    packet, endpoint = observer.recvfrom(65535)
                    if endpoint==('127.0.0.1',port) and b'infoResponse' in packet and b'\\protocol\\68' in packet and b'\\mapname\\q3dm1' in packet:
                        ready=True; report['info_response']=packet.decode('latin1'); break
                except socket.timeout:
                    pass
                except ConnectionResetError as error:
                    # Windows reports a previous UDP probe to an unopened port
                    # as WSAECONNRESET. Retry only during the bounded startup
                    # phase; never interpret the error as server readiness.
                    if getattr(error, 'winerror', None) != 10054:
                        raise
                    report['startup_port_unreachable'] += 1
                    time.sleep(0.1)
            if not ready: raise RuntimeError('Original server did not load q3dm1 and answer protocol-68 getinfo')
            # Keep the peer alive while the independent controller restarts the
            # original server. A UDP handshake avoids dependence on stdout
            # buffering or a guessed time at which the client has joined.
            token = secrets.token_hex(16)
            ready_packet = b'\xff'*4+f'MQ3_RESTART_READY {token}'.encode('ascii')
            def capture_restart_reply(packet: bytes, endpoint: tuple[str, int]) -> None:
                if not report['restart_requested']:
                    return
                payload = decode_rcon_packet(packet, endpoint, ('127.0.0.1', port))
                if payload is not None:
                    restart_output.append(payload)
                    if 'Bad rconpassword' in payload:
                        raise RuntimeError('Original server rejected the local restart controller')
            peer_command = [str(ROOT/'build/original_server_probe.exe'), str(port),
                            str(observer.getsockname()[1]), token]
            peer_log = out/'original-peer.log'
            begin = time.monotonic()
            with peer_log.open('w', encoding='utf-8') as stream:
                peer = subprocess.Popen(peer_command, cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT)
                deadline = time.monotonic()+60
                while peer.poll() is None:
                    if time.monotonic() >= deadline:
                        raise RuntimeError('Original peer exceeded its bounded restart acceptance deadline')
                    if server.poll() is not None:
                        raise RuntimeError('Original server exited during restart acceptance')
                    try:
                        packet, endpoint = observer.recvfrom(65535)
                    except socket.timeout:
                        continue
                    if packet == ready_packet and endpoint[0] == '127.0.0.1' and endpoint[1] != port:
                        # The peer retries readiness until it sees the restart.
                        # Never execute map_restart twice for duplicate packets.
                        if not report['restart_requested']:
                            observer.sendto(b'\xff'*4+f'rcon {password} map_restart 0'.encode('ascii'),('127.0.0.1',port))
                            report['restart_requested'] = True
                            report['restart_control_source'] = list(endpoint)
                            report['restart_request_seconds'] = round(time.monotonic()-begin, 3)
                    else:
                        capture_restart_reply(packet, endpoint)
                peer.wait(timeout=5)
                # Drain responses already queued when peer.poll() observes its
                # exit. Capture ends before the separate quit command below.
                observer.setblocking(False)
                while True:
                    try:
                        packet, endpoint = observer.recvfrom(65535)
                    except BlockingIOError:
                        break
                    capture_restart_reply(packet, endpoint)
            text = peer_log.read_text(encoding='utf-8', errors='replace')
            report['steps'].append({'name': 'original-peer', 'exit': peer.returncode,
                                    'seconds': round(time.monotonic()-begin, 3)})
            print(text[-16000:], flush=True)
            if peer.returncode:
                raise RuntimeError('original-peer failed')
            if not report['restart_requested']:
                raise RuntimeError('Peer never completed the phase before map_restart')
            if 'PASS: original protocol-68 server' not in text: raise RuntimeError('Missing compiled peer acceptance marker')
            report['before_restart'] = metrics(text, 'INTEROP_BEFORE')
            report['after_restart'] = metrics(text, 'INTEROP_AFTER')
            # The post-restart snapshot phase exceeds the original server's
            # 500 ms rcon throttle. Send only quit, not an immediately preceding
            # status request that would suppress graceful shutdown.
            observer.sendto(b'\xff'*4+f'rcon {password} quit'.encode(),('127.0.0.1',port))
        try: server.wait(timeout=5)
        except subprocess.TimeoutExpired: server.terminate();server.wait(timeout=5)
        server_text=log.read_text(encoding='latin1', errors='replace') if log.exists() else ''
        server_text=server_text.replace(password,'[test credential redacted]')
        (out/'original-server.log').write_text(server_text,encoding='utf-8')
        # SVC_RemoteCommand redirects Com_Printf before qconsole logging. The
        # second GAME_CLIENT_BEGIN is therefore authoritative RCON output,
        # while the initial begin, the rcon command and both chats are console
        # output. Require both sources instead of counting console lines twice.
        report['server_evidence'] = validate_server_evidence(server_text, ''.join(restart_output), token)
        report.update(status='passed', original_server_sha256=digest(exe), peer_sha256=digest(ROOT/'build/original_server_probe.exe'),
                      pak0_sha256=digest(data_root/'baseq3/pak0.pk3'), server_exit=server.returncode,
                      original_server_client_begin=True, original_server_chat_received=True,
                      original_server_map_restart=True, original_server_post_restart_chat_received=True)
        print('PASS: separate original dedicated server accepted MiniLang client and live map_restart over real UDP', flush=True)
        return 0
    except BaseException as error:
        report.update(status='failed',error=str(error)); raise
    finally:
        if peer is not None and peer.poll() is None:
            peer.terminate()
            try: peer.wait(timeout=5)
            except subprocess.TimeoutExpired: peer.kill(); peer.wait(timeout=5)
        if peer is not None:
            report['peer_exit'] = peer.poll()
        if server is not None and server.poll() is None:
            server.terminate()
            try: server.wait(timeout=5)
            except subprocess.TimeoutExpired: server.kill(); server.wait(timeout=5)
        if server is not None:
            report['server_exit'] = server.poll()
        log=home/'baseq3/qconsole.log'
        if log.exists():
            text=log.read_text(encoding='latin1',errors='replace')
            if 'password' in locals(): text=text.replace(password,'[test credential redacted]')
            (out/'original-server.log').write_text(text,encoding='utf-8')
        redirected=''.join(restart_output)
        if 'password' in locals(): redirected=redirected.replace(password,'[test credential redacted]')
        (out/'original-rcon.log').write_text(redirected,encoding='utf-8')
        report['restart_rcon_packets'] = len(restart_output)
        (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
        shutil.rmtree(home,ignore_errors=True)


if __name__=='__main__':
    raise SystemExit(main())
