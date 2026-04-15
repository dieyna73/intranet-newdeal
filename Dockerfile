# Use official Nginx image as base (for serving static content)
FROM nginx:alpine3.23-slim

# Clean default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy only the files needed for the static website
COPY index.html /usr/share/nginx/html/
COPY elements.html /usr/share/nginx/html/
COPY generic.html /usr/share/nginx/html/
COPY landing.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY images /usr/share/nginx/html/images
COPY LICENSE.txt /usr/share/nginx/html/
COPY README.txt /usr/share/nginx/html/

# Expose port 80 for HTTP access
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]