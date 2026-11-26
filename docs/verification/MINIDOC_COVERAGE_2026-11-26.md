# Documentation coverage and semantic verification — 2026-11-26

The constants/fields pass is complete, and a subsequent implementation review
corrected API contracts in 21 source files. The reference is generated with
MiniDoc 0.4.9 using the existing strict warning policy.

## Source revisions

- Constants and fields documented:
  [`caef716ae922`](https://github.com/MiniLangProject/MiniQuake3/commit/caef716ae922d2be821c166e9d844eb037d8a038).
- Reviewed contract corrections:
  [`14417c8e9832`](https://github.com/MiniLangProject/MiniQuake3/commit/14417c8e9832465a943c7d628f8124feec06983d).
- MiniDoc 0.4.9 source, graph regressions, and own reference:
  [`a9a058215cde`](https://github.com/MiniLangProject/MiniDoc/commit/a9a058215cde15459d42525a4a3e0d5ff2108f05).
- Compiler imports and standard library:
  [`c1f402d66e70`](https://github.com/MiniLangProject/MiniLangCompilerML/commit/c1f402d66e7021bd2137e68b5d919569f10f3959).

The [initial warning-cleanup report](MINIDOC_WARNINGS_2026-11-26.md) retains its
historical evidence and earlier coverage counts. It is not the current coverage
report.

## Coverage

| Category | Documented | Total | Coverage |
| --- | ---: | ---: | ---: |
| API declarations | 14,452 | 14,452 | 100% |
| Parameters | 32,636 | 32,636 | 100% |
| Constants | 7,135 | 7,135 | 100% |
| Fields | 13,257 | 13,257 | 100% |
| **Overall** | **67,480** | **67,480** | **100%** |

These categories cover 601 project source files. MiniDoc loads 614 files,
including imported standard-library dependencies, and recognizes 35,218 symbols.
The coverage denominator also includes parameter contracts, so it is larger
than the symbol count.

Coverage measures the presence of documentation. It does not prove that every
description is semantically correct. This pass reviewed 80 function contracts,
associated fields, and record summaries against their implementations; the
remaining API surface still benefits from implementation-based review.

## Semantic corrections

| Area | Corrected contract |
| --- | --- |
| Client parsing | Six `protocol` fields hold parser runtime objects, not protocol version numbers. Actual numeric protocol fields were left intact. |
| UDP ingress | Receive capacity is measured in bytes. The ingress callbacks receive a services record, while the network-pump callbacks receive the configured context. |
| QVM interpreter | The code array contains decoded operations and rewritten branch offsets. Widths count immediate bytes excluding the opcode; step counters accumulate across calls. |
| QVM memory and files | Pointer masking and bounds, null handling, zero-capacity behavior, exact versus terminated writes, truncation, the 272-byte cvar layout, callback arguments, and file results are explicit. |
| Server commands | Reliable flood control can advance sequence state while suppressing game dispatch. Message processing documents its actual result categories. `rcon` callbacks receive unverified requests and own authentication. |
| PK3 archives | Names preserve ZIP spelling; offsets and prefix sizes have explicit byte units. Loose files use the `-1` directory sentinel. `modArchive` is an archive record or `void`. Search precedence, retained entries, decompression, and CRC checks are described. |
| Audio | WAVE decoding documents format limits and independent PCM ownership. Spatial mixing documents the listener right vector, source grouping, gain behavior, and cursor preservation for disabled or inaudible sources. |
| Models and rendering | MD3 vertices are model-local and shader entries are names. Viewports retain offscreen portions. Projected depth uses `(Z+W)/(2W)` and is not ordinary NDC Z. |
| Collision | Plane metadata, normal ownership and normalization assumptions, sweep units, and the distinction between `startsolid`, leaving a brush, and `allsolid` are explicit. |

The pass changes 21 MiniLang source files, with 584 added and 437 removed
comment lines. No MiniQuake3 executable statements were changed.

## Source integrity and warning policy

All 601 baseline source blobs were checked against the published `caef716`
Git tree. Of these files, 580 remain byte-identical. For the 21 modified files:

- Removing complete comment-only lines leaves identical source text, including
  all remaining blank lines.
- The Python compiler token sequences are identical after collapsing repeated
  newline tokens. Statement-separating newline boundaries remain represented.
- Parsed AST dataclass fields are identical after excluding source positions.
- `git diff --check` passes.

The comparison used the Windows x64 preprocessing target and the MiniLang
Python compiler from `8e64c9cfda92199b68ac5d3974fea445f12f6c39`.
This proof covers the semantic-correction pass from `caef716` to `14417c8`;
it does not retroactively claim additional checks for older commits.

The separate strict analysis completed successfully with zero warnings and
zero errors. `minidoc.toml` keeps `strict = true`, public contract and summary
quality checks, internal declaration inclusion, complete source-root scanning,
and the duplicate-summary threshold of 10. No warnings were suppressed to
reach the coverage figures.

## Graph generation repair

The interrupted previous local rendering lacked the Markdown call-graph page,
its SVG, and the Markdown output manifest. MiniDoc 0.4.9 replaces repeated
symbol, ownership, node, and edge searches with transient indexes while
preserving graph traversal and output ordering. Both output formats are
regenerated from the reviewed source revision.

MiniDoc's full suite passed 145 checks. Fifteen SVG fixtures compare the old
and new renderer byte for byte; a further scale regression exercises 35,002
symbols and 12,000 repeated calls. In the measured small graph case, elapsed
time fell from 0.329253 to 0.005107 seconds. This isolated graph measurement
does not establish an equivalent speedup for complete documentation generation.
The [MiniDoc graph report](https://github.com/MiniLangProject/MiniDoc/blob/main/docs/verification/GRAPH_INDEXING_2026-11-26.md)
contains the fixtures, build pins, reproduction commands, and limits.

## Reproduction

With complete sibling MiniDoc and MiniLangCompilerML checkouts at the revisions
above, run from the MiniQuake3 repository:

```sh
../MiniDoc/build/minidoc --config minidoc.toml -I ../MiniLangCompilerML \
  --strict --revision 14417c8e9832465a943c7d628f8124feec06983d
python3 docs/verification/verify_minidoc.py \
  --revision 14417c8e9832465a943c7d628f8124feec06983d \
  --generator-version 0.4.9
```

Use `build/minidoc.exe` and `python` on Windows. Timestamps remain disabled by
the project configuration. The verifier checks both manifests, required and
nonempty output files, local links, anchors, search-result targets, HTML closing
structure, JSON parsing, and SVG XML parsing. It exits nonzero on defects.

These checks validate documentation and source integrity. They do not claim a
new Windows gameplay, rendering, audio, or multiplayer acceptance run.

## Completed generation and output validation

The complete HTML and Markdown run finished with **exit code 0** in
**530.746 seconds** on Linux, using the released
self-hosted MiniLang compiler 1.3.11. The native generator has SHA-256
`c93e4a45e65e06f8096bf146a3c4f9b360523c6816216a783af122b53f81c55a`. Its 145-check suite passed before this run.

```text
MiniDoc: 614 file(s), 35218 symbol(s), 0 warning(s).
```

| Output validation | Result |
| --- | ---: |
| Generated files, excluding manifests | 5,613 |
| Output manifests | 2 |
| Local links, including search results | 259,418 |
| Fragment references | 199,893 |
| JSON files | 1 |
| SVG files | 4 |
| Defects | **0** |

The call-graph pages, both SVG copies, and both output manifests are present.
The counts, source comparison, compiler digests, and generation results are
stored in [the machine-readable verification record](minidoc-2026-11-26-validation.json).

An earlier attempt in this continuation, built with the Python compiler 1.3.10,
stopped with exit code 2 during an HTML write and left a 4,096-byte partial
page. The isolated page and bounded file/GC stress probes passed. The successful
run used the released native compiler and a separate temporary output filesystem
while monitoring libc writes. Because both the compiler and output location
changed, the cause of the earlier interruption has not been established.
The partial output was not published as a completed reference.
