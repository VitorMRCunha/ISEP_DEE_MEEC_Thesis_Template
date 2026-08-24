# Releasing

This document describes the release procedure for the ISEP DEE MEEC LaTeX Thesis Template.

The release process is automated through GitHub Actions. Maintainers create and publish the GitHub Release; the workflow compiles the reference PDFs, creates the student ZIP and attaches it to the release automatically.

For an overview of the maintenance infrastructure, see [Maintainer Guide](maintainers.md).

## Version tags

The automated release workflow accepts stable and release-candidate tags.

Stable examples:

```text
v2.0
v2.0.1
v2.1
```

Release-candidate examples:

```text
v2.0-rc1
v2.0-rc2
v2.0.1-rc1
v2.1-rc1
```

Release candidates should be published as GitHub **Pre-releases**. Stable versions should be published as normal GitHub Releases.

The release tag determines the package name automatically. For example, `v2.1-rc1` produces `ISEP_DEE_MEEC_Thesis_Template_v2.1-rc1.zip`, while `v2.1` produces `ISEP_DEE_MEEC_Thesis_Template_v2.1.zip`.

## Before creating a release

Recommended checklist:

- [ ] All intended changes are committed to `main`.
- [ ] The `Build template` GitHub Actions workflow is green.
- [ ] Both Portuguese and English builds succeed.
- [ ] Generated PT and EN PDFs have been inspected when relevant.
- [ ] `CHANGELOG.md` has been updated.
- [ ] README version references have been updated where necessary.
- [ ] `CITATION.cff` version and release date have been updated when appropriate.
- [ ] Licence and provenance information remains correct.
- [ ] A release candidate has been tested when the release contains significant template or infrastructure changes.

Do not manually build or upload the student ZIP. The release workflow generates it.

## Creating a release candidate

From the repository, open:

```text
Repository
→ Releases
→ Draft a new release
```

Choose **Choose a tag** and enter a tag such as `v2.1-rc1`. If it does not exist, create it when publishing the release. The target should normally be `main`.

Use a release title such as:

```text
ISEP DEE MEEC Thesis Template v2.1-rc1
```

Add release notes, enable **Set as a pre-release**, and publish the release. Do not treat the release candidate as the latest stable release.

Publishing triggers `.github/workflows/release.yml`. No student ZIP should be uploaded manually.

## Monitoring the automated release

After publishing, open:

```text
Repository
→ Actions
→ Package published release
```

The workflow should complete:

```text
Check out released source
        ↓
Validate release tag
        ↓
Create Portuguese and English build sources
        ↓
Compile Portuguese reference PDF
        ↓
Compile English reference PDF
        ↓
Verify reference PDFs
        ↓
Build student release ZIP
        ↓
Upload student ZIP to GitHub Release
```

All steps should succeed. If a step fails, inspect its Actions log and correct the underlying problem before proceeding.

## Verifying the generated package

When the workflow succeeds, return to the GitHub Release. Under **Assets**, GitHub will normally show the custom student ZIP plus `Source code (zip)` and `Source code (tar.gz)`.

The GitHub-generated source archives are repository snapshots and are **not** the curated student distribution. The official student package is the custom `ISEP_DEE_MEEC_Thesis_Template_vX.Y[...].zip` file.

For a release candidate, test the ZIP as a student would:

- [ ] Upload/import it into Overleaf or another supported online LaTeX editor.
- [ ] Confirm that `main.tex` can be used as the main document.
- [ ] Compile successfully.
- [ ] Compare the output with the appropriate PDF in `examples/`.
- [ ] Extract the ZIP locally.
- [ ] Compile `main.tex` using a current local TeX installation.
- [ ] Inspect both reference PDFs.
- [ ] Confirm that no maintainer-only files are present.

If problems are found, fix them on `main` and create the next candidate, for example `v2.1-rc2`.

## Publishing the stable release

Once the release candidate has been validated, repeat the pre-release checklist and make any final version/date updates required by the project.

Then open:

```text
Repository
→ Releases
→ Draft a new release
```

Create the stable tag, for example `v2.1`, add the final release notes, and **do not** mark it as a pre-release.

Publish it and monitor `Package published release` exactly as for a release candidate. When the workflow succeeds, verify that the custom student ZIP is attached.

## After publishing a stable release

Recommended final checks:

- [ ] The GitHub Release is visible as the intended stable release.
- [ ] The correct version tag is shown.
- [ ] The automated student ZIP is attached.
- [ ] The ZIP filename matches the release version.
- [ ] The ZIP contents are correct.
- [ ] PT and EN reference PDFs are included.
- [ ] The repository README points users to GitHub Releases as the distribution source.
- [ ] Development-version references are updated for the next development cycle when appropriate.

## Important distinction: release ZIP vs source archives

GitHub automatically creates `Source code (zip)` and `Source code (tar.gz)` for every tag. These contain repository snapshots and may include maintenance files students do not need.

They are not substitutes for the automated student package. The intended distribution is the custom ZIP produced by `scripts/package-release.py`.

## Release automation principle

A release should be reproducible from its Git tag. The reference PDFs and student ZIP are generated automatically from the tagged repository state rather than manually prepared in advance. This helps ensure that the documentation, compiled examples and source files distributed to students all correspond to the same release.
