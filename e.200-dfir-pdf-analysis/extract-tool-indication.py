#!/usr/bin/env python3

import argparse
import re
from pathlib import Path


def extract_signature_objects(pdf_path: Path) -> None:
    data = pdf_path.read_text(errors="ignore")

    sig_objects = re.findall(
        r"(\d+\s+\d+\s+obj\s*<<.*?/Type\s*/Sig.*?endobj)",
        data,
        flags=re.S,
    )

    if not sig_objects:
        print(f"No /Type /Sig objects found in {pdf_path}")
        return

    for obj in sig_objects:
        obj_id = re.match(r"\d+\s+\d+\s+obj", obj).group(0)
        print(f"\n==== {obj_id} ====")

        for key in [
            "/Filter",
            "/SubFilter",
            "/Name",
            "/Reason",
            "/M",
            "/ContactInfo",
            "/Location",
        ]:
            m = re.search(
                re.escape(key) + r"\s+(\([^\)]*\)|/[^\s<>\[\]/]+|<[^>]*>)",
                obj,
            )
            if m:
                print(f"{key}: {m.group(1)}")

        pb = re.search(r"/Prop_Build\s*<<(.*?)>>\s*", obj, flags=re.S)
        if pb:
            print("/Prop_Build:")
            print(pb.group(1).strip())


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract PDF signature dictionaries and likely signing-tool indicators."
    )
    parser.add_argument(
        "filename",
        help="PDF file to inspect, for example: signed-by-two.pdf",
    )
    args = parser.parse_args()

    pdf_path = Path(args.filename)
    if not pdf_path.is_file():
        raise SystemExit(f"Error: file not found: {pdf_path}")

    extract_signature_objects(pdf_path)


if __name__ == "__main__":
    main()
