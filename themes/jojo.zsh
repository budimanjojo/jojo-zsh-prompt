## Customization
# Modify to your liking
_branch_name_prefix_symbol="%{$fg[yellow]%}["
_branch_name_suffix_symbol="%{$fg[yellow]%}]"
_is_dirty_symbol="%{$fg[red]%}✘ "
_is_clean_symbol="%{$fg[green]%}✔ "
_has_modifications_symbol="%{$fg[red]%}✎  " 
_has_modifications_cached_symbol="%{$fg[green]%}✍  "
_has_adds_symbol="%{$fg[green]%}✚  "
_has_deletions_symbol="%{$fg[red]%}✖  "
_has_deletions_cached_symbol="%{$fg[green]%}▬  "
_ready_to_commit_symbol="%{$fg[green]%}☻   "
_has_untracked_files_symbol="%{$fg[red]%}✭  "
_commits_behind_symbol="%{$fg[green]%}← "
_commits_ahead_symbol="%{$fg[green]%}→  "
_enable_right_return_status=yes
_return_status_color="%{$fg[red]%}"
_enable_right_date=no
# colors
_date_color="%{$fg[green]%}"

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function right_date() {
  if [[ $(check_is_a_git_repo) != "true" ]];then
    echo "${_date_color}%D{%a,%d %b %y}"
  fi
}

function right_return_code() {
  if [[ ${_enable_right_return_status} == "yes" ]]; then
    echo "${_return_status_color} %?↵"
  fi
}


PROMPT='${fg[green]%}╭─%n@%{$fg[yellow]%}%M %{$fg[red]%}%~${_newline}%}%{$fg[green]%}╰─$(prompt_char) %{$reset_color%}'
RPROMPT='%{${_lineup}%}$(right_date)$(show_git_status)$(show_git_commits)$(show_git_branch)$(show_git_dirty)$(right_return_code)%{${_linedown}%}%{$reset_color%}'

