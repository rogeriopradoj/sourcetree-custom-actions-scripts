#!/usr/bin/env bash
# BRANCH=`git symbolic-ref --short HEAD`; for r in $(git remote); do echo ">>>>>> git push $r $BRANCH" && git push $r $BRANCH; done
BRANCH=`git symbolic-ref --short HEAD`;
for r in $(git remote); do
    echo ">>>>>> git push $r $BRANCH" && \
    git push $r $BRANCH;
done
