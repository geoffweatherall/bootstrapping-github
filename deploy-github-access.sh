#!/usr/bin/env bash
set -eo pipefail

# required parameter github username
if [ -z "$1" ]
  then
    echo "specify GitHub username, e.g. joebloggs99"
    exit 1
fi

github_username=$1
shift


aws cloudformation deploy \
  --template-file infrastructure/github-access.cfn.yaml \
  --stack-name github-access \
  --region us-east-1 \
  --parameter-overrides \
     GitHubUsername=$github_username \
   "$@"