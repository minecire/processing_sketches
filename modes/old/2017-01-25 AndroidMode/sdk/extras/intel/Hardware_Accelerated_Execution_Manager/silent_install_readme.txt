overall:
  Silent_install.sh will need root right to run, while "HAXM installation" will prompt one UI window to ask user for root right. 
  
  
Install:
	silent_install.sh [-m size] [-log log_full_path]
	  or
	./"HAXM installation" [-m size] [-log log_full_path]
    -m: memory size (in MB). if not specified, use default size.
    -log: the full path of the log file. if not specified, use default log path.
          default log path in Mac: /tmp/haxm_silent_run.log
	In case of success:
		Mac will print nothing. This is to be compliant with Mac shell convention.
		Return 0 to caller
	In case of fail:
		Print "install failed, please check log <log path> for detail"
		Return 1 to caller

Uninstall:
	silent_install.sh -u [-log log_full_path]
	  or
	./"HAXM installation" -u [-log log_full_path]
      -log: the full path of the log file. if not specified, use default log path.
          default log path in Mac: /tmp/haxm_silent_run.log
	In case of success:
		Mac will print nothing. This is to be compliant with Mac shell convention.
		Return 0 to caller
	In case of fail:
		Print "uninstall failed, please check log <log path> for detail"
		Return 1 to caller
	In case of haxm not installed:
		Print "HAXM is not installed!"
		Return 0 to caller

Misc
	silent_install.sh -v
	  or
	./"HAXM installation" -v
		If haxm is installed:
			Print out the haxm version
			Return 0 to caller
		If haxm is not installed:
			print nothing in terminal
			Return 1 to caller
		
	silent_install.sh -c
	  or
	./"HAXM installation" -c
		Check VT/NX capability of the platform
		Print following message:
			VT support -- yes|no
			NX support -- yes|no
		Return 0 to caller if both VT/NX are supported
		Return 1 to caller if either VT/NX is not supported.
	
	silent_install.sh -h
	  or
	./"HAXM installation" -h
		Print usage
		Return 0 to caller
	
	Wrong parameters:
		Print "Error: unknown command option! Please using -h to get help!"
		Return 1 to caller
	
known issues:
  1. XD/VT check with "-c" option will only show the CPU capability. it cannot tell if XD/VT is disabled by BIOS
