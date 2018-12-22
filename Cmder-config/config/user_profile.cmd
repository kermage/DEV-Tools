:: use this file to run your own startup commands
:: use @ in front of the command to prevent printing the command

@CALL "%GIT_INSTALL_ROOT%\cmd\start-ssh-agent.cmd"
@CALL "%CMDER_ROOT%\bin\add-keys.bat"
