#!/bin/bash
# Script to update all Suroi.io servers to a specific commit hash

COMMIT=$1

if [ -z "$COMMIT" ]; then
    echo "Please provide a commit hash"
    exit 1
fi

for dir in /apps/suroi-*; do
    cd $dir
    git reset --hard
    git checkout $COMMIT
    suroi-setup-server $(echo $dir | grep -o '[0-9]*$')
done
