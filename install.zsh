#! /bin/bash
## Install script for JoJo ZSH Prompt Themes

if [[ -f "${_JOJO_ZSH_HOME:-$HOME}/.zshrc" ]]; then
  if egrep -q "JOJO_ZSH_HOME|_JOJO_ZSH_THEME" "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
  then
    echo "You already have JoJo ZSH Prompt installed in your system, there's nothing to do"
  else
    echo "You already have a .zshrc in your home directory, I'll put something inside for you :)"
    echo $'\n' >> "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
    cat "${_JOJO_ZSH_HOME:-$HOME}/.jojo-zsh-prompt/templates/zshrc" >> "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
  fi
else
  echo "Seems like you haven't got a .zshrc in your home directory yet"
  echo "I'll give you a new .zshrc in your home directory, you can modify it to your liking :)"
  ln -s "${_JOJO_ZSH_HOME:-$HOME}/.jojo-zsh-prompt/templates/zshrc" "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
fi
