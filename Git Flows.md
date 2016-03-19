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