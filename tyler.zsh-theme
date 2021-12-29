#This is my custom theme that is a mashup of two other themes:
#af-magic.zsh-theme (For the rows across the terminal)
#and
#strug.zsh-theme
#All credit goes to those two, I just mashed it together and changed some colors. 

# terminal coloring
export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagacad

local git_branch='$(git_prompt_info)%{$reset_color%}$(git_remote_status)'

function afmagic_dashes {
  # check either virtualenv or condaenv variables
  local python_env="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = \(* ]]; then
    echo $(( COLUMNS - ${#python_env} - 3 ))
  else
    echo $COLUMNS
  fi
}


#PROMPT="%{$FG[007]%}╭─%n@%m %{$reset_color%}%{$FG[012]%}in %~ %{$reset_color%}${git_branch}
#%{$FG[007]%}╰\$ %{$reset_color%}"
PROMPT="%{$FG[007]%}\${(l.\$(afmagic_dashes)..-.)}%{$reset_color%}%{$FG[007]%}╭─%n@%m %{$reset_color%}%{$FG[012]%}in %~ %{$reset_color%}${git_branch}
%{$FG[007]%}╰\$ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[012]%}on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[007]%} ✔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{$FG[012]%}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$FG[012]%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{$FG[007]%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{$fg[red]%}

