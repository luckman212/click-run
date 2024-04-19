#!/usr/bin/env bash
#shellcheck disable=SC2016

# https://apple.stackexchange.com/questions/471930

# requires fzf: https://github.com/junegunn/fzf
# brew install fzf

case $1 in
	--dry-run) DRY_RUN=true; shift;;
esac

export PROGRAM_LIST=${1:-program.list}
[[ -e $PROGRAM_LIST ]] || { echo "$PROGRAM_LIST not found"; exit 1; }

IFS=$'\t' read -r -u3 CHOICE CMD _ 3< <(fzf <"$PROGRAM_LIST" \
	--header="select program to run (use arrows or click with mouse)" \
	--no-hscroll \
	--no-multi \
	--no-select-1 \
	--no-sort \
	--delimiter='\t' \
	--with-nth=1 \
	--preview-label='command preview' \
	--preview-window='bottom,20%,wrap' \
	--preview 'echo {2}')

if [[ $DRY_RUN == true ]]; then
	EVAL_CMD=$(eval echo "$CMD")
	cat <<-EOF
	selected:       $CHOICE
	raw cmd:        $CMD
	evaluated cmd:  $EVAL_CMD
	EOF
	exit 0
fi

[[ -n $CHOICE ]] || exit
[[ -n $CMD ]] || exit 1

#uncomment the line below to further debug failing commands
#set -x
eval "$CMD"
