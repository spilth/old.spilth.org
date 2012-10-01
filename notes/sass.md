# SASS

## Foundations

.scss or .sass

CSS is valid SASS

// is a single line comment and are not compiled

@import happens at compiled time.

@import buttons

buttons.scss generates separate buttons.css
_buttons.scss doesn't generate a separate file

### Nesting Selectors

.content {

	h2 {
	
	}
	
	p {
	
	}

}

### Nesting Properties

.btn {
	text: {
		decoration: underline;
		transform: lowercase;
	}
}

### Parent Selector

a {
	&:hover {
		color: #ccc;
	}
}

## Variable

### Declaration

$base: #777777

.sidebar {
	color: $base;
}

$title: 'Foo' !default; // don't override previous declarations

Good way to provide defaults in partials

### Types

- booleans
- numbers
- colors
- strings
- lists (comma or space separated)
- null

### Scope

{ } defines scope

### Interpolation

	#{$variable}
	
	$side: top;
	
	sup {
		position: relative;
		#{$side}: -0.5em;
	}
	
	.callout-#{side} {
		background: #777;
	}

$color-base is better than $color-blue

## Mixin

### Setup

#### Define Mixin

	@mixin button {
		border: 1px solid #ccc;
	}
	
#### Use

	.button-a {
		@include button;
		background: #777;
	}
	
### Arguments

	@mixin box-sizing($x) {
		-webkit-box-sizing: $x;
		-moz-box-sizing: $x;
		box-sizing: $x;
	}


	.content {
		@include box-sizing(content-box);
	}

#### Default Value for Argument

	@mixin box-sizing($x: border-box) { ... }

#### Keyword Arguments

	@include button($color: #777777, $radius: 5px);
	
#### Passing Comma Separated CSS Values

	@mixin transition($val...) {
		-webkit-transition: $val;
		-moz-transition: $val;
	}
	
#### Variable Arguments in Reverse

	$propreties: 4px, #000;

	@include button($properties...);

## Extend

