#!/usr/bin/env bash

branch="$1"
remote="$2"
if [ "$branch" == "" ]; then
    echo ""
    echo "...ERROR: You must inform the branch name. Ex.:"
    echo ""
    echo "      ./$(basename $0) \"branch-to-be-deleted\" [remote-name]"
    exit 1
fi

if [ "$remote" != "" ]; then
    echo ">>>>>> git branch -d -r $remote/$branch" && \
        git branch -d -r $remote/$branch;
    echo ">>>>>> git push $remote :$branch" && \
        git push $remote :$branch;
else
    for r in $(git remote); do
        echo ">>>>>> git branch -d -r $r/$branch" && \
            git branch -d -r $r/$branch;
        echo ">>>>>> git push $r :$branch" && \
            git push $r :$branch;
    done    
fi
