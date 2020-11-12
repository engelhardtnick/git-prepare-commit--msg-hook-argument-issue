## Issue with git's handling of the `prepare-commit-msg` hook

I believe there's an issue with git's very own mechanism of triggering the `prepare-commit-msg` hook.

According to the documentation, said hook is supposed to receive `squash` as source of commit message (i.e. its
 second argument) when a "SQUASH_MSG" file is present, i.e. when a squash is currently ongoing.
 
 This repository serves to show that this isn't the case during an interactive rebase. Instead, git passes
 `message` to the `prepare-commit-msg` hook.
 
 
 From the documentation of the prepare-commit-msg hook[1]:
 > It takes one to three parameters. The first is the name of the file that contains the commit log message. The second is the source of the commit message, and can be: message (if a -m or -F option was given); template (if a -t option was given or the configuration option commit.template is set); merge (if the commit is a merge or a .git/MERGE_MSG file exists); squash (if a .git/SQUASH_MSG file exists); or commit, followed by a commit SHA-1 (if a -c, -C or --amend option was given).
 
 
 ## Usage
 1. Copy or link `prepare-commit-msg` to this repositories' `./git/hooks/prepare-commit-msg`
 1. Run `run-demonstration.sh` and follow the on-screen directions. 
 
 
 ## Sources
 1 - https://git-scm.com/docs/githooks#_prepare_commit_msg