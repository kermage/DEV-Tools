if [ -d "${HOME}/profile.d" ] ; then
    profile_d_scripts=$( ls ${HOME}/profile.d/*.sh 2>/dev/null )

    if [ ! -z "$profile_d_scripts" ] ; then
        for x in ${profile_d_scripts} ; do
            echo Sourcing "${x}"...
            source "${x}"
        done
    fi
fi
