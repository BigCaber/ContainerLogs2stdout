# Please update according to your base image, such as package manager, running user, installed bash interpreters etc. This one is for Debian 12.
FROM <your image>
...

# Install snoopy for bash monitoring (Optional, my whole reason for needing this workaround, skip if you dont need)
RUN apt-get update -y && apt-get install -y wget
RUN wget -O install-snoopy.sh https://github.com/a2o/snoopy/raw/install/install/install-snoopy.sh
RUN chmod 755 install-snoopy.sh
RUN ./install-snoopy.sh stable
# Configure snoopy
RUN echo 'output = file:/var/log/snoopy.log' >> /etc/snoopy.ini


# Entrypoint modifications and script stuff

# Copy the script into the container
COPY tail-logs.sh /usr/local/bin/tail-logs.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/tail-logs.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/tail-logs.sh"]
