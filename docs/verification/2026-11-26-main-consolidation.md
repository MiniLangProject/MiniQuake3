# Main branch consolidation and API verification — 2026-11-26

The maintained source is consolidated on `main`, which is also the repository
default branch. The source checkpoint
[`3136e627a126`](https://github.com/MiniLangProject/MiniQuake3/commit/3136e627a1265024f4793bf02086048815b28780)
preserves the three previous published branch heads as its direct parents.
The generated reference described here records that exact source revision.

This report is the current consolidation and documentation-coverage record.
[The earlier coverage report](MINIDOC_COVERAGE_2026-11-26.md),
[warning-cleanup report](MINIDOC_WARNINGS_2026-11-26.md), and
[17 November branch report](2026-11-17-branch-consolidation.md) remain historical
evidence for their stated revisions and decisions.

## Preserved published history

| Previous branch | Preserved head |
| --- | --- |
| `main` | [`b4389b7121e1`](https://github.com/MiniLangProject/MiniQuake3/commit/b4389b7121e1ed178be239ab4bbaae99162bb7cc) |
| `master` | [`fb350eccd1f3`](https://github.com/MiniLangProject/MiniQuake3/commit/fb350eccd1f3f666559d362204d8071fd74c6fdd) |
| `fix/network-protocol68-20261117` | [`14ffb6872232`](https://github.com/MiniLangProject/MiniQuake3/commit/14ffb68722322086e6bc91e168ae81a00e27f9b6) |

All three histories remain reachable through the consolidated source commit.
The protocol branch's tree is already incorporated by the other two branches;
preserving its separate head added ancestry without changing the integrated
tree. No branch-tip commit was discarded or replaced by a force push.

The source combines the latest commented implementation and reference work
from `master` with the remote protocol-68 session and lifecycle changes from
`main`. The integration retains:

- Explicit remote gamestate acceptance, generation-aware connection state,
  reliable server commands, configstring updates and map-restart handling.
- The correct inactive-snapshot flag and preservation of reliable commands
  across gamestate transitions.
- Fragmented-message receive capacity, client Huffman-codec reuse, bulk byte
  copies and server decoding with the physical read/bit cursor intact.
- Local build and test commands, with no GitHub Actions workflows. `AGENTS.md`
  records the sole-main workflow for later work.

The separate uncommitted audit workspace was neither merged nor modified.
Its changes and results are outside this consolidation.

## Source documentation and integrity

The newly imported remote session and receive-buffer APIs, plus the new packed
configstring updater, now document their arguments, dynamic return values,
errors, ownership, lifecycle boundaries and callback lifetimes. The Session
record has individual documentation for all 17 fields, and the new snapshot
flag has an explicit meaning. Related ingress, snapshot and decoder comments
were corrected to match the integrated implementations.

Eight source files received documentation edits after integration testing.
Across all 603 project source files, 595 stayed byte-identical. Removing
comment-only and blank lines left identical executable text in the other
eight, after normalizing whitespace only within the Session field declaration
to allow a separate comment for each field. This comparison is a source-text
integrity check; it does not claim a new parser-AST comparison.

The behavioral tests used local integration revision
`b598a9ac1c3283244ee14f1f391fadaf457bce32`. The subsequently published source
contains the same executable source plus the documented changes above.
The machine-readable record lists every changed path and the comparison method.

## Current API reference

MiniDoc 0.4.9 completed full strict HTML and Markdown regeneration in
**563.373 seconds**, with exit code 0 and zero warnings or errors.
The analysis covers **603 project source files**, loading 616 files with
dependencies and recognizing 35,257 symbols.

```text
MiniDoc: 616 file(s), 35257 symbol(s), 0 warning(s).
```

| Category | Documented | Total | Coverage |
| --- | ---: | ---: | ---: |
| API declarations | 14,473 | 14,473 | 100% |
| Parameters | 32,681 | 32,681 | 100% |
| Constants | 7,136 | 7,136 | 100% |
| Fields | 13,274 | 13,274 | 100% |
| Overall | 67,564 | 67,564 | 100% |

Coverage records the presence of documentation. It does not establish that
every description or every engine behavior is correct. The targeted semantic
review described above covers the imported and affected networking APIs;
earlier reviews remain scoped to their own recorded changes.

`minidoc.toml` retains strict warnings, public parameter/return and summary
quality checks, complete project-source scanning and internal declarations.
The repository source-link ref is now `main`; generated links no longer depend
on `master`. Source revision metadata remains pinned to
`3136e627a1265024f4793bf02086048815b28780`.

| Output validation | Result |
| --- | ---: |
| Generated files, excluding manifests | 5,623 |
| Output manifests | 2 |
| Local links, including search results | 259,803 |
| Fragment references | 200,128 |
| JSON files | 1 |
| SVG files | 4 |
| Repository source links targeting `main` | 69,766 |
| Repository source links targeting `master` | 0 |
| Defects | **0** |

The output verifier checks both manifests, nonempty files, required pages,
local links, fragment anchors, search-result targets, complete HTML documents,
JSON parsing and SVG XML parsing. Both HTML and Markdown call graphs and their
SVG assets are included.

## Integration validation

The Linux-hosted MiniLang 1.3.11 compiler built and ran 15 focused programs.
Nine contract programs passed all 245 checks:

| Contract program | Checks passed |
| --- | ---: |
| Gamestate | 12 |
| Reliable server-command stream | 26 |
| Client-game snapshots | 20 |
| Server netchan | 26 |
| Client netchan | 18 |
| Shared netchan | 29 |
| Bidirectional fragmented ingress | 25 |
| Remote-session commands and packed gamestate | 71 |
| Connectionless handling | 18 |
| **Total** | **245** |

Six additional programs matched 64 records from original-C differential
comparisons: configstring update (8), client-game snapshots (4), shared netchan
(29), server netchan (13), client netchan (9), and gamestate (1). Original
engine function bodies came unchanged from the pinned id Software submodule
`dbe4ddb10315479fc00086f08e25d968b4b43c49`; only harness linkage declarations
and the `va` signature were adapted for GCC.

The portable MiniLang snapshot changed only FFI library names. Its numeric
ABI was built from the unchanged `native/abi.c`, and no host-service stubs
were used. Nine Python tests in `tests/test_original_server_evidence.py`
also passed; these validate evidence handling, not a live original-server run.

The complete, unmodified MiniLang game source cross-compiled and linked for
Windows x64 with MiniLang 1.3.11, exiting successfully. The resulting PE was
94,947,328 bytes with SHA-256
`d65117cf76b909c616f63f97351eaaee904c5b743a93cb70a641993edd5f919e`.
This checks game-code compilation and linking, not Windows DLL compilation
or execution of the game.

There was no new Windows runtime, pinned MiniLang 1.3.9 release build, live
UDP/original-server acceptance, or retail gameplay, graphics, audio or
performance acceptance run. Historical acceptance reports retain their
original scope.

## Toolchain and reproduction

The reference uses the same verified MiniDoc 0.4.9 native executable as the
previous successful full generation, SHA-256
`c93e4a45e65e06f8096bf146a3c4f9b360523c6816216a783af122b53f81c55a`.
Its source revision is `a9a058215cde15459d42525a4a3e0d5ff2108f05`.
The compiler import/standard-library tree is pinned to
`c1f402d66e7021bd2137e68b5d919569f10f3959`.

From a checkout of the recorded source with complete sibling MiniDoc and
MiniLangCompilerML checkouts:

```sh
../MiniDoc/build/minidoc --config minidoc.toml -I ../MiniLangCompilerML \
  --strict --revision 3136e627a1265024f4793bf02086048815b28780
python3 docs/verification/verify_minidoc.py \
  --revision 3136e627a1265024f4793bf02086048815b28780 \
  --generator-version 0.4.9
```

The completed run used temporary output directories before verification and
installation, with timestamps disabled. Current source pins, generation
results, coverage, integration checks and output-verifier results are stored
in [the validation record](main-consolidation-2026-11-26-validation.json).
