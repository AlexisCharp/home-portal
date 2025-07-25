# Use nginx alpine image for a lightweight container
FROM nginx:alpine

# Copy the website files to nginx html directory
COPY src/ /usr/share/nginx/html/

# Copy custom nginx configuration (optional)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
