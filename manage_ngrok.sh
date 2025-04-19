#!/bin/bash

# Function to display usage
show_usage() {
    echo "Usage: $0 [frontend|backend|ai_ml] [port]"
    echo "Example: $0 frontend 3000"
    echo "Example: $0 backend 8000"
    echo "Example: $0 ai_ml 5000"
    exit 1
}

# Check if ngrok is installed
check_ngrok() {
    if ! command -v ngrok &> /dev/null; then
        echo "ngrok is not installed. Please install it first:"
        echo "Windows (with chocolatey): choco install ngrok"
        echo "Mac: brew install ngrok"
        echo "Linux: snap install ngrok"
        exit 1
    fi
}

# Check if docker containers are running
check_docker() {
    if ! docker ps | grep -q "$1"; then
        echo "Docker container for $1 is not running."
        echo "Please start the services using docker-compose up first."
        exit 1
    fi
}

# Main script
if [ "$#" -ne 2 ]; then
    show_usage
fi

SERVICE=$1
PORT=$2

check_ngrok
check_docker $SERVICE

echo "Starting ngrok tunnel for $SERVICE on port $PORT..."
ngrok http $PORT 