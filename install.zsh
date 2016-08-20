#! /bin/bash
## Install script for JoJo ZSH Prompt Themes

if [[ -f "${_JOJO_ZSH_HOME:-$HOME}/.zshrc" ]]; then
  echo "You already have a .zshrc in your home directory, I'll put something inside for you :)"
  cat "${_JOJO_ZSH_HOME:-$HOME}/.jojo-zsh-prompt/templates/zshrc" >> "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
else
  echo "Seems like you haven't got a .zshrc in your home directory yet"
  echo "I'll give you a new .zshrc in your home directory, you can modify it to your liking :)"
  ln -s "${_JOJO_ZSH_HOME:-$HOME}/.jojo-zsh-prompt/templates/zshrc" "${_JOJO_ZSH_HOME:-$HOME}/.zshrc"
fi

