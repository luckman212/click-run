#!/usr/bin/env bash
#shellcheck disable=SC2016

# https://apple.stackexchange.com/questions/471930

# requires fzf: https://github.com/junegunn/fzf
# brew install fzf

export PROGRAM_LIST=${1:-program.list}
[[ -e $PROGRAM_LIST ]] || { echo "$PROGRAM_LIST not found"; exit 1; }

read -r -u3 CHOICE 3< <(cut -d$'\t' -f1 "$PROGRAM_LIST" | fzf \
	--header="select program to run (use arrows or click with mouse)" \
	--no-hscroll \
	--no-multi \
	--no-select-1 \
	--no-sort \
	--preview-label='command preview' \
	--preview-window='bottom,20%,wrap' \
	--preview 'awk -v c={} "BEGIN {FS=\"\t\"} \$1==c {print \$2}" $PROGRAM_LIST')

[[ -n $CHOICE ]] || exit
#echo "==> running: $CHOICE"
CMD=$(awk -v c="$CHOICE" 'BEGIN {FS="\t"} $1==c {print $2}' "$PROGRAM_LIST")
[[ -n $CMD ]] || exit 1

#uncomment the line below to debug failing commands
#set -x
eval "$CMD"
