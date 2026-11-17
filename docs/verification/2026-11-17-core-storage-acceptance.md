# Core and storage acceptance — 17 November 2026

## Integrated changes

PR #1 was merged as `ec9536b5732313c31d51b94b11f2d6fa7919e0cd` after a fresh Windows checkout passed core regression run [44028089540](https://github.com/MiniLangProject/MiniQuake3/actions/runs/44028089540). It contains the audited source-inventory, timing, routing-cache and shared-snapshot corrections.

PR #2 was merged as `e1733b165acaad988c89abfc4a233e07ebb4ba89`. It adds a separately testable user-file component, fixes its append/empty-write/path-alias cases, restores the retained-world test's published-toolchain invocation, and adds immutable retail acceptance and corresponding-source packaging.

**The user-file component is not yet connected to the normal desktop host or shipping build.** Do not infer working game-configuration persistence or completed map/menu lifecycle integration from these component tests.

## Executed tests

| Scope | Run | Result |
|---|---|---|
| Fresh core checkout for PR #1 | 44028089540 | Python inventory, timing/LRU, routing and full Windows build passed |
| Storage and retained-world at `3a36b77` | 44031407921 | 98 MiniLang file contracts, 2 separate-process reopen checks, native Windows path/atomic-write cases and 51 retained-world contracts passed |
| Full core regression for PR #2 | 44031414502 | Passed, including the complete Windows game/DLL/QVM build |
| Retail core at `5029c5b` | 44031173695 | Verified CD, bot/player checks, retained-world differential comparison, main menu and both graphical arena replays passed |

Storage native tests rejected 17 invalid names and checked Unicode/separator identity, existing 8.3 aliases, junction rejection, the distinction between absent and empty files, and preservation of existing data when atomic replacement is denied. The second MiniLang process reopened the previously written file; it did not share the writer process's Store or memory.

The retained-world gate executed 51 compiled contracts and, in the retail run, 288 byte-comparison cases on `q3dm1` and `q3ctf1`. The latter validates retained versus reference-builder output, not complete CTF gameplay or pixel parity with the original renderer.

Retail bot checks passed 9 contracts on `q3dm0` and 9 on `q3dm1`, including human and bot entries in original QVM scoreboard replies. Framebuffer capture recorded the normal main menu and 120 completed frames on each of `q3dm0` and `q3dm1`. Both bounded arena replays exited naturally with code zero. The menu was deliberately stopped by the capture harness after reaching its stable title and rendered frame.

All three test workflows used read-only repository permissions and checked that tracked source files remained unchanged during execution. They do not generate or apply production patches.

## Provenance

- Published compiler: checksum-pinned MiniLang 1.3.9, not historical frozen-toolchain binary parity.
- Original source: `dbe4ddb10315479fc00086f08e25d968b4b43c49`.
- Retail-tested commit: `5029c5b794b68d1e5a103c35dfc4860c059f0b82`.
- Final PR #2 head: `3a36b77b47af22315ff0fd7f4419f8761e421535`.
- The only difference between those last two commits is four added lines in `scripts/test_user_files.py` resolving the isolated executable's engine ABI DLL search path. That corrected harness passed the separate storage run. Runtime and native source bytes are unchanged.
- Game executable SHA-256: `4eca327d3f349bd6a4a778e7373f852856dc978a276a301edd2f5b1be999bb16`.
- CD SHA-256: `d44fb1f9a68530169a5947aa9011fe84296ef2ba86e56e8a6baedbd71973ae09` (555,732,992 bytes).

Run artifacts contain JSON reports, source and binary hashes, logs, and actual 1280x720 framebuffer screenshots. The retail artifact also contains a tested build and corresponding source archive with the pinned upstream source included. PK3, PAK and CD images are not distributed in those packages.

## Limits and next acceptance

The hosted renderer was **software / GDI Generic**, without an audio device. Capture I/O was enabled. These results do not measure GPU performance, establish audible output, or prove a full interactive playthrough.

The larger desktop lifecycle/persistence/culling candidate remains separate and is not silently accepted by this report. Its remaining application-level acceptance must cover real menu entry, repeated restart and map changes, disconnect back to the menu, invalid-map behavior, configuration persistence across normal process restarts, video restart, and repeated-session resource stability.

The user-file boundary rejects existing reparse points and invalid names but is not a filesystem sandbox against a hostile local process concurrently swapping directory links. Duplicate-writer protection is per Store, not an interprocess lock.
