#! /bin/bash

initial_commit=$(git log --oneline | awk 'NR==1{print $1}')
echo "Resetting --hard to $initial_commit"
git reset --hard HEAD > /dev/null

echo "Add demo-file and stage it"
echo "foo" >> demo-file
git add demo-file
echo "Expecting to see 'message' as source of commit message now:"
git commit --squash="$initial_commit" -m "Add demo-file" > /dev/null
first_commit=$(git log --oneline | awk 'NR==1{print $1}')
echo "Now we're on first commit: $first_commit"
echo
echo
echo "______________________________________________"
echo "Rebasing with autosquash."
echo "While your GIT_EDITOR  is running to modify the squashed commit message, 'ls .git' in a separate terminal and see that a 'SQUASH_MSG' file exists."
echo "Therefore, we'd expect to see 'squash' as source of commit message now."
echo
echo
BACKUP_GIT_SEQUENCE_EDITOR=$GIT_SEQUENCE_EDITOR
export GIT_SEQUENCE_EDITOR=:
git rebase -i --autosquash "$initial_commit^"
echo
echo
echo "Resetting --hard to initial commit: $initial_commit again."
git reset --hard "$initial_commit"
export GIT_SEQUENCE_EDITOR=$BACKUP_GIT_SEQUENCE_EDITOR