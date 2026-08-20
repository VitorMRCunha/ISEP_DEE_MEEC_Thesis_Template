# ISEP DEE MEEC LaTeX Thesis Template

A maintained LaTeX dissertation template for the Master's Programme in Electrical and Computer Engineering (MEEC) at the Instituto Superior de Engenharia do Porto (ISEP).

> **Current development target:** v2.0.0 — first formally versioned GitHub release.

[![License: LPPL 1.3c](https://img.shields.io/badge/License-LPPL%201.3c-blue.svg)](LICENSE)
[![Release](https://img.shields.io/badge/release-v2.0.0--dev-orange.svg)](CHANGELOG.md)

## Overview

The MEEC Thesis Template provides a ready-to-use LaTeX structure for MEEC dissertations, including institutional formatting, automated title/front matter, dissertation metadata, bibliography management, glossaries and acronym/symbol lists and  academic-integrity declarations.

The project originated in 2021 as an adaptation of the LaTeXTemplates 'Masters/Doctoral Thesis' template available at that time. Since then, the template has undergone extensive independent development, redesign, institutional adaptation and maintenance by Vítor M. R. Cunha. No later upstream versions have knowingly been incorporated after the initial 2021 derivation.

## Main features

- Portuguese or English as the main document language.
- MEEC specialisation selection through class options.
- Automatic cover pages and institutional front matter.
- Centralised dissertation metadata.
- Validation of mandatory metadata.
- Draft and final-document modes.
- Automatic academic-integrity declaration.
- BibLaTeX/Biber bibliography support.

## Template structure

The student-facing template is intentionally compact:

```text
ISEP_DEE_MEEC_Thesis_Template_v2.0.0/
├── main.tex
├── DEEclass.cls
├── sampleRefs.bib
├── preamble.tex
├── chapters/
├── front/
├── figures/
├── README.md
└── LICENSE
```

The GitHub repository additionally contains project-maintenance files, documentation, CI/release workflows and development history. These files are not required in the student release package.

## Quick start

### Overleaf or similar online editors

1. Download the latest `ISEP_DEE_MEEC_Thesis_Template_vX.Y.Z.zip` asset from the GitHub Releases page.
2. Create a new project by uploading the ZIP.
3. Set `main.tex` as the main document if the platform does not detect it automatically.
4. Compile the project.
5. Edit the metadata and sample content for your dissertation.

The GitHub repository is the authoritative distribution source. Overleaf is supported only as a editing and compilation workflow.

### Local LaTeX installation

Install a current TeX distribution such as:
- **Windows:** [TeX Live](www.tug.org) or [MikTeX](miktex.org),
- **macOS:** [MacTeX](www.tug.org/mactex/) or [MikTeX](miktex.org),
- **Linux:** [TeX Live](www.tug.org) or [MikTeX](miktex.org),

together with an editor such as TeXstudio, TeXmaker or VS Code with a LaTeX extension.

Open `main.tex` and use the editor's normal build workflow. The template uses BibLaTeX/Biber and glossary tooling, so ensure these are available in the installed TeX distribution.


## Configuration and use

Consider the following files and directories:

- `main.tex` — document configuration, metadata and document structure;
- `preamble.tex` — user-specific packages and custom commands where appropriate;
- `front/` — front-matter content;
- `chapters/` — dissertation chapters and appendices as configured by the template;
- `figures/` — figures and graphical assets;
- `sampleRefs.bib` — example bibliography database, which may be renamed or replaced.


## Versioning

**v2.0.0** will be the first formally versioned GitHub release. The v2 designation reflects the transition from the template's 2021–2026 Overleaf-based development period to a maintained software release with formal versioning, documentation, automated validation and packaged releases.

See [CHANGELOG.md](CHANGELOG.md).

## Reporting problems

Before opening an issue:

1. verify that the problem occurs with the latest tagged release;
2. perform a clean rebuild;
3. confirm that Biber and the required glossary tools are installed;
4. check that mandatory metadata is defined;
5. reduce the problem to a minimal reproducible example when possible.

A useful report includes the template version, operating system, TeX distribution/version, editor or compilation command, relevant log output and the smallest set of files needed to reproduce the problem.

## Citation

Citation metadata is provided in [CITATION.cff](CITATION.cff). A DOI may be added to future releases if the project is archived through a service such as Zenodo.

## Licence and provenance

The template software is distributed under the **LaTeX Project Public License (LPPL), version 1.3c or later**, unless an individual file states otherwise.

The work has LPPL maintenance status `maintained`, with **Vítor M. R. Cunha** as Current Maintainer.

See [LICENSE](LICENSE) for licensing information and [NOTICE.md](NOTICE.md) for provenance and attribution.

Dissertations and other original works created using this template are not automatically licensed under the template's licence.

## Disclaimer

This repository is provided without warranty. Institutional names, logos, trademarks and visual-identity assets remain subject to the rights and policies of their respective owners. Repository publication does not by itself imply official institutional endorsement unless that status is explicitly documented.
