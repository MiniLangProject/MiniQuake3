# MiniDoc warning cleanup — 2026-11-26

The original MiniDoc 0.4.8 report contained **24,889 warnings**. The completed
strict generation reports **zero warnings and zero errors** with the same
project source roots, target, dependency mode, contract scope, summary-quality
scope, and duplicate-summary threshold.

## Results

| Diagnostic | Previous count | Current count | Repair |
| --- | ---: | ---: | --- |
| MD2201 | 12,570 | 0 | Added missing public declaration summaries. |
| MD2104 | 12,092 | 0 | Completed the parameter contracts at each reported declaration. |
| MD2105 | 225 | 0 | Documented explicitly declared non-void return contracts. |
| MD1201 | 2 | 0 | Added the project SPDX license identifier to the two uncovered files. |
| **Total** | **24,889** | **0** | |

MD2104 counts affected declarations, not individual parameters. Documentation
uses English `///` comments and preserves all pre-existing comments. Dynamic
return values are described in prose; `@returns` is reserved for signatures
with an explicit non-void return type, as required by MiniDoc 0.4.8.

The license headers were added to
`src/mq3/renderer/world_select_probe.ml` and
`src/mq3/server/snapshot_schedule.ml`.

## Source and policy integrity

- Source commit: [`def02f0462aedc0e67fda899f3eced4f535ecb77`](https://github.com/MiniLangProject/MiniQuake3/commit/def02f0462aedc0e67fda899f3eced4f535ecb77).
- Original report commit: `a3d4e611be26193223a76ebae62758ef6a3db5f2`.
- Project-owned MiniLang source files: **601**.
- Added comment lines: **46,455**.
- Compiler token streams: identical for every source file, retaining meaningful newline boundaries.
- Parsed program structures: identical for every source file using the MiniLang Python compiler parser.
- Source diffs contain only comment additions; the executable program is unchanged.
- `strict = true` is enabled in `minidoc.toml`.
- Contract and summary-quality checks remain `public`; internal declarations remain included.
- `reachable_only = false` and `duplicate_summary_threshold = 10` remain unchanged.

Forwarding APIs identify their real targets. Record documentation identifies
the stored fields. Reviewed engine contracts explain argument roles, units,
mutable state, callback conventions, validation paths, and native result codes.
Native adapters were checked against the C implementation, including buffer
capacities and the distinction between byte counts and element counts.

This was a documentation repair. Validation covers source equivalence and the
documentation pipeline; it does not claim a new Windows gameplay or rendering
acceptance run.

## Strict generation

MiniDoc version: **0.4.8**. The unchanged generator executable has SHA-256
`f17cb72f1261d10ece9b00c686cdd43663ed736e125e8b5efdbb5cb419c00ecd`.

From the MiniQuake3 repository, with sibling MiniDoc and MiniLangCompilerML
checkouts:

```sh
../MiniDoc/build/minidoc --config minidoc.toml -I ../MiniLangCompilerML --strict --revision def02f0462aedc0e67fda899f3eced4f535ecb77
```

Final output:

```text
MiniDoc: 614 file(s), 35218 symbol(s), 0 warning(s).
```

Exit code: **0**. The **614** loaded files include **601**
project files plus imported compiler standard-library dependencies. Both
renderers were generated from the source commit above with timestamps disabled.

## Generated-reference validation

- Generated files checked: **5,613** (excluding the two output manifests).
- Local links checked: **257,794**.
- Fragment references checked: **199,893**.
- JSON files checked: **1**.
- Missing files, malformed manifests, duplicate anchors, broken local links,
  broken fragments, and wrong generator versions: **0 defects**.
- [Current diagnostics](../api/markdown/Diagnostics.md).
- [Current metrics](../api/markdown/Metrics.md).

## Documentation coverage

| Category | Documented | Total | Coverage |
| --- | ---: | ---: | ---: |
| API declarations | 14452 | 14452 | 100% |
| Constants | 28 | 7135 | 0.39% |
| Fields | 0 | 13257 | 0% |
| Overall | 47116 | 67480 | 69.82% |
| Parameters | 32636 | 32636 | 100% |

API summaries and parameters are covered by the warning policy. The overall
coverage metric also includes constants and individual data fields, which
MiniDoc counts separately from the declaration summaries and does not require
for these warning rules. Zero warnings therefore does not imply that every
constant or field has a standalone comment.
