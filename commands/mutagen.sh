# Clean out any existing mutagen sessions and start a new one
function mutagen_clean_and_start() {

	mutagen_clean

	# Start mutagen synchronisation
	start_mutagen_session

}

# Clean out any mutagen sessions
function mutagen_clean() {

	echo "Cleaning mutagen sessions"

	# Ensure mutagen session started
	mutagen daemon start

	# Terminate any existing sessions
	mutagen terminate -a

	# Terminate any existing sessions
	mutagen daemon stop

}

# Start a new mutagen session
function start_mutagen_session() {

	# Ensure mutagen session started
	mutagen daemon start

	echo "Starting mutagen sessions"

	# Create a new mutagen session
	mutagen create \
	    --symlink-mode ignore \
	    --ignore-vcs \
	    --ignore ".DS_Store" \
	    --ignore "._*"  \
	    --ignore "vendor/"  \
	    --ignore "node_modules/"  \
	    --ignore "app/logs/"  \
	    --ignore ".idea/"  \
	    src docker://$(docker-compose ps -q php)/var/www/src
}