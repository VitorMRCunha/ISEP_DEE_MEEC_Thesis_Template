# ISEP DEE MEEC LaTeX Thesis Template

[Português](README.md) | **English**

A maintained LaTeX dissertation template for the Master's Programme in Electrical and Computer Engineering (MEEC) at the Instituto Superior de Engenharia do Porto (ISEP).

> **Current release: v2.0 [Releases do GitHub](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases)**
> 
[![License: LPPL 1.3c](https://img.shields.io/badge/License-LPPL%201.3c-blue.svg)](LICENSE)
[![Release](https://img.shields.io/badge/release-v2.0-orange.svg)](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases)

## Overview

The MEEC Thesis Template provides a ready-to-use LaTeX structure for MEEC dissertations, including institutional formatting, automated title/front matter, dissertation metadata, bibliography management, glossaries, acronym and symbol lists, and academic-integrity declarations.

The project originated in 2021 as an adaptation of the LaTeXTemplates *Masters/Doctoral Thesis* template available at that time. Since then, the template has undergone extensive independent development, redesign, institutional adaptation and maintenance by Vítor M. R. Cunha.

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

The template release ZIP file has the following contents:

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
├── README.md
├── README.en.md
└── LICENSE
```

The GitHub repository additionally contains project-maintenance files, documentation, CI/release workflows and development history. These files are not required in the student release package.

## Quick start

### Overleaf or similar online editors

You can start a project using either of the following methods:

**Option A — Import from GitHub**

1. Fork the [ISEP DEE MEEC Thesis Template repository](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template) to your GitHub account.
2. Create a new project in the online LaTeX editor by importing the forked GitHub repository.
3. Set `main.tex` as the main document if the platform does not detect it automatically.
4. Compile the project.
5. Compare the generated document with the corresponding reference PDF in the `examples/` folder (PT or EN) to confirm that the template is being rendered correctly.
6. Read the generated document before replacing the sample content. It contains rules, guidelines and LaTeX examples for preparing the dissertation.
7. Edit the metadata and sample content for your dissertation.

**Option B — Upload a release ZIP**

1. Download the latest `ISEP_DEE_MEEC_Thesis_Template_vX.Y.zip` from the [GitHub Releases](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases) page.
2. Create a new project by uploading the ZIP to the online LaTeX editor.
3. Follow steps 3–7 above.

**The GitHub repository is the authoritative distribution source**. Overleaf is still supported as an editing and compilation workflow.

### Local LaTeX installation

1. Install a current TeX distribution such as:
   - Windows: [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/);
   - macOS: [MacTeX](https://www.tug.org/mactex/) or [MiKTeX](https://miktex.org/);
   - Linux: [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/).

   Use it together with a LaTeX editor such as TeXstudio, TeXmaker or VS Code with a LaTeX extension.

2. Download the latest `ISEP_DEE_MEEC_Thesis_Template_vX.Y.zip` from the [GitHub Releases](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases) page.
3. Unzip the file, preserving the file and directory structure.
4. Open `main.tex` and use the editor's normal build workflow. The template uses BibLaTeX/Biber and glossary tooling, so ensure these are available in the installed TeX distribution.
5. Compare the generated document with the corresponding reference PDF in the `examples/` folder (PT or EN) to confirm that the template is being rendered correctly.
6. Read the generated document before replacing the sample content. It contains rules, guidelines and LaTeX examples for preparing the dissertation.
7. Edit the metadata and sample content for your dissertation.

### Read the generated template PDF

The PDF produced by compiling the unmodified template is not only an example document. It is also part of the template documentation and should be read before starting the dissertation.

The sample document contains rules, recommendations and practical guidance for preparing an MEEC dissertation, together with examples of the corresponding LaTeX source. These examples illustrate how to use common document elements and template features correctly.

Students should therefore compile the template and review the generated PDF before deleting or replacing the sample chapters. The generated document and its LaTeX source are intended to be used together:

- the PDF explains rules, recommendations and expected presentation;
- the `.tex` source files provide practical LaTeX examples implementing them.

Keeping an untouched copy of the original template release can be useful for later reference.

## Configuration and use

Consider the following files and directories:

- `main.tex` — document configuration, metadata and document structure;
- `preamble.tex` — user-specific packages and custom commands where appropriate;
- `sampleRefs.bib` — example bibliography database, which may be renamed or replaced;
- `front/` — front-matter content;
- `chapters/` — dissertation chapters and appendices as independent `.tex` files;
- `figures/` — figures and graphical assets.

## Versioning

**v2.0** is be the first formally versioned GitHub release. The v2 designation reflects the transition from the template's 2021–2026 Overleaf-based development period to a maintained software release with formal versioning, documentation, automated validation and packaged releases.

See [CHANGELOG.md](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/CHANGELOG.md).

## Reporting problems

Before opening an issue:

1. verify that the problem occurs with the latest tagged release;
2. perform a clean rebuild;
3. confirm that Biber and the required glossary tools are installed;
4. check that mandatory metadata is defined;
5. reduce the problem to a minimal reproducible example when possible.

A useful report includes the template version, operating system, TeX distribution/version, editor or compilation command, relevant log output and the smallest set of files needed to reproduce the problem.

## Citation

Citation metadata is provided in [CITATION.cff](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/CITATION.cff). A DOI may be added to future releases if the project is archived through a service such as Zenodo.

## Licence and provenance

The template software is distributed under the **LaTeX Project Public License (LPPL), version 1.3c or later**, unless an individual file states otherwise.

The work has LPPL maintenance status `maintained`, with **Vítor M. R. Cunha** as Current Maintainer.

See [LICENSE](LICENSE) for licensing information and [NOTICE.md](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/NOTICE.md) for provenance and attribution.

Dissertations and other original works created using this template are not automatically licensed under the template's licence.

## Disclaimer

This repository is provided without warranty. Institutional names, logos, trademarks and visual-identity assets remain subject to the rights and policies of their respective owners. Repository publication does not by itself imply official institutional endorsement unless that status is explicitly documented.
