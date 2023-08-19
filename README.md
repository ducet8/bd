# bash.d

bash directory (bash.d) autoloader

# installing

## automated bd-install (replace) [preferred]

```
curl -Ls https://raw.githubusercontent.com/bash-d/bd/main/bin/bd-install | bash -s _ replace
```

## automated bd-install (append)

```
curl -Ls https://raw.githubusercontent.com/bash-d/bd/main/bin/bd-install | bash -s _ append
```

## manual install

1) git clone `bd` into your home directory

```sh
cd && git clone https://github.com/bash-d/bd .bd
```

2) add something like this to the end of your `.bash_profile` and/or `.bashrc`

```sh
[ -r ~/.bd/00bd.sh ] && source ~/.bd/00bd.sh ${@}
```

## supported environment variables

* `BD_DEBUG` = `<level>` # Integer > 0.  Enable additional output to stderr.
* `BD_ANSI_EXPORT` = `1` # 1, true, or yes. Leave function `bd_ansi()` exported to the environment (for use in other scripts).
* `BD_DEBUG_EXPORT` = `1` #Use 1, true, or yes. Leave function `bd_debug()` exported to the environment (for use in other scripts).
* `BD_LEARN` = `1` # Use 1, true, or yes to leave the BD_BAG_DIRS() array set when bd is re-sourced.

## license

https://github.com/bash-d/bd/blob/main/LICENSE.md

## notes

Help Wanted
