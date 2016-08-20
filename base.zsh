autoload -U colors && colors                # enable colors in prompt
setopt promptsubst                          # enable function in prompt

function check_is_a_git_repo() {
  local is_a_git_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"
  if [[ $is_a_git_repo == "true" ]]; then
    echo "true"
  fi
}

## Call this function to show the current branch information
function show_git_branch() {
  if [[ $(check_is_a_git_repo) ]]; then
    local prompt=""
    local current_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    prompt+="${_branch_name_prefix_symbol}${current_branch}${_branch_name_suffix_symbol}"
  prompt+=%{$reset_color%}
  echo $prompt
fi
}

## Call this function to show the dirty or clean status of the current repository
function show_git_dirty() {
  if [[ $(check_is_a_git_repo) ]]; then
  local clean_or_dirty="$(git diff --shortstat 2> /dev/null | tail -n1)"
  local prompt=""
  if [[ -n $clean_or_dirty ]]; then
    prompt+="${_is_dirty_symbol}"
  else
    prompt+="${_is_clean_symbol}"
  fi
  prompt+=%{$reset_color%}
  echo -n $prompt
fi
}

## Call this function to show the git status of the current repository
function show_git_status() {
  local git_status="$(git status --porcelain 2> /dev/null)"
  local upstream="$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} 2> /dev/null)"
  local prompt=""
  if [[ $git_status =~ ($'\n'|^).M ]]; then prompt+="${_has_modifications_symbol}"; fi
  if [[ $git_status =~ ($'\n'|^)M ]]; then prompt+="${_has_modifications_cached_symbol}"; fi
  if [[ $git_status =~ ($'\n'|^)A ]]; then prompt+="${_has_adds_symbol}"; fi
  if [[ $git_status =~ ($'\n'|^).D ]]; then prompt+="${_has_deletions_symbol}"; fi
  if [[ $git_status =~ ($'\n'|^)D ]]; then prompt+="${_has_deletions_cached_symbol}"; fi
  if [[ $git_status =~ ($'\n'|^)[MAD] && ! $git_status =~ ($'\n'|^).[MAD\?] ]]; then prompt+="${_ready_to_commit_symbol}"; fi
  if [[ $(\grep -c "^??" <<< $git_status) -gt 0 ]]; then prompt+="${_has_untracked_files_symbol}"; fi
  prompt+=%{$reset_color%}
  echo -n $prompt
}

## Call this function to show the git commits ahead or behind of the current repository
function show_git_commits() {
  if [[ $(check_is_a_git_repo) ]]; then
  local git_status="$(git status --porcelain 2> /dev/null)"
  local upstream="$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} 2> /dev/null)"
  local commits_diff="$(git log --pretty=oneline --topo-order --left-right $git_status...$upstream 2> /dev/null)"
  local commits_ahead="$(git log --oneline $upstream.. 2> /dev/null | wc -l | tr -d ' ')"
  local commits_behind="$(git log --oneline ..$upstream 2> /dev/null | wc -l | tr -d ' ')"
  local prompt=""
  if [[ $commits_behind -gt 0 ]]; then
    prompt+="${_commits_behind_symbol}${commits_behind}"
  else
    prompt+="${_commits_behind_symbol} _ "
  fi
  if [[ $commits_ahead -gt 0 ]]; then
    prompt+="${_commits_ahead_symbol}${commits_ahead}"
  else
    prompt+="_ ${_commits_ahead_symbol}"
  fi
  prompt+=%{$reset_color%}
  echo -n $prompt
fi
}

