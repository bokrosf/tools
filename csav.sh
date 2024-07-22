#!/bin/bash

#A program that can be used for saving configurations and persist them with git.
# [] Tool parameterized with the filenames to save.
# [] It should accept file name or file name pattern parameters.
# [] If no parameter is given then it saves the whole directory with all files in it.
# [] Location of the file repository is saved in a config file.
# [] Maybe this tool should have it's own repo under linux_tools repository.
# [] It should be configurable to which git repository should it use as a file storage.
# [] It should also support the following operations
#    [] Uploading config
#    [] Downloading config
#    [] Applying config
#      [] If a path provided then it must only apply the provided subtree.
#    [] Removing config follows tracking the config and removes it from the save directory.

#Future plans
# [] man page

# Usage should be something like this:
# $ csav
# $ csav asound.conf
# $ csav *
# $ csav /etc/*.conf
# $ csav -u
# $ csav -d
# $ csav -a
# $ csav -a etc/systemd/network
