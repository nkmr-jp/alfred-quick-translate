#!/bin/bash
# shellcheck disable=SC2154
input=$(echo "$input" | tr '\n' ';')
input=$(echo "$input" | sed 's/\. /. ;/g')
input=$(echo "$input" | sed 's/\。/。;/g')
if [[ $input =~ 。 ]]; then
  input=$(echo "$input" | sed 's/;;/;/g')
fi

echo -n "$input"
