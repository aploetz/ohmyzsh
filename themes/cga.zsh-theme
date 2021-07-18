# cga.zsh-theme

# settings
typeset +H return_code="%(?..%{$fg[magenta]%}%? ↵%{$fg[reset_color]%})"
typeset +H my_gray="$FG[238]"
typeset +H my_white="$FG[015]"
typeset +H my_magenta="$FG[005]"
typeset +H my_cyan="$FG[006]"

# separator dashes size
function cga_dashes {
local PYTHON_ENV="$VIRTUAL_ENV"
[[ -z "$PYTHON_ENV" ]] && PYTHON_ENV="$CONDA_DEFAULT_ENV"

if [[ -n "$PYTHON_ENV" && "$PS1" = \(* ]]; then
echo $(( COLUMNS - ${#PYTHON_ENV} - 3 ))
else
echo $COLUMNS
fi
}

# primary prompt
PS1='$FG[231]${(l.$(cga_dashes)..-.)}%{$reset_color%}
$FG[051]%~$(git_prompt_info)$(hg_prompt_info) $FG[091]%(!.#.»)%{$reset_color%} '
PS2='%{$fg[white]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPS1+=' $my_gray%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$my_cyan($my_white"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_magenta*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_cyan)%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$my_cyan($my_white"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_magenta*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$my_cyan)%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[081]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="xxgxGxhxfxagxfafAgFxAg"
export LS_COLORS='di=0:ln=36:so=1;36:pi=37:ex=35:bd=30;46:cd=0;45:su=30;45:sg=1;30;46:tw=1;35:ow=1;30;46'

