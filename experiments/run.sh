#!/bin/bash

cd ../opty-source-files/
# echo "Studying parameters in ${1}"
while read CONF; do
	# echo "Running configuration $CONF" >&2

	erl +S 2:2 -noshell -eval "opty:start($CONF)" -run init stop < /dev/null
done < ../experiments/${1}
