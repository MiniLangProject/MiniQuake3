# Branch consolidation — 17 November 2026

## Main source line

At the owner's request, `main` was fast-forwarded by 22 commits from
`bdeaf3bb01c09c75489a805dbe1f934f088d8e41` to the verified `master` baseline
`0a8e16cb160d2c610d8cab873fe656c4615a5e2f`. No existing commits were rewritten.
The integrated PR #1 and PR #2 changes, English README, screenshots and
acceptance reports are therefore available on `main`.

This housekeeping does not integrate the still-unaccepted desktop candidate.
Runtime sources, native sources and tests are unchanged from the verified
baseline. See `2026-11-17-core-storage-acceptance.md` for the test scope.

## Archived and deleted branches

GitHub Actions run `44036694389` completed the exact-head-guarded cleanup.
Each branch below was preserved as a lightweight tag before deletion:

| Deleted branch | Preserved commit | Archive tag |
|---|---|---|
| `docs/readme-refresh-20261116` | `e4cb867ffebd953c89e2e07bf29eeb409650feed` | `archive/2026-11-17/docs/readme-refresh-20261116` |
| `fix/audit-core-20261117` | `867be390645579dbfba8648f961b4141c2dc1393` | `archive/2026-11-17/fix/audit-core-20261117` |
| `fix/desktop-storage-20261117` | `3a36b77b47af22315ff0fd7f4419f8761e421535` | `archive/2026-11-17/fix/desktop-storage-20261117` |
| `test/audit-fixes-20261117` | `9e9d13677af30c5debab5cdb212acc1d6b03ae29` | `archive/2026-11-17/test/audit-fixes-20261117` |
| `test/retail-start-20261116` | `04a6da539ddae5f4de0efc993c09b90536429083` | `archive/2026-11-17/test/retail-start-20261116` |

The first three branches were already contained in `main`. The two test
branches are retained as history only, not merged into the production tree.
Their experimental workflows and patch-transfer files were not activated on
`main`. Branch deletion used exact SHA leases; archive refs were verified
before the atomic deletion push. No open pull request or protected branch
was removed. The completed one-off write-enabled workflow is removed from
the current tree; it remains in Git history for auditability.

## CI migration

The audit and storage regression workflows now select `main` for pushes.
Retail acceptance remains an explicit `workflow_dispatch` operation rather
than retaining a trigger for a deleted branch. Existing read-only test jobs
and their commands are unchanged.

## Outstanding repository setting

The attempt to change GitHub's default branch from `master` to `main` returned
HTTP 403 with the available Actions credential. That permission denial was
not bypassed. `master` was therefore retained, as the current repository
default, at `0a8e16cb160d2c610d8cab873fe656c4615a5e2f`.
Only `main` and `master` remain as branches after this cleanup. A repository
administrator must switch the default to `main` before deleting `master`.
Repository visibility was not changed by this operation.
