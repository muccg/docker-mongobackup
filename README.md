MongoDB backup based on https://github.com/micahwedemeyer/automongobackup/

docker run -it -v /data/mongobackup:/data -v /etc/localtime:/etc/localtime:ro -e PREBACKUP='ls -l /data/backup' -e REPLICAONSLAVE=no -e OPLOG=no --link mongo:mongo mongobackup backup

