# docker-compose up
function docker_compose_up() {
	echo "Starting the development stack"
	echo "Running docker-compose up"
	
	docker-compose up
}

# docker-compose up -d
function docker_compose_up_d() {
	echo "Starting the development stack"
	echo "Running docker-compose up -d"

	docker-compose up -d

	# echo "\nWARNING:"
	# echo "In non-verbose mode you cannot see any logs (stdout/stderr) from the development stack"
	# echo "and on exit, containers will not automatically clean up after themselves.\n"
	# echo "To stop and clean after development, execute the following command:\n"
	# echo "  mm-docker stop\n"
	# echo "To view existing container logs, execute the following command:\n"
	# echo "  mm-docker logs\n"
	# echo "To view the synchronisation status, execute the following command:\n"
	# echo "  mm-docker monitor\n"
}

# docker-compose down
function docker_compose_down() {
	echo "Taking down the development stack"
	echo "Running docker-compose down"

	docker-compose down

	echo "Taken down development stack"
	echo "\nWARNING:"
	echo "Non-persistent volumes have not been deleted, this may cause syncronisation conflicts on next start.\n"
	echo "To delete non-persistent volumes (recommended), execute the following command:\n"
	echo "  docker-compose down -v\n"
}

# docker-compose down -v
function docker_compose_down_v() {
	echo "Taking down the development stack (not deleting non-persistent volumes)"
	echo "Running docker-compose down -v"

	docker-compose down -v

	echo "Taken down development stack and deleted non-persistent volumes"
}

#docker-compose logs
function docker_compose_logs() {
	docker-compose logs -f
}
