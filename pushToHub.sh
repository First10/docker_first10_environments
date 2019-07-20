#!/bin/bash
#https://github.com/Yelp/docker-push-latest-if-changed

export $(xargs <.env)

FILES="${PWD}/"

echo "$DOCKER_PWD" | docker login --username ${DOCKER_ACCOUNT} --password-stdin


for f in ${FILES}*
do

# Only process files with Dockerfile in their name.
if [[ ${f} == */Dockerfile* ]]; then

# Convert string to lowercase.
LOWERCASE=$(echo $(basename ${f}) | tr '[:upper:]' '[:lower:]')

  echo "Building ${LOWERCASE#*--} ..."

  docker build -f ${f} -t ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest .
  docker push ${DOCKER_ACCOUNT}/${LOWERCASE#*--}:latest

  else
    echo "$f Doesn't match the naming convention"
fi
done
