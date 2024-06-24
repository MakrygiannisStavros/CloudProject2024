#!/bin/bash

# Function to build and start the Docker containers
start_containers() {
    echo "Building and starting Docker containers..."
    docker-compose up --build -d
    if [ $? -eq 0 ]; then
        echo "Docker containers started successfully."
    else
        echo "Failed to start Docker containers."
        exit 1
    fi
}

# Function to stop the Docker containers
stop_containers() {
    echo "Stopping Docker containers..."
    docker-compose down
    if [ $? -eq 0 ]; then
        echo "Docker containers stopped successfully."
    else
        echo "Failed to stop Docker containers."
        exit 1
    fi
}

# Function to show usage
show_usage() {
    echo "Usage: $0 {start|stop|restart}"
    exit 1
}

# Check if Docker and Docker Compose are installed
check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "Docker could not be found. Please install Docker first."
        exit 1
    fi

    if ! command -v docker-compose &> /dev/null; then
        echo "Docker Compose could not be found. Please install Docker Compose first."
        exit 1
    fi
}

# Main script logic
check_docker

case "$1" in
    start)
        start_containers
        ;;
    stop)
        stop_containers
        ;;
    restart)
        stop_containers
        start_containers
        ;;
    *)
        show_usage
        ;;
esac
