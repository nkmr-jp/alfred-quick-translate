#!/bin/bash
tmp_file=/tmp/quick_translate_tmp
langs=($(echo "$foreign_lang" | tr ',' '\n'))

if [ -e $tmp_file ]; then
    current=$(cat $tmp_file)
    flg=0
    for ((i = 0; i <= ${#langs[@]}; i++)); do
        if [[ "$current" == "${langs[$i]}" ]]; then
            if [ -z ${langs[$i + 1]} ]; then
                current=${langs[0]}
            else
                current=${langs[$i + 1]}
            fi
            flg=1
            break
        fi
    done
    if [[ $flg -eq 0 ]]; then
        current=${langs[0]}
    fi
else
    current="${langs[0]}"
fi

echo "$current" > $tmp_file

output=""
for ((i = 0; i < ${#langs[@]}; i++)); do
    if [[ "$current" == "${langs[$i]}" ]]; then
        output="$output [ ${langs[$i]} ]"
    else
        output="$output ${langs[$i]}"
    fi
done

echo -n "$output"