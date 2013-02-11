---
title: Metaprogramming in Ruby
layout: meetup
meetup_url: http://www.meetup.com/NYC-Ruby-Women/events/101100162/
published: false
---
code that generates code

## why?

avoid repetition

- repetitive definitions
- adaptive definitions
- re-definitiond

In Ruby... everything is metaprogramming

X.class_eval {define_method(:bar) { puts "bar" }

## Class Hierarchy

Object,Kernel - top level classes

BasicObject - new base object introduced by Ruby 1.9

## self and the eigenclass

eigen = one's very own

## Method Lookup

## Adaptive Definitions

Like Rails' `find_by_*`

When you dynamically define methods in `method_missing`, also override `respond_to?` to know about it as well.

Rails' alias_method_chain

Refinements in Ruby 2.0 for selective monkey patching.

