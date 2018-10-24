# Command executed when user runs 'start'
function start_command() {

	# TODO: If connected, kick off

	if [ -z "$1" ]; then

		# No arguments

		# If we do ctrl+c, we want to execute the stop command to
		# tidy up after ourselves
		trap stop_command EXIT

		# Start the docker stack in detached mode
		docker_compose_up_d

		# Clean any existing mutagen sessions and start one
		mutagen_clean_and_start

		# Output the docker logs
		docker_compose_logs

	elif [[ -n "$1" ]] && [[ "${1#*.}" == "-help" ]] || [[ "${1#*.}" == "--help" ]]; then
		
		# Help agument

		start_command_help

	elif [[ -n "$1" ]] && [[ "${1#*.}" == "-d" ]] || [[ "${1#*.}" == "--detach" ]]; then
		
		# Detached agument, boo!

		# Start the docker stack in detached mode
		docker_compose_up_d

		# Clean any existing mutagen sessions and start one
		mutagen_clean_and_start

	else
		
		# Invalid command, show help

		echo "Invalid option $1"
		start_command_help
	fi

}

# Help for this command
function start_command_help() {

  cat <<END;

Creates a new mutagen synchronisation terminate and starts the development container stack

USAGE:
  start [options]

OPTIONS:
  -d, --detach   Detached mode: Run containers in the background (NOT RECOMMENDED)

END
  exit 1
}