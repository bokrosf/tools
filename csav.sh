#!/bin/bash

print_error()
{
  echo "csav: $1"
}

help()
{
  # TODO Implement displaying usage.
  echo "help"
}

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