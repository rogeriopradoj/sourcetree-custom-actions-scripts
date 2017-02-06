#!/usr/bin/env bash

feature="$1"
if [ "$feature" == "" ]; then
    echo ""
    echo "...ERROR: You must inform the feature name. Ex.:"
    echo ""
    echo "      ./$(basename $0) \"new-module-xyz\""
    exit 1
fi

git checkout -b $feature;
