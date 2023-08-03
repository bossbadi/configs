#!/bin/bash

for d in ~/*/; do
    [[ -d "${d}.git/" ]] && echo -e "\n${d}" && cd "${d}" && git pull
done
