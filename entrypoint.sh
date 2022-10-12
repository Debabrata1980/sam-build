#!/bin/sh

# First, validate the template using the AWS CLI
echo "Sam build started..."


args[0]="--template $1"

if [ ! -z $2 ]
then
args[1]="--region $2"
fi

if [ ! -z $3 ]
then
args[2]="--config-file $3"
fi

sam build ${args[@]}
if [ $? -ne 0 ]; then
  echo "SAM build error"
  exit 1
fi
