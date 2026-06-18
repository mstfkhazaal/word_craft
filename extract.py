#!/usr/bin/env python3
from __future__ import annotations

import argparse
import sys
from pathlib import Path


SUPPORTED_EXTENSIONS: set[str] = {
    ".dart",
    ".md",
    ".yaml",
    ".yml",
}

LANGUAGE_BY_EXTENSION: dict[str, str] = {
    ".dart": "dart",
    ".md": "md",
    ".yaml": "yaml",
    ".yml": "yaml",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Merge .dart, .md, .yaml, and .yml files into one output.txt file."
    )
    parser.add_argument(
        "path",
        type=str,
        help="Root path to search for files.",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=str,
        default="output.txt",
        help="Output file name or path. Default: output.txt",
    )
    parser.add_argument(
        "-e",
        "--exclude",
        nargs="*",
        default=[],
        help="Directory names or relative paths to exclude.",
    )

    return parser.parse_args()


def normalize_path(value: str) -> str:
    return value.replace("\\", "/").strip("/")


def build_exclude_rules(excludes: list[str]) -> tuple[set[str], list[str]]:
    excluded_names: set[str] = set()
    excluded_paths: list[str] = []

    for item in excludes:
        cleaned = normalize_path(item)

        if not cleaned:
            continue

        if "/" in cleaned:
            excluded_paths.append(cleaned)
        else:
            excluded_names.add(cleaned)

    return excluded_names, excluded_paths


def is_excluded(
    relative_path: Path,
    excluded_names: set[str],
    excluded_paths: list[str],
) -> bool:
    relative_str = relative_path.as_posix()

    for part in relative_path.parts:
        if part in excluded_names:
            return True

    for excluded_path in excluded_paths:
        if relative_str == excluded_path or relative_str.startswith(excluded_path + "/"):
            return True

    return False


def collect_files(root: Path, output_file: Path, excludes: list[str]) -> list[Path]:
    excluded_names, excluded_paths = build_exclude_rules(excludes)
    files: list[Path] = []

    for file_path in root.rglob("*"):
        if not file_path.is_file():
            continue

        if file_path.resolve() == output_file.resolve():
            continue

        if file_path.suffix.lower() not in SUPPORTED_EXTENSIONS:
            continue

        relative_path = file_path.relative_to(root)

        if is_excluded(relative_path, excluded_names, excluded_paths):
            continue

        files.append(file_path)

    files.sort(key=lambda item: item.relative_to(root).as_posix().lower())

    return files


def read_file_content(file_path: Path) -> str:
    try:
        return file_path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return file_path.read_text(encoding="utf-8", errors="replace")


def get_fence_language(file_path: Path) -> str:
    return LANGUAGE_BY_EXTENSION.get(file_path.suffix.lower(), "")


def write_output(root: Path, files: list[Path], output_file: Path) -> None:
    output_file.parent.mkdir(parents=True, exist_ok=True)

    with output_file.open("w", encoding="utf-8", newline="\n") as handle:
        for index, file_path in enumerate(files):
            relative_path = file_path.relative_to(root).as_posix()
            content = read_file_content(file_path)
            language = get_fence_language(file_path)

            handle.write(f"{relative_path}\n")
            handle.write(f"```{language}\n")
            handle.write(content)

            if content and not content.endswith("\n"):
                handle.write("\n")

            handle.write("```\n")

            if index < len(files) - 1:
                handle.write("\n")


def main() -> int:
    args = parse_args()

    root = Path(args.path).resolve()
    output_file = Path(args.output).resolve()

    if not root.exists():
        print(f"Error: path does not exist: {root}", file=sys.stderr)
        return 1

    if not root.is_dir():
        print(f"Error: path is not a directory: {root}", file=sys.stderr)
        return 1

    files = collect_files(
        root=root,
        output_file=output_file,
        excludes=args.exclude,
    )

    if not files:
        print("No supported files found.")
        return 0

    write_output(
        root=root,
        files=files,
        output_file=output_file,
    )

    print(f"Done. Wrote {len(files)} files to: {output_file}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())