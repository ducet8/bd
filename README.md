# bash.d

an autoloader for bash shell source

## basic user install

1) Get `00bd.sh` into your home directory.

```sh
cd && curl --create-dirs --output etc/bash.d/00bd.sh https://raw.githubusercontent.com/bash-d/bd/main/00bd.sh
```

2) And, add this to the end of your `.bash_profile` or `.bashrc`.

```sh
[ -r ~/etc/bash.d/00bd.sh ] && export BD_DEBUG=${BD_DEBUG:-0} && source ~/etc/bash.d/00bd.sh ${@}
```
Note: For the `bd` alias to work, be sure to pass any arguments with ${@}.

## basic system install

1) Optionally, get `Z00bd.sh` into /etc/profile.d, e.g.

```sh
cd /etc/profile.d && sudo curl --output Z00bd.sh https://raw.githubusercontent.com/bash-d/bd/main/00bd.sh && chmod 0644 Z00bd.sh
```

## development install

## environment variables

* `BD_DEBUG` = `<LEVEL>` # Integer > 0.  Enable additional debugging output to stderr.

## copyright

    Copyright (c) 2022 Joseph Tingiris
    mailto:joseph.tingiris@gmail.com

## license

https://github.com/bash-d/bd/blob/main/LICENSE.md

## motivation

Most linux distributions extend how bash executes its startup files, and implement /etc/profile.d as a system-wide autoloader for bash environment profiles.  That's a very useful idea.

Typically, a modern distro's /etc/profile has a logic chain to source /etc/bashrc, and then /etc/bashrc has more logic to source everything in /etc/profile.d.  Often, they're the last lines of logic in /etc/profile & /etc/bashrc (which is most apropos).

Multiple use cases ...

1) I login as a non-root user, and do not have root (or, I do have root but don't want to pollute the system).
2) I am root.  I want everyone who logs in to have certain profile settings.
    * additionally, I want 'my' profile additions to be executed AFTER the system's.  yes, I know I can order them properly and get /etc/profile.d to do (mostly) what I want it to do, as root, but ... if I start changing other packages' /etc/profile.d files then a couple negative consequences result (if they're removed, package updates put them back & if they're modified, they won't get the latest package updates).  so, I want to add something of my own that won't conflict with the distribution.  I want it to automatically execute a bunch of scripts AFTER /etc/bashrc, and after everything in /etc/profile.d, and maybe BEFORE anything in my ~/.bash_profile.  I also want to mimic /etc/profile.d so that it can execute everything in ~/etc/bash.d or ${PWD}/etc/bash.d.  I want something smarter & more flexible for my (bash) profiles.
 
This is the repo for that.

**bash.d**

## objectives

* pure bash (as much as possible)
* no duplicate executions
* no recursion loops; definite, predictable order of execution
* don't break /etc/profile.d, override if needed
* don't rely on /etc or root access
* work _with_ /etc/profile.d, /etc/bash.d, ~/etc/bash.d & $PWD/etc/bash.d

## notes

### bash order of operation + profile.d & bash.d shims

#### interactive login shell

WIP

```
B)      /etc/profile
S)      /etc/profile.d/Z00bd.sh (for normal distributions, this should be first in most natural sort orders, therefore sourced first, which is the goal.  This allows for /etc/.bash.d/*.sh to be sourced before the distribution's /etc/profile.d)  This also leaves room for stuff before 00bd.sh, e.g. 000*)
S)      /etc/bash.d/*.sh

D)      /etc/profile.d/sh.local (fedora)
D)      /etc/bashrc (sources natural sort order for /etc/profile.d/*.sh)
S)      ${User_Dir}/etc/bash.d
S)      ${HOME}/etc/bash.d
D)      /etc/profile.d/*.sh (remainder)
B)      ~/.bash_profile [else]
D[U])   ~/.bashrc
B[*])      ~/.bash_login [else]
B[*])      ~/.profile
U)      ~/etc/bash.d/*.sh (first in ~/.bashrc)
U)      ... more of what's in (between) ~/.bashrc, that may have bash.d dependencies
U)      ~/etc/profile.d/*.sh (last in ~/.bashrc; may depend on bash.d)
```

#### interactive non-login shell

```
B)      ~/.bashrc
```

bash profile order (for an interactive login shell). from man bash (1) ...

       When bash is invoked as an interactive login shell, or as a non-interactive shell with the --login  option,
       it  first  reads and executes commands from the file /etc/profile, if that file exists.  After reading that
       file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and  reads  and  executes
       commands from the first one that exists and is readable.  The --noprofile option may be used when the shell
       is started to inhibit this behavior.

       When an interactive login shell exits, or a non-interactive login shell executes the exit builtin  command,
       bash  reads and executes commands from the files ~/.bash_logout and /etc/bash.bash_logout, if the files ex‐
       ists.

       When an interactive shell that is not a login shell is started,  bash  reads  and  executes  commands  from
       ~/.bashrc,  if  that file exists.  This may be inhibited by using the --norc option.  The --rcfile file op‐
       tion will force bash to read and execute commands from file instead of ~/.bashrc.

       If bash is invoked with the name sh, it tries to mimic the startup behavior of historical versions of sh as
       closely  as possible, while conforming to the POSIX standard as well.  When invoked as an interactive login
       shell, or a non-interactive shell with the --login option, it first attempts to read and  execute  commands
       from /etc/profile and ~/.profile, in that order.

... and so on.
