# Command executed when user runs 'stop'
function stop_command() {

	# TODO: If NOT connected, kick off

	if [ -z "$1" ]; then

		# No arguments

		# This is temporary while we decide the best clean up approach
		# Stop docker and keep non-permanent volumes
		docker_compose_down

		# Clean mutagen sessions
		mutagen_clean

	elif [[ -n "$1" ]] && [[ "${1#*.}" == "-help" ]] || [[ "${1#*.}" == "--help" ]]; then
		
		# Help agument

		stop_command_help

	elif [[ -n "$1" ]] && [[ "${1#*.}" == "--keep-volumes" ]]; then

		# Take down docker (keeping volumes)
		docker_compose_down

		# Clean the mutagen session
		mutagen_clean

	elif [[ -n "$1" ]] && [[ "${1#*.}" == "--clean" ]]; then

		# Down and remove volumes

		# Take down docker (removing volumes)
		docker_compose_down_v

		# Clean the mutagen session
		mutagen_clean

	else

		# Invalid command, show help

		echo "Invalid option $1"
		stop_command_help
	fi

}

# Help for this command
function stop_command_help() {

  cat <<END;

Stops existing development container stack and terminates any mutagen sessions

USAGE:
  stop [options]

OPTIONS:
  --keep-volumes   Keep docker non-persistent volumes
  --clean          Remove docker non-persistent volumes

END
  exit 1
}