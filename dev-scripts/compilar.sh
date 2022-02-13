#!/bin/bash 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CDIR=$( pwd )
cd $DIR/../themes/base-theme-slug
docker run -it -v `pwd`:/compilar node:12 bash -c "cd compilar && npm install && npm run production && rm -rf node_modules"
