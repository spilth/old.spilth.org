---
title: tmuxinator
layout: note
---

> Manage complex tmux sessions easily

## Installation

tmuxinator is a Ruby Gem so you use the `gem` command to install it:

    gem install tmuxinator

You also want to make sure you set your `EDITOR` environment variable. Follow the additional installation instructions on the [official tmuxinator page](https://github.com/aziz/tmuxinator).

## Projects

tmuxinator uses project files stores in `~/.tmuxinator`.

### Create a New Project

    $ tmuxinator new <project_name>

### Run a Project

    $ tmuxinator <project_name>

### Edit an Existing Project

    $ tmuxinator open <project_name>

### List Projects

    $ tmuxinator list

## Resources

- [tmuxinator](https://github.com/aziz/tmuxinator)

