#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086
# shellcheck disable=SC2001

PATH=$PATH:/usr/local/bin
engines=('aspell' 'google' 'bing' 'spell' 'hunspell' 'apertium' 'yandex')
input=$1
trans=""
lf=$'\\\x0A'

if [[ "$lang" == "${native_lang}2${translate_lang}" ]]; then
  from=$native_lang
  to=$translate_lang
else
  from=$translate_lang
  to=$native_lang
fi

set_trans() {
  if [[ "${engines[*]}" =~ $engine ]]; then
    trans=$(trans "$from:$to" --engine "$engine" -b "$input")
  elif [[ $engine == "deepl" ]]; then
    local from_upper to_upper input_deepl
    from_upper=$(echo "$from" | tr '[:lower:]' '[:upper:]')
    to_upper=$(echo "$to" | tr '[:lower:]' '[:upper:]')

    input_deepl=$(echo "$input" | tr '\n' ';')
    input_deepl=$(echo "$input_deepl" | sed 's/;;/;/g')
    IFS=';'
    set -- $input_deepl

    trans=$(
      curl -s https://api.deepl.com/v2/translate \
        -d auth_key="$deepl_api_key" \
        -d "text=$1" \
        -d "text=$2" \
        -d "text=$3" \
        -d "text=$4" \
        -d "text=$5" \
        -d "text=$6" \
        -d "text=$7" \
        -d "text=$8" \
        -d "text=$9" \
        -d "text=${10}" \
        -d "text=${11}" \
        -d "text=${12}" \
        -d "text=${13}" \
        -d "text=${14}" \
        -d "text=${15}" \
        -d "text=${16}" \
        -d "text=${17}" \
        -d "text=${18}" \
        -d "text=${19}" \
        -d "text=${20}" \
        -d "target_lang=$to_upper" \
        -d "source_lang=$from_upper"
    )
    trans=$(echo "$trans" | jq -r .translations[].text)
    if [ -n "${21}" ]; then
      trans="$trans $lf ..."
    fi
  else
    echo -n "'$engine' is unsupported engine"
    exit
  fi
}

run() {
  set_trans
  echo -n "$trans" | sed 's/。/'"。$lf"'/g'
}

filter() {
  set_trans
  cat <<EOB
{
	"variables": {
		"input": "$input",
		"output": "$trans",
		"lang": "$lang"
  	},
	"items": [
		{
			"uid": "eg1",
			"title": "$trans",
			"subtitle": "$input",
			"arg": "$trans"
		}
	]
}
EOB
}

if [[ "$script_type" == "run" ]]; then
  run
else
  filter
fi