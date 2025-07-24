# 🏠 Home Portal

A sleek, dark-themed home portal for accessing local network services. Built with simple HTML/CSS and containerized with Docker for easy deployment.

![Home Portal Preview](https://img.shields.io/badge/Status-Ready-brightgreen) ![Docker](https://img.shields.io/badge/Docker-Enabled-blue)

## ✨ Features

- **Dark Theme**: Modern dark UI design based on Figma mockups
- **Service Cards**: Quick access to local network services with visual indicators
- **Responsive Design**: Works on desktop and mobile devices
- **Docker Ready**: Fully containerized for easy deployment
- **Nginx Optimized**: Production-ready web server configuration
- **Custom Font**: Uses Absans font for consistent typography

## 🎯 Services Included

- **AdGuard**: Custom DNS filtering (Port 3001)
- **n8n**: AI Orchestrator workflow automation (Port 5678)

Each service card opens in a new tab and redirects to `192.168.1.2:{port}`.

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed on your system
- Access to your local network (192.168.1.2)

### Option 1: Using the Convenience Script (Recommended)

```bash
# Make the script executable (if needed)
chmod +x run.sh

# Build and run the container
./run.sh build

# Or use Docker Compose
./run.sh compose

# Stop the container
./run.sh stop

# View logs
./run.sh logs

# Restart the application
./run.sh restart
```

### Option 2: Using Docker Compose

```bash
# Build and start the container
docker-compose up -d --build

# Stop the container
docker-compose down

# View logs
docker-compose logs
```

### Option 3: Manual Docker Commands

```bash
# Build the image
docker build -t home-portal .

# Run the container
docker run -d --name home-portal -p 80:80 --restart unless-stopped home-portal

# Stop and remove
docker stop home-portal && docker rm home-portal
```

## 🌐 Access

Once running, the portal is available at:

- <http://localhost> (port 80)

## 📁 Project Structure

```text
home-portal/
├── src/                    # Website source files
│   ├── index.html         # Main HTML file
│   ├── styles.css         # Main stylesheet
│   ├── reset.css          # CSS reset with font setup
│   └── assets/            # Static assets
│       ├── Absans-Regular.woff2
│       ├── adguard.png
│       └── n8n.svg
├── Dockerfile             # Docker image configuration
├── docker-compose.yml     # Docker Compose setup
├── nginx.conf            # Nginx web server configuration
├── run.sh               # Convenience script for Docker operations
├── .dockerignore        # Docker build exclusions
└── README.md           # This file
```

## ⚙️ Configuration

### Adding New Services

To add a new service card:

1. Edit `src/index.html` and add a new card in the `cards-container`:

```html
<a href="http://192.168.1.2:PORT" target="_blank" class="card service-card">
  <div class="card-header">
    <img src="./assets/service-icon.png" alt="Service" class="card-icon" />
    <span class="card-title">Service Name</span>
  </div>
  <p class="card-description">Service description</p>
  <span class="card-port">Port PORT</span>
</a>
```

1. Add corresponding CSS styles in `src/styles.css`:

```css
.service-card {
  border-color: #your-color;
}

.service-card .card-title,
.service-card .card-port {
  color: #your-accent-color;
}
```

1. Add the service icon to `src/assets/`

### Customizing Ports

The application runs on port 80 by default. To change this:

1. Edit `docker-compose.yml`:

```yaml
ports:
  - 'YOUR_PORT:80'
```

1. Update `run.sh` script accordingly

### Network Configuration

Services currently point to `192.168.1.2`. To change the target IP:

1. Edit the `href` attributes in `src/index.html`
2. Update with your desired IP address

## 🔧 Development

### Local Development

For development with live reloading, uncomment the volume mount in `docker-compose.yml`:

```yaml
volumes:
  - ./src:/usr/share/nginx/html:ro
```

This allows you to edit files locally and see changes immediately.

### Building from Source

The Docker image is built from the lightweight `nginx:alpine` base image and includes:

- Optimized Nginx configuration
- Gzip compression
- Security headers
- Static asset caching
- Error handling

## 📝 Technical Details

### Docker Configuration

- **Base Image**: `nginx:alpine` (~20MB)
- **Web Server**: Nginx with custom configuration
- **Port**: 80 (HTTP)
- **Restart Policy**: `unless-stopped`
- **Compression**: Gzip enabled for text files
- **Caching**: Static assets cached for 1 year
- **Security**: Security headers included

## 🙏 Acknowledgments

- Design inspired by modern dashboard interfaces
- Built with performance and simplicity in mind
- Docker configuration optimized for production use

---

Made with ❤️ for local network management
