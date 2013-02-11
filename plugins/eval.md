---
title: Eval Test
layout: index
---

## Ruby

{% eval ruby %}
puts "Hello, Ruby!"
{% endeval %}

## Python

{% eval python %}
print "Hello, Python!"
{% endeval %}

## Perl

{% eval python %}
print "Hello, Perl!";
{% endeval %}

## PHP

{% eval php %}
<?php
print "Hello, PHP!";
?>
{% endeval %}

## Error Tests

{% eval ruby %}
puts foo.to_s
{% endeval %}

{% eval python %}
foo
{% endeval %}

