#!/bin/bash

FILES="${PWD}/"
DOCKER_ACCOUNT=jmdrawneek

for f in ${FILES}*
do

if [[ ${f} == *Dockerfile* ]]; then

LOWERCASE=$(echo $(basename ${f}) | tr '[:upper:]' '[:lower:]')
  echo "Building ${LOWERCASE#*--} ..."

  docker build -f ${f} -t ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest .
  docker push ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest

  else
    echo "$f Doesn't match the naming convention"
fi
done
