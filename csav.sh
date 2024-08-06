#!/bin/bash

# Configurable variables
# readonly config_checkout_path="$HOME"
# readonly repository_name="configs"
# readonly repository_url="https://github.com/<user_name>/$repository_name"

print_error()
{
  echo "csav: $1"
}

config_root_path()
{
  echo "$config_checkout_path/$repository_name"
}

enforce_initialization()
{
  if [[ ! -d $(config_root_path)/.git ]]
  then
    print_error "init required, not a git repository: '$(config_root_path)'"
    echo "  use \"csav init\" to clone the repository"
    exit 1
  fi
}

help()
{
  # TODO Implement displaying usage.
  echo "help"
}

init()
{
  if [[ -d $(config_root_path)/.git ]]
  then
    echo "initialized"
    return 0
  fi

  mkdir -p "$(config_root_path)"

  if [[ $? -ne 0 ]]
  then
    print_error "directory creation failed -- '$(config_root_path)'"
    exit 1
  fi

  git clone "$repository_url" "$(config_root_path)"

  if [[ $? -ne 0 ]]
  then
    rm -rf "$(config_root_path)"
    print_error "repository cloning failed -- '$repository_url'"
    exit 1
  fi

  echo "initialized"
}

pull()
{
  enforce_initialization
  cd "$(config_root_path)"
  git pull
}

push()
{
  enforce_initialization
  cd "$config_root_path"
  git push
}

if [[ -z $config_checkout_path ]]
then
  print_error "'config_checkout_path' variable must be set"
  exit 1
fi

if [[ -z $repository_name ]]
then
  print_error "'repository_name' variable must be set"
  exit 1
fi

if [[ -z $repository_url ]]
then
  print_error "'repository_url' variable must be set"
  exit 1
fi

case "$1" in
  help)
    help
    ;;
  init)
    init
    ;;
  pull)
    pull
    ;;
  push)
    push
    ;;
  "")
    print_error "no operation specified (use 'help' for help)"
    ;;
  *)
    print_error "invalid operation -- '$1'"
    ;;
esac