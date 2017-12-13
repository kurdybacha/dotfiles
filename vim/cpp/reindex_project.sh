#!/bin/bash

if [ -z "$WORKING_COPY" ]; then
    source $HOME/.bashrc
fi

COMPONENT=$1
PROJECT_DIR=$WORKING_COPY/components/$COMPONENT
BUILD_OUTPUT=build.log

set -e

($WORKING_COPY/cnxshell -c 'cd /components/'$COMPONENT' && (make clean || true) && (make distclean || true) && SKIP_DECODER_LIBRARY=1 make -j6 2>&1 > '$BUILD_OUTPUT \
&& cd $PROJECT_DIR \
&& generate_project_compile_commands.py $WORKING_COPY components/$COMPONENT $BUILD_OUTPUT)

rc --project-root $PROJECT_DIR -J $PROJECT_DIR
