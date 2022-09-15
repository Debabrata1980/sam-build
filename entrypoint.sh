#!/bin/sh

# First, validate the template using the AWS CLI
echo "Sam build started..."
sam build
if [ $? -ne 0 ]; then
  echo "SAM build error"
  exit 1
fi
