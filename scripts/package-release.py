#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
import shutil
import sys
import tempfile
import zipfile
from pathlib import Path

PROJECT_PREFIX = "ISEP_DEE_MEEC_Thesis_Template"

ROOT_FILES = (
    "main.tex",
    "preamble.tex",
    "sampleRefs.bib",
    "DEEclass.cls",
    "README.md",
    "README.en.md",
    "LICENSE",
)

ROOT_DIRECTORIES = (
    "chapters",
    "front",
    "figures",
)

REFERENCE_PDFS = {
    "PT": "ISEP_DEE_MEEC_Thesis_Template_PT.pdf",
    "EN": "ISEP_DEE_MEEC_Thesis_Template_EN.pdf",
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create the curated student release ZIP."
    )
    parser.add_argument("--tag", required=True)
    parser.add_argument("--pt-pdf", required=True, type=Path)
    parser.add_argument("--en-pdf", required=True, type=Path)
    parser.add_argument(
        "--output-dir", default=Path("dist"), type=Path
    )
    return parser.parse_args()


def validate_tag(tag):
    match = re.fullmatch(r"v(\d+\.\d+(?:\.\d+)?)", tag)
    if not match:
        raise ValueError(
            f"Invalid release tag '{tag}'. Expected v2.0 or v2.0.1."
        )
    return match.group(1)


def require_path(path, description):
    if not path.exists():
        raise FileNotFoundError(f"Missing {description}: {path}")


def copy_release_content(project_dir):
    for filename in ROOT_FILES:
        source = Path(filename)
        require_path(source, "release file")
        shutil.copy2(source, project_dir / source.name)

    ignore = shutil.ignore_patterns(
        "*.aux", "*.bbl", "*.bcf", "*.blg", "*.fdb_latexmk",
        "*.fls", "*.glg", "*.glo", "*.gls", "*.glsdefs", "*.ist",
        "*.lof", "*.log", "*.lot", "*.out", "*.run.xml",
        "*.synctex.gz", "*.toc", "__pycache__", ".DS_Store"
    )

    for dirname in ROOT_DIRECTORIES:
        source = Path(dirname)
        require_path(source, "release directory")
        if not source.is_dir():
            raise NotADirectoryError(f"Expected a directory: {source}")
        shutil.copytree(source, project_dir / source.name, ignore=ignore)


def add_reference_pdfs(project_dir, pt_pdf, en_pdf):
    require_path(pt_pdf, "Portuguese reference PDF")
    require_path(en_pdf, "English reference PDF")

    if pt_pdf.stat().st_size == 0:
        raise ValueError(f"Portuguese reference PDF is empty: {pt_pdf}")
    if en_pdf.stat().st_size == 0:
        raise ValueError(f"English reference PDF is empty: {en_pdf}")

    examples = project_dir / "examples"
    examples.mkdir()

    shutil.copy2(pt_pdf, examples / REFERENCE_PDFS["PT"])
    shutil.copy2(en_pdf, examples / REFERENCE_PDFS["EN"])


def make_zip(project_dir, zip_path):
    zip_path.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(
        zip_path,
        "w",
        compression=zipfile.ZIP_DEFLATED,
        compresslevel=9,
    ) as archive:
        for path in sorted(project_dir.rglob("*")):
            if path.is_file():
                archive.write(
                    path,
                    arcname=path.relative_to(project_dir.parent),
                )


def main():
    args = parse_args()

    try:
        version = validate_tag(args.tag)
        package_name = f"{PROJECT_PREFIX}_v{version}"
        zip_path = args.output_dir / f"{package_name}.zip"

        if zip_path.exists():
            zip_path.unlink()

        with tempfile.TemporaryDirectory(prefix="meec-release-") as tmp:
            project_dir = Path(tmp) / package_name
            project_dir.mkdir()

            copy_release_content(project_dir)
            add_reference_pdfs(project_dir, args.pt_pdf, args.en_pdf)
            make_zip(project_dir, zip_path)

        if not zip_path.exists() or zip_path.stat().st_size == 0:
            raise RuntimeError("Release ZIP was not created correctly.")

        print(f"Created: {zip_path}")
        return 0

    except Exception as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
