#!/bin/bash

# Home Portal Docker Setup Script

echo "🏠 Home Portal Docker Setup"
echo "=========================="

# Function to build and run with Docker
run_with_docker() {
    echo "📦 Building Docker image..."
    docker build -t home-portal .
    
    echo "🚀 Running container on port 80..."
    docker run -d --name home-portal -p 80:80 --restart unless-stopped home-portal
    
    echo "✅ Home Portal is now running at http://localhost"
}

# Function to run with Docker Compose
run_with_compose() {
    echo "📦 Building and starting with Docker Compose..."
    docker compose up -d --build
    
    echo "✅ Home Portal is now running at http://localhost"
}

# Function to stop containers
stop_containers() {
    echo "🛑 Stopping containers..."
    docker stop home-portal 2>/dev/null || true
    docker rm home-portal 2>/dev/null || true
    docker compose down 2>/dev/null || true
    echo "✅ Containers stopped"
}

# Function to show logs
show_logs() {
    echo "📋 Container logs:"
    docker logs home-portal 2>/dev/null || docker compose logs
}

# Main menu
case "${1:-menu}" in
    "build"|"run")
        stop_containers
        run_with_docker
        ;;
    "compose")
        stop_containers
        run_with_compose
        ;;
    "stop")
        stop_containers
        ;;
    "logs")
        show_logs
        ;;
    "restart")
        stop_containers
        sleep 2
        run_with_docker
        ;;
    "menu"|*)
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  build     - Build and run with Docker"
        echo "  compose   - Build and run with Docker Compose"
        echo "  stop      - Stop all containers"
        echo "  logs      - Show container logs"
        echo "  restart   - Restart the application"
        echo ""
        echo "Example: $0 build"
        ;;
esac
