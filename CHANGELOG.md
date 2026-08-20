# Changelog

All notable changes to the ISEP DEE MEEC Thesis Template will be documented in this file.

The project adopts [Semantic Versioning](https://semver.org/) from the v2.0.0 GitHub release onward.

## [Unreleased]

### Added

- GitHub repository infrastructure for maintained public releases.
- Project documentation, contribution guidance, citation metadata, and release history.
- Automated build and release infrastructure is planned before the v2.0.0 tag.

### Changed

- Distribution is being migrated from the previous Overleaf-based model to GitHub as the authoritative source.
- Student releases will be distributed as curated versioned ZIP packages.

## [2.0.0] - TBD

First formally versioned GitHub release of the ISEP DEE MEEC Thesis Template.

### Added

- Formal Semantic Versioning.
- GitHub-based source repository and release distribution.
- Curated student release package.
- Automated institutional title and front-matter generation.
- Centralised dissertation metadata and validation.
- Configurable submission-date handling.
- Automatic academic-integrity declaration.
- Generative-AI declaration and associated material.
- Project documentation and provenance records.

### Changed

- Major architectural evolution relative to the original 2021 template.
- Title/front-matter generation is handled by `DEEclass.cls`.
- The legacy separate `title.tex` workflow is no longer used.
- Repository and release structure are designed for both Overleaf import and local LaTeX development.

### Removed

- Legacy `title.tex`-based title-page workflow.

---

## Historical development

The template existed and evolved from 2021 to 2026 before formal GitHub versioning. Those versions are documented historically rather than being assigned retrospective Git tags. See [HISTORY.md](HISTORY.md).
