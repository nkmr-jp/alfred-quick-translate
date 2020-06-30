#!/bin/bash
# shellcheck disable=SC2154

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
    local from_upper to_upper
    from_upper=$(echo "$from" | tr '[:lower:]' '[:upper:]')
    to_upper=$(echo "$to" | tr '[:lower:]' '[:upper:]')
    trans=$(
      curl -s https://api.deepl.com/v2/translate \
        -d auth_key="$deepl_api_key" \
        -d "text=$input" \
        -d "target_lang=$to_upper" \
        -d "preserve_formatting=1" \
        -d "source_lang=$from_upper" \
    )
    trans=$(echo "$trans" | jq -r .translations[0].text | sed 's/- /'"$lf- "'/g')
  else
    echo -n "'$engine' is unsupported engine" |
    exit
  fi
}

run_script() {
  echo -n "$trans" | sed 's/。/'"。$lf"'/g'
}

script_filter() {
  cat <<EOB
{
	"variables": {
		"input": "$input",
		"output": "$trans",
		"prefix": "ja2en"
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

set_trans
run_script
#
#if [ $prefix ] then:
#run
