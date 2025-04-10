#! /bin/sh
if [ "$1" = "-h" ]; then
	exec >&2
	echo 'Usage:'
	echo " ${0} [additional mkttf.py options]"
	echo 'Set your $TMPDIR to a frequent creation-deletion friendly directory'

	exit 1
fi
dir="$(dirname "$0")"

AUTOTRACE="$(realpath "$dir/potrace-blocky.sh")" "$dir"/mkttf.py -f Creep2 -n Creep2-Regular -N 'Creep2 Regular' -C "; Original copyright (c) 2016 romeovs; Licensed under the MIT License; Modified" -A ' -a -1' -V 2.2 -O --em-size 110 --adjust-width 1 "$@" "$dir"/creep2/creep2-11.bdf
exitcode=$?
if [ "$exitcode" -gt 0 ]; then \
	echo "mkttf.py exited with code $exitcode" >&2
	exit "$exitcode"
fi
