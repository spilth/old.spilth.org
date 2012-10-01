---
title: Git & Subversion
layout: note
---

## Check out your Subversion project

If your project has a standard layout (trunk, branches, tags) use the following command:

	git svn clone -s http://example.com/my_subversion_repo local_directory
	cd local_directory

## Turn svn:ignore into .gitignore

	git svn show-ignore > .gitignore
	git add .gitignore
	git commit -m "Adding .gitignore"

## Create and switch to local Git branch to work in

	git checkout -b your_branch_name

## Make Changes and Commit

	git add whatever
	git commit -m "Good commit message here"

## Merge Your Branch into the Master Branch

	git checkout master
	git merge your_branch_name

## Get any updates from Subversion

	git svn rebase

*Remember to run your tests against any updates you pulled down.*

## Commit your changes back to Subversion

	git svn dcommit

## Resources

* [Effectively Using Git With Subversion](http://www.viget.com/extend/effectively-using-git-with-subversion/)
