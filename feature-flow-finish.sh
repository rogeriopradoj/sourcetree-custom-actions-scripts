#!/usr/bin/env bash
# BRANCH=`git symbolic-ref --short HEAD`; git checkout master; git merge $BRANCH --no-ff --no-edit; git branch -d $BRANCH
BRANCH=`git symbolic-ref --short HEAD`;
git checkout master && \
git merge $BRANCH --no-ff --no-edit && \
git branch -d $BRANCH
