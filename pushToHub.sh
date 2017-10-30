#!/bin/bash

FILES="${PWD}/"
DOCKER_ACCOUNT=jmdrawneek

for f in ${FILES}*
do

# Only process files with Dockerfile in their name.
if [[ ${f} == *Dockerfile* ]]; then

# Convert string to lowercase.
LOWERCASE=$(echo $(basename ${f}) | tr '[:upper:]' '[:lower:]')

  echo "Building ${LOWERCASE#*--} ..."

  docker build -f ${f} -t ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest .
  docker push ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest

  else
    echo "$f Doesn't match the naming convention"
fi
done
