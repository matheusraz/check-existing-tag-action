#!/bin/bash

export result="$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  https://api.github.com/repos/$GITHUB_REPOSITORY/tags)"

if [[ $result =~ $INPUT_TAG ]]; then
   echo "::set-output name=tag_exists::true"
else
   echo "::set-output name=tag_exists::false"
fi