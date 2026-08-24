# Maintainer Guide

This document describes the maintenance infrastructure of the ISEP DEE MEEC LaTeX Thesis Template.

For the step-by-step procedure for publishing a release, see [Releasing](releasing.md).

## Repository roles

The repository contains two broad categories of content:

- **student template files**, which are packaged into each release;
- **project-maintenance files**, which support development, validation, documentation and release automation but are not included in the student ZIP.

The student release package is generated automatically and should not be assembled manually.

## Continuous integration

The repository uses GitHub Actions to verify that the template compiles correctly. The build workflow is defined in:

```text
.github/workflows/build.yml
```

It runs automatically when changes are pushed to `main`, for pull requests and when manually triggered from the GitHub web interface. The workflow compiles the template independently in Portuguese and English.

A successful run produces two temporary workflow artifacts:

```text
template-PT
template-EN
```

These artifacts are intended for validation and are not the official student release package.

### Running the build manually

From the GitHub web interface:

```text
Repository
→ Actions
→ Build template
→ Run workflow
```

Select the required branch, normally `main`, and start the workflow. A successful build should show both `Build Portuguese` and `Build English` in green.

## Release automation

The release workflow is defined in:

```text
.github/workflows/release.yml
```

It is triggered automatically when a GitHub Release is published. The workflow checks out the exact tagged source, validates the tag, creates temporary PT/EN build entry points, compiles and verifies both reference PDFs, runs `scripts/package-release.py`, creates the curated student ZIP and attaches it to the corresponding GitHub Release.

The reference PDFs are therefore generated from exactly the same tagged source code that is distributed in the release.

## Release packaging script

The student package is assembled by:

```text
scripts/package-release.py
```

The script deliberately includes only files and directories intended for students. Repository-maintenance files such as `.github/`, `docs/`, `scripts/`, development history and CI configuration are excluded.

For `vX.Y`, the resulting package is `ISEP_DEE_MEEC_Thesis_Template_vX.Y.zip`.

## Student package contents

```text
ISEP_DEE_MEEC_Thesis_Template_vX.Y/
├── main.tex
├── preamble.tex
├── sampleRefs.bib
├── DEEclass.cls
├── chapters/
├── front/
├── figures/
├── examples/
│   ├── ISEP_DEE_MEEC_Thesis_Template_PT.pdf
│   └── ISEP_DEE_MEEC_Thesis_Template_EN.pdf
├── README.md
├── README.en.md
└── LICENSE
```

If the intended student package structure changes, update `scripts/package-release.py` and the relevant documentation together.

## Working with forks

GitHub forks inherit the workflow files stored in `.github/workflows/`, but GitHub Actions may need to be enabled explicitly for the fork. A fork maintainer should first open:

```text
Repository
→ Actions
```

and enable workflows if GitHub displays a prompt.

Repository Actions settings can be reviewed under:

```text
Repository
→ Settings
→ Actions
→ General
```

The release workflow declares `contents: write` permission so it can attach the generated ZIP to a GitHub Release. Fork maintainers should ensure that repository or organization policies permit the workflow to run with the required permissions.

## Modifying the workflows

Changes to the build or release workflows should be tested before a stable release is published. Changes affecting the TeX Live version, LaTeX compilation Action, language-selection mechanism, tag validation, package contents, reference PDF filenames, package naming or release upload mechanism should be treated as release-infrastructure changes.

After changing `build.yml`, run it manually and inspect both language builds. After changing the release pipeline, use a release candidate such as `vX.Y-rc1` to validate the complete process before publishing the stable release.

## General maintenance principle

The `main` branch should remain in a state that successfully passes the build workflow. A stable release should only be created from a known-good commit for which both Portuguese and English builds have succeeded.

For the complete release procedure and checklist, see [Releasing](releasing.md).
