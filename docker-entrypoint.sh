#!/bin/bash
#
: ${DBHOST:="mongo"}
: ${DBPORT:="27017"}
: ${BACKUPDIR:="/data/backup"}
: ${MAILCONTENT:="stdout"}
: ${MAXATTSIZE:="4000"}
: ${DOWEEKLY:="6"}
: ${CLEANUP:="yes"}
: ${LATEST:="yes"}
: ${LATESTLINK:="yes"}
: ${OPLOG:="yes"}
: ${REPLICAONSLAVE:="yes"}

export DBHOST DBPORT BACKUPDIR MAILCONTENT MAXATTSIZE DOWEEKLY CLEANUP LATEST LATESTLINK OPLOG REPLICAONSLAVE
 
######################################

echo "HOME is ${HOME}"
echo "WHOAMI is `whoami`"

if [ "$1" = 'backup' ]; then
    echo "[Run] Starting backup"
    date

    (
        flock -n 9 || exit 1
        time /automongobackup.sh 2>&1 | tee /data/backup.log
    ) 9>/data/lockfile

    exit $?
fi

echo "[RUN]: Builtin command not provided [backup]"
echo "[RUN]: $@"

exec "$@"
