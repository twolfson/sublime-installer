#!/usr/bin/env bash
# Exit on first error
set -e

# Assert the version was specified
SUBLIME_TEXT_VERSION="$1"

if test -z "$1"; then
  echo "No Sublime Text version was specified" 1>&2
  echo ""
  echo "Sublime Text Installer - Install Sublime Text 2 or 3"
  echo "https://github.com/twolfson/sublime-installer"
  echo ""
  echo "Usage: ./install.sh <sublime_text_version>"
  echo "    sublime_text_version - Either 2 or 3"
  exit 1
fi

# If we are to install Sublime Text 2
if test "$SUBLIME_TEXT_VERSION" = "2"; then
  # http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2
  sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y
  sudo apt-get update
  sudo apt-get install sublime-text -y
elif test "$SUBLIME_TEXT_VERSION" = "3"; then
  sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
  sudo apt-get update
  sudo apt-get install sublime-text-installer -y

  # If we are in Travis, update shm. Fixes 'Unable to init shm' from `sublime_text --wait`
  # https://travis-ci.org/twolfson/sublime-plugin-tests/builds/12500309
  # https://github.com/travis-ci/travis-core/issues/187
  if test -n "$TRAVIS"; then
    sudo rmdir /dev/shm
    sudo ln -Tsf /run/shm /dev/shm
  fi
fi
