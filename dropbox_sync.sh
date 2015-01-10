#!/bin/bash
# Runs dropbox at intervals, so as not to create too many deltas
# based on https://gist.github.com/bguiz/51471fb388fd24a3be6c
# sovgvd@gmail.com

SYNC_CHECK_INTERVAL=5

echo "Start sync..."
    dropbox stop
    dropbox start
    while true ; do
        status="$( dropbox status )"
        if echo "$status" | grep -q -E 'Up to date' ; then
	    echo ""
            echo "Done"
            break 1
        else
            echo -n "."
            sleep ${SYNC_CHECK_INTERVAL}
        fi
    done
    dropbox stop
