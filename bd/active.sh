# Copyright (c) 2022 Joseph Tingiris
# https://github.com/bash-d/bd/blob/main/LICENSE.md

#
# metadata
#

# vim:ts=4:sw=4

# sample; put in an etc/bash.d directory to see if it's 'active'
type -t bd_debug | grep -q "function" && [ -n "${BD_DEBUG}" ] && bd_debug "${BASH_SOURCE} is active" 1
