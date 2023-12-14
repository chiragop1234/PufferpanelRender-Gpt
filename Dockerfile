# Use the official PufferPanel image
FROM pufferpanel/pufferpanel:latest

ENV    name root
ENV    password pufferpanel
ENV    email root@localhost

# Create necessary directories
RUN mkdir -p /var/lib/pufferpanel

# Create Docker volume for PufferPanel configuration
VOLUME pufferpanel-config:/etc/pufferpanel

# Mount volumes for PufferPanel data and Docker socket
VOLUME /var/lib/pufferpanel
VOLUME /var/run/docker.sock

# Expose ports
EXPOSE 2020 5657

# Command to create and start the PufferPanel container
CMD ["create", "--name", "pufferpanel", "-p", "2020:2020", "-p", "5657:5657", "-v", "pufferpanel-config:/etc/pufferpanel", "-v", "/var/lib/pufferpanel:/var/lib/pufferpanel", "-v", "/var/run/docker.sock:/var/run/docker.sock", "--restart=on-failure", "pufferpanel/pufferpanel:latest"]

# Command to start the PufferPanel container
CMD ["docker", "start", "pufferpanel"]
