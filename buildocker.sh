#!/bin/bash

usage() {
	script=$0
	echo "Ver: 1.0.0 20200727
Usage:
     ${script#*/} [version] "
}

if [ "$1" = "h" ] || [ "$1" = "-h" ]; then
	usage
	exit 0
fi

if [ $# -le 0 ] ; then
	docker build -t falcon-probelog .
	exit 0
fi


docker build -t falcon-probelog:$1 .

exit 0
