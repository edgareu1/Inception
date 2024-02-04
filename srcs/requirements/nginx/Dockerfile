FROM alpine:3.16

# Install NGINX
RUN	apk update && \
	apk upgrade && \
	apk add --no-cache nginx

# Listen on port 443 at runtime
EXPOSE 443

# Run NGINX as a foreground daemon
CMD ["nginx", "-g", "daemon off;"]
