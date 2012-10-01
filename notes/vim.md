---
title: vim
layout: note
---

My vim dot files are available in [my dotfiles project on GitHub](https://github.com/spilth/dotfiles).

## Basic Usage

* Start vim with `vim` or `vim <filename>` to edit a specific file.
* Press `i` to enter Insert Mode.
* Type text.
* Press `esc` to enter Command Mode.
* Type `:wq` to write file and quit, or `:q!` to quit without saving. 

## Basic Commands

* `esc` = enter command mode 
* `i` = enter insert mode
* `:w` = write file
* `:wq` = write file and quit vim
* `:q!` = quit without writing changes

## Help Basics

* `:help` = open help window
* `:help <topic>` = open help and jump to topic
* `ctrl-w w` = jump between help/file windows
* `ctrl-w q` = close help window

## Movement

### Basic Movement

* `j` = move cursor down
* `k` = move cursor up
* `h` = move cursor left
* `l` = move cursor right

### Character Movement

* `f<character>` = move cursor to the next character in the current line
* `F<character>` = move cursor to the previous character in the current line
* `t<character>` = move cursor before the next character in the current line
* `T<character>` = move cursor after the previous character in the current line
* `;` = repeat last f, t, F or T
* `,` = repeat last f, t, F or T in opposite direction

### Word Movement

* `w` = jump to next word start 
* `b` = jump to previous word start
* `e` = jump to next word end
* `ge` = jump to previous word end
* `W` = jump to next whitespace-delimited word start
* `B` = jump to previous whitespace-delimited word start 
* `E` = jump to next whitespace-delimited word end
* `gE` = jump to previous whitespace-delimited word end

### Sentence Movement

* `)` = move to next sentence start
* `(` = move to previous sentence start

### Paragraph Movement

* `}` = move to next paragraph start
* `{` = move to previous paragraph start

### Line Movement

* `:<number>` = jump to line number
* `0` = move to beginning of line
* `^` = jump to first non-black character of line 
* `$` = move to end of line
* `H` = jump to first line of screen
* `M` = jump to middle line of screen
* `L` = jump to last line of screen
* `zt` = make the current line the top of the window
* `zz` = make the current line the middle of the window
* `zb` = make the current line the bottom of the window
* `ctrl-e` = scroll screen one line up
* `ctrl-y` = scroll screen one line down

### Block Movement

* `%` = move to closing compliment of character under cursor (open/close type items)

### Page Movement

* `ctrl-f` = jump one page down
* `ctrl-b` = jump one page up
* `ctrl-d` = jump half page down
* `ctrl-u` = jump half page up

### File Movement

* `gg` = jump to start of file
* `G` = Jump to end of file

## Insertion

* `i` = insert before cursor
* `a` = insert after cursor
* `I` = insert at beginning of line
* `A` = insert at end of line
* `o` = append below current line
* `O` = insert above current line

## Replacement

* `r` = replace single character
* `~` = switch case of character
* `cw` = change from cursor to end of word
* `ciw` = change entire word cursor is inside of 
* `c$` or `C` = change to end of line
* `cc` = change entire line
* `ct<character>` = change until character
* `R` = enter replacement mode

## Cut

* `x` = cut character under cursor
* `X` = cut character before cursor
* `dw` = cut current word
* `dd` or `:d` = cut line
* `<number>dd` = cut number lines
* `"<letter>dd` = cut line and create register named after letter
* `"<LETTER>dd` = cut line and append to register named after letter

## Copy

* `yw` = copy a word
* `y$` = copy to end of line
* `yy` or `Y` = copy entire line
* `<number>yy` = copy number lines
* `"<letter>yy` = yank line and create register named after letter
* `"<LETTER>yy` = yank line and append to register named after letter

## Paste

* `p` = paste below cursor
* `P` = paste above cursor
* `"<letter>p` = paste text after cursor from buffer named after letter
* `"<number>p` = paste text after cursor from most recently deleted text

Undoing a numbered paste and then using the `.` command will paste from the next numbered buffer.

## Registers

* `:reg` = show contents of all registers
* `:reg <letter|number>` = show contents of 

## Selection

* `v` = enter character selection mode
* `V` = enter line selection mode

#### Visual Mode Commands

* `>` = shift right
* `<` = shift left
* `c` = change highlighted text
* `y` = copy highlighted text
* `d` = cut highlighted text

## Undo / Redo

* `u` = undo last action
* `U` = undo latest changes to current line
* `Ctrl+r` = redo

## Search

* `/<pattern>` = Search for pattern
* `n` = search for next match
* `N` = search for previous match

### Search & Replace

* `:s/this/that/g` = change all this to that in current line
* `:s/this/that/gi` = change all this to that in current line, case-insensitive
* `:s/this/that/gic` = change all this to that in current line, case-insensitive, ask for confirmation
* `:%s/this/that/g` = change all this to that in current file

## Folding

* `za` = fold/unfold current section
* `zM` = fold all section
* `zR` = unfold all sections

## Files

* `:r <name>` = insert file name below cursor
* `:r !<command>` = execute command and insert its output below cursor
* `:f` or `ctrl-g` = display file info in status line

## Tabs

* `:tabnew <file>` = open file in a new tab
* `:tabs` = list open tabs
* `:tabclose` = close current tab
* `:tabonly` = close all tabs but current
* `:tabf<space><name>` = search for file in current directory, open in new tab
* `:tabn` or `gt` = switch to next tab
* `:tabp` or `gT` = switch to previous tab
* `:tabfirst` = switch to first tab
* `:tablast` = switch to last tab
* `:tabm<number>` = move current tab to tab position number (first tab is 0)
* `:tabdo <command>` = run command across all open tabs

### MacVim Tabbing

* `cmnd-}` = next tab
* `cmnd-{` = previous tab

## Windows

* `ctrl-w n` = create new window above current window
* `ctrl-w s` = split window in two
* `ctrl-w w` = switch between open windows
* `ctrl-w j` = switch to window below current window
* `ctrl-w k` = switch to window above current window
* `ctrl-w t` = switch to top window
* `ctrl-w b` = switch to bottom window
* `ctrl-w q` = close current window
* `ctrl-w o` = close all windows except current one
* `ctrl-w _` = maximize current window
* `ctrl-w =` = split windows equally
* `ctrl-w -` = shrink current window by one line
* `ctrl-w +` = grow current window by oneline
* `ctrl-w <number> -`= shrink curent window by number lines
* `ctrl-w <number> +`= grow curent window by number lines
* `ctrl-w K` = move current window to top
* `ctrl-w J` = move current window to bottom

## File Navigation

* `:n .<enter>` = show current directory listing. presss enter to open selected file

## System

* `:help runtimepath` = open help window for vim's runtime info

## Working Directory

* `:cd <directory>` = change the global vim working directory
* `:lcd <directory>` = change the working directory for the current window

## Resources

* [vim Quick Reference Card](http://tnerual.eriogerg.free.fr/vimqrc.html)
* [Vim Commands Cheat Sheet](http://fprintf.net/vimCheatSheet.html)
* [Janus: Carlhuda's vim Distribution](https://github.com/carlhuda/janus)
* [Vim Shortcuts
Wallpaper](http://naleid.com/blog/2010/10/04/vim-movement-shortcuts-wallpaper/)
* [Coming Home to
Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
* [Markdown Vim Mode](http://plasticboy.com/markdown-vim-mode/)
* [25 Vim Tutorials, Screencasts, and Resources](http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/)
* [Using vim like a Pro](http://tottinge.blogsome.com/use-vim-like-a-pro)
* [Kevin's Vim Tips and Tricks](http://www.8t8.us/vim/vim.html)
* [Vim Revisited](http://mislav.uniqpath.com/2011/12/vim-revisited/)
