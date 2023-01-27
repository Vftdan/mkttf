#!/bin/bash
# Based on: https://gist.github.com/anonymous/1853b5d13093d3c27a0b93db42045055/raw/29941344e5149558ca0424b05aa4e80b85728c7f/potrace-blocky.sh
argv=("$0" "$@") # $# == ${#argv[@]} + 1
last=${argv[$#]}

newwidth=$(( $(identify -format "%w" -- "$last") * 10))
newheight=$(( $(identify -format "%h" -- "$last") * 10))

old_r=1
for i in $(seq 1 $#); do \
	if [ "${!i}" = -r ]; then \
		j=$((i + 1))
		old_r=${!j}
	fi
done

# select every arg but last and argv[0]
convert -scale "${newwidth}x${newheight}" -threshold '80%' -- "$last" bmp:- |	# convert does a blocky scale & replaces grey pixels with black
	/usr/bin/potrace "${argv[@]:1:$#-1}" -r $((10 * old_r)) -a 0 -- -
