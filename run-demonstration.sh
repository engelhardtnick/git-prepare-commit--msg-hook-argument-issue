#! /bin/bash

initial_commit=$(git log --oneline | awk 'NR==1{print $1}')
echo "Resetting --hard to current commit: $initial_commit"
git reset --hard HEAD > /dev/null

echo "Add demo-file and stage it"
echo "foo" >> demo-file
git add demo-file
echo "Expecting to see 'message' as source of commit message now:"
echo "press any key to continue"
read -r -n 1
git commit --squash="$initial_commit" -m "Add demo-file" > /dev/null
first_commit=$(git log --oneline | awk 'NR==1{print $1}')
echo
echo "Now we're on first commit: $first_commit"
echo "Moving on to rebasing with autosquash."
echo "While your GIT_EDITOR  is running to modify the squashed commit message, 'ls .git' in a separate terminal and see that a 'SQUASH_MSG' file exists."
echo "Therefore, we'd expect to see 'squash' as source of commit message now."
echo "press any key to continue"
read -r -n 1
BACKUP_GIT_SEQUENCE_EDITOR=$GIT_SEQUENCE_EDITOR
export GIT_SEQUENCE_EDITOR=:
git rebase -i --autosquash "$initial_commit^"
echo "Resetting --hard to initial commit: $initial_commit again."
git reset --hard "$initial_commit"
export GIT_SEQUENCE_EDITOR=$BACKUP_GIT_SEQUENCE_EDITOR