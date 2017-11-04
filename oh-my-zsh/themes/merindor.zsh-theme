if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function get_venv {
	if [ -n "$VIRTUAL_ENV" ]; then
		PY_VERSION=`python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'`
		VENV_NAME=`basename $VIRTUAL_ENV` 
		echo "%{$FG[032]%} (%{$fg[green]%}$VENV_NAME: $PY_VERSION%{$FG[032]%})"
	else
		echo ""
	fi
}

# primary prompt
PROMPT='%{$fg[green]%}$(whoami) %{$reset_color%}% at $FG[208][$(echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g")$(echo "/${PWD##*/}")]\
$(get_venv)\
 $(git_prompt_info)
$FG[105]%(!.#.»)%{$reset_color%} '
#%{$reset_color%} '
PROMPT2='%{$fg[red]%}\%{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_green='$FG[106]'
eval my_blue='$FG[032]'




# right prompt
#if type "virtualenv_prompt_info" > /dev/null
#then
#	RPROMPT='$(virtualenv_prompt_info)$my_green$( get_venv )%{$reset_color%}%'
#else
#	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
#fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
