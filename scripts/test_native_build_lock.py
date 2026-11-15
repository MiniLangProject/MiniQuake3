"""Concurrent native cache users must not overwrite the same MSVC objects."""
import multiprocessing
from pathlib import Path
import tempfile
import time
from build import native_build_lock, build_file_lock


def contender(folder, token, ready, start):
    output = Path(folder)
    ready.put(token)
    if not start.wait(10):
        raise RuntimeError("test start was not released")
    with native_build_lock(output):
        with (output / "events.log").open("a") as events:
            events.write(f"enter {token}\n"); events.flush()
            time.sleep(0.15)
            events.write(f"leave {token}\n"); events.flush()


def main():
    context = multiprocessing.get_context("spawn")
    with tempfile.TemporaryDirectory(prefix="mq3-native-lock-") as folder:
        ready = context.Queue(); start = context.Event()
        workers = [context.Process(target=contender, args=(folder, token, ready, start)) for token in ("a", "b")]
        try:
            for worker in workers: worker.start()
            assert {ready.get(timeout=10), ready.get(timeout=10)} == {"a", "b"}
            start.set()
            for worker in workers:
                worker.join(10)
                assert worker.exitcode == 0, "native lock contender failed or remained blocked"
            events = (Path(folder) / "events.log").read_text().splitlines()
            assert events in (["enter a", "leave a", "enter b", "leave b"], ["enter b", "leave b", "enter a", "leave a"]), events
            try:
                with native_build_lock(Path(folder)):
                    raise RuntimeError("simulated native compiler failure")
            except RuntimeError:
                pass
            with native_build_lock(Path(folder)):
                pass
            # A different executable must not wait behind a long ML compile.
            with build_file_lock(Path(folder) / "game.exe.build.lock"):
                with build_file_lock(Path(folder) / "probe.exe.build.lock"):
                    pass
        finally:
            for worker in workers:
                if worker.is_alive(): worker.terminate(); worker.join(5)
            ready.close()
    print("PASS: concurrent native cache exclusion, failure recovery and independent ML output locks")


if __name__ == "__main__": main()
