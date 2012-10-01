---
title: tmux - The Terminal Multiplexer
layout: note
---

## Installation

You can [install tmux from source](http://dandesousa.com/2011/10/06/installing-and-setting-up-tmux-on-mac-os-lion/) or you can use [Homebrew](http://mxcl.github.com/homebrew/) to install it for you. With Homebrew it was a simple:

    $ brew install tmux

## Starting tmux

    $ tmux

### Start a New Named Session

    $ tmux new -s foo

### Create a Background Session

    $ tmux new -s bar -d

### Re-attach to Single Session

    $ tmux attach

### Attach to Named Session

    $ tmux attach -t bar

### Kill a Named Session

    $ tmux kill-session -t basic

### List Running Sessions

    $ tmux ls

## Commands

By default, commands use the prefix `Ctrl-b`.

You can bind another prefix by putting the following in your `~/.tmux.conf`:

    set -g prefix C-a

You can unbind `Ctrl-b` by adding the following:

    unbind C-b

### Session Commands

* `PREFIX d` = Dettach from current Session
* `PREFIX $` = Rename Session

### Window Commands

* `PREFIX c` = Create Window in current Session
* `PREFIX ,` = Rename current Window
* `PREFIX n` = Move to next Window
* `PREFIX p` = Move to previous Window
* `PREFIX <number>` = Move to Window with specified numbered
* `PREFIX f` = Find Window by name
* `PREFIX w` = Display list of Windows
* `PREFIX &` = Close current Window with confirmation

### Pane Commands

* `PREFIX %` = Divide current Window/Pane in half vertically
* `PREFIX "` = Divide current Window/Pane in half horizontally
* `PREFIX o` = Cycle through Panes
* `PREFIX <arrow key>` = Switch to Pane in arrow key direction
* `PREFIX <spacebar>` = Cycle through Pane Layouts
* `PREFIX x` = Close current Pane (and Window if you're it's only Pane)
* `PREFIX { or }` = Swap panes in specified direction
* `PREFIX q` = Display Pane Numbers

### Select/Copy/Paste Commands

* `PREFIX [` = Enter selection mode
  * `<arrow keys>` = Move selection cursor
  * `/` = Search forwards
  * `?` = Search backwards
  * `<space>` = Start selecting text
  * `<enter>` = Copy selected text and exit Selection mode
  * `<esc>` = Clear selection
* `PREFIX ]` = Paste

## Resources

* [tmux](http://tmux.sourceforge.net/)
* [Homebrew](http://mxcl.github.com/homebrew/)
* [tmux - Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux)
* [Installing and setting up tmux on Mac OS Lion](http://dandesousa.com/2011/10/06/installing-and-setting-up-tmux-on-mac-os-lion/)
* [A Tmux Crash Course](http://robots.thoughtbot.com/post/2641409235/a-tmux-crash-course)

