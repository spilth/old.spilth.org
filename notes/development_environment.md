---
title: My Development Environment
layout: note
---

## Basics

- I use a Mac running OS X Mountain Lion (or Snow Leopard at work)
- I use Terminal at home (Mountain Lion) or [iTerm 2](http://www.iterm2.com/) at work (Snow Leopard) so I can get a 256 color terminal.
- [vim](http://www.vim.org/) is my text editor.
  - I used to use [TextMate](http://macromates.com/).
- I use [tmux](http://tmux.sourceforge.net/) to create a custom "IDE" of sorts for my projects.
- I use [RVM](https://rvm.io/) for managing Ruby versions
- I keep my projects on [GitHub](https://github.com/spilth/) or [Heroku](http://www.heroku.com/)
- I also keep all my projects (and symlinked dotfiles) in [DropBox](https://www.dropbox.com/) so they're easily accessible and synchronized.

## When I want to work on a project?

- Start terminal app
- `cd` to project diretory
- `tmux new -s <session_name>`
  - I could also use [tmuxinator](https://github.com/aziz/tmuxinator/) to automate working directory, Ruby version via RVM and widow/pane setup.
- `vim` in the main window usually
- If I'm feeling extra retro, I make my terminal app fullscreen.

## When I want to work on another project?

- Command-T to open up a new tab in Terminal
- `cd` to the directory of project
- `tmux new -s <session_name>`
  - tmux session name helps me keep track of which project I'm working on

## What projects do I usually have open?

- core project/Rails app I'm working on
- my [dotfiles](https://github.com/spilth/dotfiles) project to keep that updated
- my [notes](https://github.com/spilth/notes) project where I keep my tech notes updated
- other projects I might want to reference

## When I want to switch between projects?

- Command { and }

## Switch between tmux windows?

- Control-A `<window_number>`

## What does it look like?

<div class="thumbnail"><a href="https://skitch.com/spilth/ekuqw/screen-shot-2012-08-03-at-11.19.25-am"><img style="max-width:638px" src="https://img.skitch.com/20120803-xm3269hqrtjb1hxur8r5nndeea.medium.jpg" alt="Screen shot 2012-08-03 at 11.19.25 AM" /></a></div>

## Downsides/Problems?

- Need to sort out copying to the Mac system clipboard
- mouse selection is cross-pane in tmux

## Confessions

- I still keep TextMate open to take adhoc notes / make to do lists

