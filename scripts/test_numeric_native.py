"""Check native IEEE binary32 ABI against retained MiniLang integer algorithms."""
import argparse
import json
import re
import shutil
import subprocess
from toolchain import ROOT, msvc_env
from inventory import sha


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--benchmark", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/numeric_native"
    out.mkdir(parents=True, exist_ok=True)
    env = {key.upper(): value for key, value in msvc_env("x64").items()}
    compiler = shutil.which("cl.exe", path=env["PATH"])
    subprocess.run([compiler, "/nologo", "/O2", "/fp:strict", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/numeric_native_control.c"), "/Fe:" + str(out / "numeric_native_control.exe"),
                    "/Fo:" + str(out / "numeric_native_control.obj")], cwd=out, env=env, check=True)
    cases = out / "native.bin"
    native = subprocess.run([str(out / "numeric_native_control.exe"), str(cases)], cwd=out,
                            check=True, capture_output=True, text=True, timeout=60).stdout.strip()
    print(native, flush=True)
    if not re.fullmatch(r"PASS: \d+ binary32 records, \d+ MXCSR/ABI calls \(32 rounding/denormal/exception modes, exact restoration\)", native):
        raise RuntimeError(native)
    subprocess.run([compiler, "/nologo", "/LD", "/O2", "/fp:strict", "/W4", "/WX", "/MT",
                    str(ROOT / "native/abi.c"), "/Fo:" + str(out / "abi.obj"),
                    "/link", "/Brepro", "/out:" + str(out / "miniquake3_abi.dll")],
                   cwd=out, env=env, check=True)
    frozen = ROOT / "artifacts/toolchain"
    exe = out / "numeric_native_contracts.exe"
    subprocess.run([str(frozen / "build/mlc_win64.exe"), str(ROOT / "tests/numeric_native_contracts.ml"),
                    str(exe), "-I", str(ROOT / "src"), "-I", str(frozen),
                    "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                   cwd=ROOT / "build", check=True, timeout=900)
    result = subprocess.run([str(exe), str(cases)], cwd=out, check=True,
                            capture_output=True, text=True, timeout=120).stdout.strip()
    records = cases.stat().st_size // 28
    expected = f"PASS: {records*10} software/native exact binary32 results (NaN payloads, signed zeros, subnormals, ties, overflow, invalid)"
    if result != expected:
        raise RuntimeError(result)
    print(result)
    report = {"passed": True, "records": records, "exact_results": records * 10,
              "native_control": native, "native_sha256": sha(ROOT / "native/abi.c"),
              "reference_sha256": sha(ROOT / "src/mq3/compat/numeric.ml"),
              "fixture_sha256": sha(cases)}
    if args.benchmark:
        benchmark_exe = out / "numeric_native_benchmark.exe"
        subprocess.run([str(frozen / "build/mlc_win64.exe"), str(ROOT / "tests/numeric_native_benchmark.ml"),
                        str(benchmark_exe), "-I", str(ROOT / "src"), "-I", str(frozen),
                        "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                       cwd=ROOT / "build", check=True, timeout=900)
        benchmark = subprocess.run([str(benchmark_exe)], cwd=out, check=True,
                                   capture_output=True, text=True, timeout=120).stdout.strip()
        if len(benchmark.splitlines()) != 5 or not all(line.startswith("Binary32 ") for line in benchmark.splitlines()):
            raise RuntimeError(benchmark)
        (out / "benchmark.log").write_text(benchmark + "\n")
        report["benchmark"] = benchmark.splitlines()
        print(benchmark)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
