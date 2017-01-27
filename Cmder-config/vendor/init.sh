# Init Script for bash.exe

# Find root dir
CMDER_ROOT=$( cd "$( cygpath -u "$ConEmuDir" )/../.." ; pwd )

# Remove trailing '/'
CMDER_ROOT=$( echo $CMDER_ROOT | sed 's:/*$::' )

# Enhance Path
PATH=${CMDER_ROOT}/bin:$PATH:$CMDER_ROOT

if [ -f "${CMDER_ROOT}/config/user-profile.sh" ] ; then
    . ${CMDER_ROOT}/config/user-profile.sh
fi
