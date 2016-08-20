## Customization
# Modify to your liking
_branch_name_prefix_symbol="%{$fg[yellow]%}<"
_branch_name_suffix_symbol="%{$fg[yellow]%}>"
_is_dirty_symbol="%{$fg[yellow]%}*"
_is_clean_symbol=""
_has_modifications_symbol="%{$fg[red]%}*" 
_has_adds_symbol="%{$fg[green]%}+"
_has_deletions_symbol="%{$fg[red]%}-"
_has_untracked_files_symbol="%{$fg[blue]%}*"

PROMPT='%{$fg[blue]%}%~%{$reset_color%} $(show_git_branch) $(show_git_dirty)$(show_git_status) '
