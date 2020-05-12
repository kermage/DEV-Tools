# use this file to run your own startup commands

. "${CMDER_ROOT}/config/scripts/add-keys.sh"
. "${CMDER_ROOT}/config/user_aliases.sh"

eval "$(gulp --completion=bash)"
