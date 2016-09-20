## Git Flows


#### <a name="branch">Branch</a>

### Create new branch

Create a new branch from current branch and check it out:

```
git checkout -b <name-of-new-branch>
```

Create a new branch from current branch without checking it out:

```
git branch <name-of-new-branch>
```

### Create new branch from an old commit

Create a new branch from current branch and check it out:

```
git checkout -b <name-of-new-branch> <sha1-commit-id>
```

Create a new branch from current branch without checking it out:

```
git branch <name-of-new-branch> <sha1-commit-id>
```

#### <a name="undo">Undo</a>

### Reset uncommited local changes

```
git reset --hard
```

### Reset changes to an old commit

```
git reset --hard <sha1-commit-id>
```

### Modify last commit

```
git commit --amend (You shouldn't amend published commits!)
```

### Remove folder or file from previous history
```
git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch <foldername>/'
```
```
git filter-branch --index-filter 'git rm --cached --ignore-unmatch <filename>'
```

#### <a name="undo">Stash</a>

### Stashing specific files

First, stage the files that you don't want to be stashed. 

```
git stash save --keep-index
```
