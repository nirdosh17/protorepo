#!/bin/bash

# -------- Steps ---------
# 1. CI Detects changes in folders
  # If no change detected, skip
  # If changes detected, create a new branch from main, branch name: release-{timestamp}, follow next steps

# 2. loop across all changed services(folders)
  # For Service A, find list of languages to generate the code
    # 2.1.1 for Service A, Lang A, call appropriate generator
      # e.g. make greet-{LANG_A}
    # 2.1.2 commit changes to branch

    # 2.2.1 for Service A, Lang B, call appropriate generator
      # e.g. make greet-{LANG_B}
    # 2.2.2 commit changes to branch

# Push changes to the release branch
# Merge changes to main branch
# Delete the branch (local/origin)

while read -r lang
do
  # create outputt directory if not exists
  output_dir=$SERVICE/lib/$lang
  mkdir -p $output_dir
  SERVICE=$SERVICE LANG=$lang make generate-$lang
done < $SERVICE/.protolangs
