# DO NOT EDIT THIS FILE IT WILL BE OVERWRITTEN ON UPDATE
#
# Add portable user customizations ${CMDER_ROOT}/config/user-profile.sh,
# these customizations will follow Cmder if $CMDER_ROOT is copied
# to another machine.
#
# Add system specific users customizations to $HOME/.bashrc, these
# customizations will not follow Cmder to another machine.

# We do this for bash as admin sessions since $CMDER_ROOT is not being set
if [ "$CMDER_ROOT" == "" ] ; then
    case "$ConEmuDir" in *\\*) CMDER_ROOT=$( cd "$(cygpath -u "$ConEmuDir")/../.." ; pwd );; esac
else
    case "$CMDER_ROOT" in *\\*) CMDER_ROOT="$(cygpath -u "$CMDER_ROOT")";; esac
fi

# Remove any trailing '/'
CMDER_ROOT=$(echo $CMDER_ROOT | sed 's:/*$::')

export CMDER_ROOT

if [ -d "/c/Program Files/Git" ] ; then
    GIT_INSTALL_ROOT="/c/Program Files/Git"
elif [ -d "/c/Program Files(x86)/Git" ] ; then
    GIT_INSTALL_ROOT="/c/Program Files(x86)/Git"
elif [ -d "${CMDER_ROOT}/vendor/git-for-windows" ] ; then
    GIT_INSTALL_ROOT=${CMDER_ROOT}/vendor/git-for-windows
fi

if [[ ! "$PATH" =~ "${GIT_INSTALL_ROOT}/bin:" ]] ; then
  PATH=${GIT_INSTALL_ROOT}/bin:$PATH
fi

PATH=${CMDER_ROOT}/bin:$PATH:${CMDER_ROOT}

export PATH

# Drop *.sh or *.zsh files into "${CMDER_ROOT}\config\profile.d"
# to source them at startup.
if [ ! -d "${CMDER_ROOT}/config/profile.d" ] ; then
  mkdir -p "${CMDER_ROOT}/config/profile.d"
fi

if [ -d "${CMDER_ROOT}/config/profile.d" ] ; then
  unset profile_d_scripts
  pushd "${CMDER_ROOT}/config/profile.d" >/dev/null
  profile_d_scripts=$(ls *.sh 2>/dev/null)

  if [ ! "x${profile_d_scripts}" = "x" ] ; then
    for x in ${profile_d_scripts} ; do
      # echo Sourcing "${CMDER_ROOT}/config/profile.d/${x}"...
      . "${CMDER_ROOT}/config/profile.d/${x}"
    done
  fi
  popd >/dev/null
fi

if [ -f "${CMDER_ROOT}/config/user-profile.sh" ] ; then
    . "${CMDER_ROOT}/config/user-profile.sh"
else
    echo Creating user startup file: "${CMDER_ROOT}/config/user-profile.sh"
    cat <<-eof >"${CMDER_ROOT}/config/user-profile.sh"
# use this file to run your own startup commands for msys2 bash'

# To add a new vendor to the path, do something like:
# export PATH=\${CMDER_ROOT}/vendor/whatever:\${PATH}
eof
fi

# Source the users .bashrc file if it exists
if [ -f "${HOME}/.bashrc" ] ; then
    . "${HOME}/.bashrc"
fi
