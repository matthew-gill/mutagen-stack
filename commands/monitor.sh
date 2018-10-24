# Command executed when user runs 'monitor'
# Essentially a wrapper for the mutagen command
function monitor_command() {

	if [ -z "$1" ]; then

		# No arguments, default to running mutagen monitor command

		mutagen monitor

	else

		# Arguments specified, pass them onto mutagen

		mutagen "${@:1}"

	fi
}

# Help for this command
function monitor_command_help() {

  cat <<END;

Interact with mutagen, usually to monitor an existing session

USAGE:
  monitor [options]

OPTIONS:
  If no options are passed, mutagen monitor is executed
  ANY options are passed to mutagen

END
  exit 1
}