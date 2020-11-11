## Issue with git's handling of the `prepare-commit-msg` hook

I believe there's an issue with git's very own mechanism of triggering the `prepare-commit-msg` hook.

According to the documentation, said hook is supposed to receive `squash` as source of commit message (i.e. its
 second argument) when a "SQUASH_MSG" file is present, i.e. when a squash is currently ongoing.
 
 This repository serves to show that this isn't the case during an interactive rebase. Instead, git passes
 `message` to the `prepare-commit-msg` hook.
 
 ## Usage
 Simply run `run-demonstration.sh` and follow the on-screen directions. 