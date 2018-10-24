# Mutagen Docker Stack

Skeleton bash command script for development with docker compose and Mutagen.

**Before starting edit commands/mutagen.sh (line 36) so that the mutagen command is correct**


**THIS IS A WORK IN PROGRESS - DO NOT RELY FOR PRODUCTION USE**

```
Mutagen Docker development stack helper.
Helps start the docker stack including synchronisation.

USAGE:
   <command> [options]

COMMANDS:
  start         Start the docker stack and begin synchronisation
  stop          Stop the docker stack
  monitor       Monitor the existing synchronisation logs
  logs	        View output from running docker containers
  help          Display detailed help  
```

## ./mutagen-stack start

```
Creates a new mutagen synchronisation terminate and starts the development container stack

USAGE:
  start [options]

OPTIONS:
  -d, --detach   Detached mode: Run containers in the background (NOT RECOMMENDED)
```

## ./mutagen-stack stop

```
Stops existing development container stack and terminates any mutagen sessions

USAGE:
  stop [options]

OPTIONS:
  --keep-volumes   Keep docker non-persistent volumes (default behaviour)
  --clean          Remove docker non-persistent volumes
```

## ./mutagen-stack logs
Equivelant of `docker-compose logs`

## ./mutagen-stack monitor
By default calls `mutagen monitor`. Any arguments after monitor get passed to the mutagen binary so eg:

```
./mutagen-stack monitor : mutagen monitor
./mutagen-stack monitor monitor: mutagen monitor
./mutagen-stack monitor logs: mutagen logs

```

