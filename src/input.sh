#!/bin/bash
# shellcheck disable=SC2154
input=$(echo "$input" | tr '\n' ';')
input=${input//    /}
input=${input//\. /. ;}
input=${input//\。/。;}

if [[ $input =~ 。 ]]; then
  input=${input//;;/;}
fi

# // comment e.g. golang
input=${input//;\/\/ / }
input=${input//\/\/ /}

# # comment e.g. python
input=${input//;\# / }
input=${input//\# /}

echo -n "$input"
