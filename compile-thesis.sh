#!/bin/bash
# A script to compile the PhD Thesis
# Uses latexmk to run only the passes actually needed.
# Distributed under GPLv2.0 License

set -e

usage() {
	echo "Shell script for compiling the PhD Thesis"
	echo "Usage: ./compile-thesis.sh [OPTIONS] [filename]"
	echo "  compile [filename]   Compile via latexmk (default filename: thesis)"
	echo "  draft   [filename]   Fast draft pass (no figure embedding)"
	echo "  watch   [filename]   Continuous build on file change"
	echo "  figs                 Convert all .eps figures to .pdf"
	echo "  clean   [filename]   Remove auxiliary files"
	echo "  cleanall [filename]  Remove auxiliary files and the output PDF"
	exit 1
}

[ -z "$1" ] && usage

cmd="$1"
filename="${2:-thesis}"

case "$cmd" in
	figs)
		echo "Converting EPS figures to PDF..."
		find . -name '*.eps' -print0 | while IFS= read -r -d '' f; do
			pdf="${f%.eps}.pdf"
			if [ ! -f "$pdf" ] || [ "$f" -nt "$pdf" ]; then
				echo "  $f"
				epstopdf "$f"
			fi
		done
		echo "Done."
		;;
	compile)
		echo "Compiling $filename.tex with latexmk..."
		if ! latexmk -pdf "$filename.tex"; then
			echo "First pass failed. Removing stale aux/out files and retrying..."
			rm -f "$filename.out" "$filename.aux" "$filename.toc"
			latexmk -pdf "$filename.tex"
		fi
		echo "Success! -> $filename.pdf"
		;;
	draft)
		echo "Draft compile (no figure embedding)..."
		latexmk -pdf -e '$pdflatex=q/pdflatex -draftmode -interaction=nonstopmode %O %S/' "$filename.tex"
		latexmk -pdf "$filename.tex"
		;;
	watch)
		echo "Watching $filename.tex for changes (Ctrl-C to stop)..."
		latexmk -pdf -pvc "$filename.tex"
		;;
	clean)
		echo "Cleaning auxiliary files..."
		latexmk -c "$filename.tex"
		echo "Cleaning complete!"
		;;
	cleanall)
		echo "Cleaning all generated files..."
		latexmk -C "$filename.tex"
		echo "Cleaning complete!"
		;;
	*)
		usage
		;;
esac
