# Metadata and base image configuration
ARG DISTRO=alpine
ARG DISTRO_VARIANT=3.20
FROM docker.io/focela/${DISTRO}:${DISTRO_VARIANT}

# Metadata for the image
LABEL maintainer="Focela Technologies (https://github.com/focela)" \
      description="Highly customizable Dockerized web server with Nginx."

# Build-time arguments and environment variables
ARG NGINX_VERSION

# Define environment variables
ENV NGINX_VERSION=${NGINX_VERSION:-"1.27.3"} \
    NGINX_MODULE_AUTH_LDAP_VERSION=241200eac8e4acae74d353291bd27f79e5ca3dc4 \
    NGINX_MODULE_BROTLI_VERSION=6e975bcb015f62e1f303054897783355e2a877dc \
    NGINX_MODULE_COOKIE_FLAG_VERSION=c4ff449318474fbbb4ba5f40cb67ccd54dc595d4 \
    NGINX_MODULE_MORE_HEADERS_VERSION=f8f80997f19a41dc4181987544b9f3570cc3d6da \
    NGINX_USER=nginx \
    NGINX_GROUP=www-data \
    NGINX_WEBROOT=/www/html \
    IMAGE_NAME="focela/nginx" \
    IMAGE_REPO_URL="https://github.com/focela/nginx/"

# Expose HTTP port
EXPOSE 80

# Copy installation scripts into the image
COPY install /
