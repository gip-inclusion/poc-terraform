#!/bin/sh

PROJECT_NAME=$1

cp -r projects/demo/* "projects/$PROJECT_NAME"

find "projects/$PROJECT_NAME" -type f -exec sed -i -e "s/demo/$PROJECT_NAME/g" {} \;
find "projects/$PROJECT_NAME" -type f -exec sed -i -e "s/Demo/${PROJECT_NAME^}/g" {} \;
