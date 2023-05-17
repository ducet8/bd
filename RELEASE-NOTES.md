# 0.40.1

- fix regression; honor BD_ANSI_EXPORT [to export bd_ansi()]

# 0.40.0

- handle arguments differently
- handle missing functions better
- add bd-ansi alias & executable wrapper
- add bd-debug alias & executable wrapper
- rename bd_load*() to bd_autoload*()
- different debug colors for levels 0-9
- localize BD_LC_COLLATE
- change embedded bag dir from 'bd' to 'bash.d'
- automatically bag all subdirectories in $BD_HOME/etc/bash.d (and $HOME/etc/bash.d)
- add bd_unset() & unset all bd_* functions after loading
- bd update now pulls from git repo (if .git dir exists)
- add bd env argument
- add bd license argument
- add bd functions argument
- add BD_BASH_INIT_FILE, BD_SOURCE, & BD_DIR exports
- add BD_*_SH exports
- support .bd.conf or .bash.d.conf files
- add bd-root.sh which automatically sets bd-root & bd-root-profile aliases
- add bin/bd-ansi executable wrapper for bd_ansi()
- add bin/bd-debug executable wrapper for bd_debug()
- add bin/bd-license
- updated license
