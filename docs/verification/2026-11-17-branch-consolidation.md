# Branch consolidation — 17 November 2026

## Canonical branch: master

The owner clarified that the intended branch is **master**, not main.
`master` remains the repository default and is now the only branch.
No default-branch or visibility change was performed by this correction.

The earlier operation fast-forwarded main from
`bdeaf3bb01c09c75489a805dbe1f934f088d8e41` to the verified baseline
`0a8e16cb160d2c610d8cab873fe656c4615a5e2f` and added housekeeping-only commits.
The correction preserves that history on master without rewriting any commit,
restores the audit/storage push filters to master, and retains retail
acceptance as an explicit manual workflow.

Runtime sources, native sources, tests, scripts and PORT_LEDGER.json are
unchanged from the verified baseline. The unaccepted desktop integration
candidate is not silently merged. See `2026-11-17-core-storage-acceptance.md`.

## Archived and deleted branches

Run `44036694389` completed the first exact-head-guarded cleanup. Each deleted
head below remains accessible through its archive tag.

| Deleted branch | Preserved commit | Archive tag |
|---|---|---|
| `docs/readme-refresh-20261116` | `e4cb867ffebd953c89e2e07bf29eeb409650feed` | `archive/2026-11-17/docs/readme-refresh-20261116` |
| `fix/audit-core-20261117` | `867be390645579dbfba8648f961b4141c2dc1393` | `archive/2026-11-17/fix/audit-core-20261117` |
| `fix/desktop-storage-20261117` | `3a36b77b47af22315ff0fd7f4419f8761e421535` | `archive/2026-11-17/fix/desktop-storage-20261117` |
| `test/audit-fixes-20261117` | `9e9d13677af30c5debab5cdb212acc1d6b03ae29` | `archive/2026-11-17/test/audit-fixes-20261117` |
| `test/retail-start-20261116` | `04a6da539ddae5f4de0efc993c09b90536429083` | `archive/2026-11-17/test/retail-start-20261116` |
| `main` | `03f20a57778a5be8fe12af3e1ead3e8db99ada7e` | `archive/2026-11-17/main` |

The docs/fix heads and temporary main history are contained in master. The two
test heads remain archives only; their experimental workflows and transfer
files are not activated on master.

## Completed master correction

Commit `3195b1c03dd3a1c59907dd018080769b0c8d0d11` was pushed to master as a
fast-forward, preserving the temporary main history and correcting CI filters.
Run `44037486793` then completed successfully and archived/deleted only main.
A fresh branch listing confirmed that only master remained; a fresh tag listing
confirmed all six archive refs and their exact SHAs.

The cleanup verified that main was not the default, protected, moved, or the
head of an open pull request. It checked that the exact main commit was an
ancestor of the corrected master commit and that runtime sources did not
change. Archive creation and branch deletion used one atomic push with an
exact SHA lease. No commit history was overwritten.

The temporary write-enabled cleanup workflow has been removed after success.
Its code remains in Git history and its execution report is retained in the
workflow artifacts. The ordinary regression jobs retain read-only repository
permissions and continue targeting master.
