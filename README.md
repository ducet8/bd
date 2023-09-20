# bash.d

bash directory (bash.d) autoloader

# installing

### what you will probably want to do

```
curl -Ls https://raw.githubusercontent.com/bash-d/bd/main/bin/bd-install | bash -s _ append
```

### what I do

```
curl -Ls https://raw.githubusercontent.com/bash-d/bd/main/bin/bd-install | bash -s _ replace
```

### try it

1) clone `bd` into your home directory
    ```sh
    cd && git clone https://github.com/bash-d/bd .bd
    ```

2) paste this or add something like it to the end of your `.bash_profile` and/or `.bashrc`
    ```sh
    [ -r ~/.bd/bd.sh ] && source ~/.bd/bd.sh ${@}
    ```

## supported environment variables

* `BD_DEBUG` = `<level>` # Integer > 0.  Enable additional output to stderr.
* `BD_ANSI_EXPORT` = `1` # 1, true, or yes will export the function `bd_ansi()` to the environment (for use in other scripts).
* `BD_DEBUG_EXPORT` = `1` # 1, true, or yes will export the function `bd_debug()` to the environment (for use in other scripts).
* `BD_LEARN` = `1` # Use 1, true, or yes to leave the BD_BAG_DIRS() array set when bd is re-sourced.

## license

https://github.com/bash-d/bd/blob/main/LICENSE.md

## notes

Help Wanted
