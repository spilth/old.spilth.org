---
title: tmux & vim
layout: note
---

A reminder of how to do some common things with Windows, Panes and Tabs in both tmux and vim since I use them together so much.

## tmux Panes / vim Windows

split horizontally
	tmux ctrl-a "
	vim :split or :sp or ctrl-w n

split vertically
	tmux ctrl-a %
	vim :vsp or ctrl-w v

next window
	tmux ctrl-a o
	vim ctrl-w w
	
close current
	tmux ctrl-a x
	vim :q or ctrl-w q

## tmux Windows / vim Tabs

new tab
	tmux ctrl-a c
	vim :tabnew

next tab
	tmux ctrl-a n
	vim gt

previous tab
	tmux ctrl-a p
	vim gT

switch tab
	tmux ctrl-a <tab_number>

