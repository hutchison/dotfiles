#!/usr/bin/env bash

r=$(abook --mutt-query $1 | xargs)
email=$(echo $r | cut -d ' ' -f 1)
name=$(echo $r | cut -d ' ' -f 2-)

echo -n "$name <$email>"
