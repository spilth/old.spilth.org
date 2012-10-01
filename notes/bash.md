---
title: Bourne-Again SHell (BASH)
layout: note
---

## Set vi Mode in Bash

    set -o vi

## Environment Variables

To set an environment variable:

    foo="Hello, world."

To set an environment variable to the result of a command:

    bar=`date`
    bar=$(date)

To see the value of an environment variable:

    echo $foo
    echo $bar

Export an environment varible so programs can access them:

    export foo="Hello, world"
    export bar

To see all environment variables

    set

## Aliases

Create aliases using the form:

    alias <name>=<command>

Remove an alias by using the form:

    unalias <name>

List all aliases:

    alias

## Customize Your Prompt

You can customize the prompt by altering the variable `PS1`:
    PS1="\w \@ \$"

## Bash Scripting

### Script Environment Variables

* `$0` = the name of the script being called
* `$#` = the number of arguments passed to the script
* `$1` = the value of the first argument
* `$@` = space delimited list of all arguments

### If Then Else

    if [ condition ]
    then
        # whatever
    fi

    if [ condition ]
    then
        # whatever
    elif [ another condition ]
    then
        # whatever else
    else
        # and more
    fi

### Loops

    for x in a b c d
    do
      echo "Value is $x"
    done

### While & Until

    while [ condition ]
    do
      # stuff
    done

    until [ $answer -eq 42 ]
    do
      # stuff that hopefully sets answer to 42, eventually
    done

### Case Statements

    case value in
      value1)
        command
        ;;
      value2)
        command
        ;;
      *)
        command
        ;;
    esac

### Functions

To define a function:

    functionname() {
      # Function body
    }

## Resources

* [Bash Reference Manual](http://www.gnu.org/software/bash/manual/bashref.html)
* [Advanced Bash-Scripting Guide](http://www.tldp.org/LDP/abs/html/index.html)

