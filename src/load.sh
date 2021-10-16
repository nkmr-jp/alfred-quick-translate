#!/bin/bash
tmp_file=/tmp/quick_translate_tmp
langs=($(echo "$foreign_lang" | tr ',' '\n'))

if [ -e $tmp_file ]; then
    current=$(cat $tmp_file)
else
    current="${langs[0]}"
fi
echo -n "$current"