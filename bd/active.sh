# Copyright (c) 2022 Joseph Tingiris
# https://github.com/josephtingiris/bash.d/blob/main/LICENSE.md

# sample; put in an etc/bash.d directory to see if it's 'active'
type -t bd_debug | grep -q "function" && [ -n "${BD_DEBUG}" ] && bd_debug "${BASH_SOURCE} is active" 1
