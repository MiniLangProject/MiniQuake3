#!/usr/bin/env python3
"""Test a pinned published compiler without claiming frozen-toolchain parity."""
import json
import shutil
import sys
from pathlib import Path
import ci_retail_start as ci

ci.RELEASE = 'v1.3.9'
ci.PACKAGE_URL = ('https://github.com/MiniLangProject/MiniLangCompilerML/releases/download/'
                  'v1.3.9/MiniLangCompilerML-1.3.9-windows-x64.zip')
ci.PACKAGE_SHA = '46cbe327d0b42085045ba4f5e1a71bfb395ebc7b10bb3956285db6e469fbfc70'


def release_compiler(profile: dict) -> dict:
    package = ci.BUILD / 'compiler-release.zip'
    ci.download_package(package)
    ci.unpack(package, ci.BUILD / 'compiler-release')
    candidates = [p for p in (ci.BUILD / 'compiler-release').rglob('*.exe')
                  if p.name in ('mlc.exe', 'mlc_win64.exe')]
    if len(candidates) != 1:
        raise RuntimeError('Expected one published compiler, found ' + str(candidates))
    compiler = candidates[0]
    standards = [p for p in (ci.BUILD / 'compiler-release').rglob('std') if p.is_dir() and (p / 'fs.ml').is_file()]
    if len(standards) != 1:
        raise RuntimeError('Cannot resolve published standard library')
    frozen = ci.ROOT / 'artifacts/toolchain'
    (frozen / 'build').mkdir(parents=True, exist_ok=True)
    shutil.copy2(compiler, frozen / 'build/mlc_win64.exe')
    shutil.copytree(standards[0], frozen / 'std', dirs_exist_ok=True)
    used = json.loads(json.dumps(profile))
    used['inputs'] = [{'path': 'build/mlc_win64.exe', 'sha256': ci.digest(compiler)}]
    used['inputs'] += [{'path': p.relative_to(frozen).as_posix(), 'sha256': ci.digest(p)}
                      for p in sorted((frozen / 'std').rglob('*.ml'))]
    expected = next(item['sha256'] for item in profile['inputs'] if item['path']=='build/mlc_win64.exe')
    proof = {'mode': 'published-release-candidate', 'release': ci.RELEASE,
             'package_sha256': ci.PACKAGE_SHA, 'compiler_sha256': ci.digest(compiler),
             'expected_frozen_sha256': expected, 'exact_frozen_binary': False,
             'all_frozen_stdlib_inputs_verified': False}
    ci.REPORT['toolchain'] = proof
    ci.REPORT['limits'].append('Published 1.3.9 compiler and its standard library; NOT the historical frozen 1.2.8 toolchain.')
    used['ci_reconstructed_candidate'] = proof
    used['note'] = 'Temporary CI profile for pinned published compiler 1.3.9; original tracked profile restored after tests.'
    ci.save_report()
    return used


if __name__ == '__main__':
    ci.restore_compiler = release_compiler
    raise SystemExit(ci.main())
