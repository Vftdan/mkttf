#! /bin/sh
if [ "$1" = "-h" -o $# -ne 2 ]; then
	exec >&2
	echo 'Usage:'
	echo " ${0} srcdir fontver [additional mkttf.py options]"
	echo 'Set your $TMPDIR to a frequent creation-deletion friendly directory'

	exit 1
fi
dir="$(dirname "$0")"

AUTOTRACE="$(realpath "$dir/potrace-blocky.sh")" "$dir"/mkttf.sh "$1" "$2" TerminusPixelated12pt TerminusPixelated12pt
