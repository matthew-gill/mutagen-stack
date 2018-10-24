# On exit, we want to close out docker and mutagen
function exit_trap() {
    #docker-compose down -v
    docker_compose_down_v

    mutagen_clean
}

# Check that we can connect to the docker demon
# Todo, if not connected, auto connedt
function ensure_connected() {

  if [[ -z "${DOCKER_CERT_PATH}" ]]; then
	  echo "Not connected to docker engine - have you run the quickstart terminal first?"
	  exit 1
	fi

}

# Check if docker containers are running
function are_containers_running() {
	# todo
  echo "Checking if containers are running"
}

# App help command
function help_command() {

  cat <<END;

Mutagen Docker development stack helper.
Helps start the docker stack including synchronisation.

USAGE:
  $SCRIPT_NAME <command> [options]

COMMANDS:
  start         Start the docker stack and begin synchronisation
  stop          Stop the docker stack
  monitor       Monitor the existing synchronisation logs
  logs	        View output from running docker containers
  help          Display detailed help

END
  exit 1
}