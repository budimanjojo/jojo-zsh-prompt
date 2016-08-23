# JOJO ZSH Prompt
=====================

**NOTE: This is a cont project of my previous project: [My Git Prompt](https://github.com/budimanjojo/my-git-prompt.git). I decided to make it a theme collection manager with built-in Git feature instead**

## Screenshots

### Dark Terminal
![On black background terminal](https://s4.postimg.org/l03flsrel/dark.png)
### Light Terminal
![On white background terminal](https://s4.postimg.org/b42cm5lml/light.png)

## Introduction
  This is the ZSH theme manager for you to choose themes without using Oh-My-ZSH or Prezto. I also included the Git status functions to show nice symbols when you're inside your local git directory. It is similar to what [Oh-My-Git](https://github.com/arialdomartini/oh-my-git.git) and [Prezto Powerline Prompt](https://github.com/davidjrice/prezto_powerline) do, but the only difference is you don't need to have powerline and the patched fonts to show this prompt. This project is still **WIP** and I will keep improving it.

## Installation
  To install, do this:
```
git clone https://github.com/budimanjojo/jojo-zsh-prompt.git ~/.jojo-zsh-prompt && ~/.jojo.zsh-prompt/install.zsh
```

**NOTE:**
- You can modify the "_JOJO_ZSH_HOME=$HOME" to a hard home link (for example you symlinked your .zshrc to your /root folder so that your root account can also get the same configuration). You can just modify it to whatever you feel like.
- You can also modify the "_JOJO_ZSH_THEME=" to your desired theme in the ~/.jojo-zsh-prompt/themes/ folder. Just input the name of the theme without the .zsh at the end.

## Themes
  Currently, I have included two themes for your to choose from, if no theme is defined in "_JOJO_ZSH_THEME=" in your .zshrc, then the default jojo theme will be used. If you want to submit your themes to me, I'll be very happy to include it.

## Theme Customization
  To customize, I suggest you to just make a new theme and submit it to me. These are the functions that you can call in the PROMPT of your theme:
- **$(show_git_branch)**
  Calling this will show your branch name inside the prefix and suffix symbol you have set for it in the later customization section
- **$(show_git_dirty)**
  Calling this will check if your local repo is clean or dirty and show you the clean and dirty symbol you have set for it in the later customization section
- **$(show_git_status)**
  Calling this will show you the status of your local repo with the symbols you have set for it in the later customization section
- **$(show_git_commits)**
  Calling this will show you the number of commits your local repo is ahead or behind the remote repo. If there's no commit ahead or behind, it will show you _ instead of number. Also, you can set the symbols in the later customization section


  And here are the variables that you can modify to set your desired symbols and colors for the functions you call in your PROMPT=:
```
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
_commits_ahead_symbol="%{$fg[green]%}→ "
```

Currently available themes (screenshots coming soon):
- jojo
- simpleasy

## Future Plan
  There are some things that I will work add in the future, or my to do list to be exact:
- [x] Make an install script to automatically install this for you
- [ ] Simplify the way to modify the color
- [ ] Some statuses like detached head etc are not yet supported and is not priority, I prefer it simple :)
- [ ] Making more themes for you guys to choose from :)

Thanks guys
