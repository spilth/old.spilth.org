---
title: Git
layout: note
---

> Git is a free & open source, distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

## Configuration

### Set Name and Email Address

	$ git config --global user.name "Your Name"
	$ git config --global user.email "yourname@yourdomain.com"

### Set Colors

	$ git config color.ui true

## General Commands

### Create a Repository

	$ mkdir project
	$ cd project
	$ git init

### Ignore Files or Directories

Create `.gitignore` and add file and directory globs:

	dist
	tmp
	log
	.DS_Store

### See List of Changed Files

	$ git status
	
### See Difference of Files

	$ git diff

### Stage Files for Committing

	$ git add foo.txt
	$ git add bar.txt

### Unstage a File

	$ git reset HEAD bar.txt

### See Differences of Staged Files

	$ git diff --cached
	
### Commit Staged Files

	$ commit -m "Your Message Here"

### Revert a Changed File

	$ git checkout name/of/file

## Branching

### Create a Branch

	$ git branch <branchName>

### Switch to a Branch

	$ git checkout <branchName>

### Create and Switch to Branch

	$ git checkout -b <branchName>

### Switch back to master Branch

	$ git checkout master

### List Local Branches

	$ git branch

### List Remote Branches

	$ git branch -r

### List Local and Remote Branches

	$ git branch -a

### Merge changes from another Branch

	$ git merge <branchName>
	
### Rename a Branch

	$ git branch -m <currentName> <newName>

### Force Rename of Branch

	$ git branch -M <currentName> <newName>

### Delete a Branch if differences have been merged into current branch

	$ git branch -d <branchName>

### Force Deletion of Branch

	$ git branch -D <branchName>
	
## Delete Remote Branch

	$ git branch -d -r <remoteName>/<branchName>
	$ git push <remoteName> :<branchName>

## Remote Repositories

### Show List of Remote Repositories

	$ git remote
	
### Add a Remote Repository

	$ git remote add <remoteName> <url>
	
### Remove a Remote Repository

	$ git remote rm <remoteName>
	
### Rename a Remote Repository

	$ git remote rename <oldRemoteName> <newRemoteName>

### Push to a Remote Repository

	$ git push <remoteName> <branchName>
	
### Pushing to Multiple Remote Repositories at Once

If you want to push to multiple remote repositories using a single name you can first add the two remotes separately and then end `.git/config` to add a third remote that combines both of them together:

	[remote "heroku"]
		url = git@heroku.com:bnd-notes.git
		fetch = +refs/heads/*:refs/remotes/heroku/*
	[remote "github"]
		url = git@github.com:buildndeploy/notes.git
		fetch = +refs/heads/*:refs/remotes/github/*
	[remote "external"]
	    url = git@github.com:buildndeploy/notes.git
		url = git@heroku.com:bnd-notes.git
		fetch = +refs/heads/*:refs/remotes/heroku/*

Then you can update them with a single command:

	$ git push external

## Stashes

	git stash / git stash save
	git stash list
	git stash apply <stash>
	git stash apply stash@{0}
	git stash pop

## GitHub Fork Merge

    $ git remote add upstream git://github.com/qgis/Quantum-GIS.git
    $ git fetch upstream
    $ git merge upstream/master


