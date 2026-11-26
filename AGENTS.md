# Repository workflow

- `main` is the sole maintained branch and the repository default. Fetch the
  current `origin/main` before publishing changes. Do not recreate `master` or
  the retired topic branches unless the user explicitly requests it.
- Preserve and update source documentation when changing an API or its behavior.
- Build, test, and prepare releases locally. Do not add GitHub Actions workflows.
