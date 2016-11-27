#!/bin/bash
#

HOST="jenkins.ibr.cs.tu-bs.de:5000"
FOLDER=$(basename ${1})
TAG=$(echo ${FOLDER} | sed 's/_/:/g')

docker build -t ${HOST}/${TAG} ${FOLDER}
docker push ${HOST}/${TAG}
docker -H :4000 pull ${HOST}/${TAG}
