if [ -d "${HOME}/profile.d" ] ; then
	for script in ${HOME}/profile.d/*.sh ; do
		echo Sourcing "${script}" ...
		"${script}"
		echo
	done
fi
