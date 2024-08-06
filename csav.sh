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

help()
{
  # TODO Implement displaying usage.
  echo "help"
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

if [[ ! -d $(config_root_path)/.git ]]
then
  print_error "not a git repository: '$(config_root_path)'"
  exit 1
fi

case "$1" in
  help)
    help
    ;;
  "")
    print_error "no operation specified (use 'help' for help)"
    ;;
  *)
    print_error "invalid operation -- '$1'"
    ;;
esac