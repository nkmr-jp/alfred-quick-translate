#!/bin/bash
# shellcheck disable=SC2154

view_input=$input
view_output=$output

if [[ $input =~ 。 ]]; then
  view_input=$(echo -n "$input" | fold -w 80)
fi
if [[ $output =~ 。 ]]; then
  view_output=$(echo -n "$output" | fold -w 80)
fi

if [[ "$view" == "output_only" ]]; then
  echo -n "$view_input"
else
  echo "-- INPUT --"
  echo -n "$view_input"
  echo ""
  echo ""
  echo "-- OUTPUT --"
  echo -n "$view_output"
fi
