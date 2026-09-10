#!/usr/bin/env python3
"""Extract one Baseq3 WAV, validate it, and optionally play it through WinMM."""
from __future__ import annotations
import argparse
import ctypes
from pathlib import Path
import struct
import subprocess
import sys
import time
import wave
import zipfile
from toolchain import ROOT

DEFAULT_PAK=Path(r'D:\Quake3\baseq3\pak0.pk3')
DEFAULT_SOUND='sound/feedback/fight.wav'

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path,default=DEFAULT_PAK);parser.add_argument('--sound',default=DEFAULT_SOUND);parser.add_argument('--play',action='store_true');args=parser.parse_args()
    if not args.pak.is_file(): raise RuntimeError(f'Baseq3 pak not found: {args.pak}')
    with zipfile.ZipFile(args.pak) as archive: raw=archive.read(args.sound)
    import io
    with wave.open(io.BytesIO(raw),'rb') as source:
        channels=source.getnchannels();rate=source.getframerate();bits=source.getsampwidth()*8;samples=source.readframes(source.getnframes())
    if channels not in (1,2) or bits not in (8,16): raise RuntimeError('asset is outside preview PCM subset')
    dll=ROOT/'build/playable_audio/playable_audio.dll'
    if not dll.exists(): subprocess.run([sys.executable,ROOT/'scripts/playable_audio_build_test.py'],cwd=ROOT,check=True)
    if args.play:
        audio=ctypes.WinDLL(str(dll));audio.playable_audio_init.restype=ctypes.c_int
        audio.playable_audio_play_pcm.argtypes=[ctypes.c_void_p,ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_int]
        audio.playable_audio_play_pcm.restype=ctypes.c_int
        buffer=ctypes.create_string_buffer(samples)
        if not audio.playable_audio_init() or not audio.playable_audio_play_pcm(buffer,len(samples),rate,channels,bits): raise RuntimeError('WinMM playback failed')
        time.sleep(min(2.0,len(samples)/(rate*channels*(bits//8))))
        audio.playable_audio_shutdown()
    print(f'playable audio asset: PASS ({args.sound}, {rate} Hz, {channels} ch, {bits} bit, {len(samples)} bytes)')
if __name__=='__main__': main()
