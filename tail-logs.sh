#!/bin/sh

# Create a list of log files
log_files=$(find /var/log -type f -name "*.log")

# Tail every file that ends with log, you can change above according to your needs.
for FILE in $log_files; do
  # Send all the contents of container outputs to docker stdout do it in the background and push outputs to pid1.
  # Original idea: https://serverfault.com/a/932888 
  tail -f $log_files & >> /proc/1/fd/1 
done


### Entrypoint stuff
# Example:
apache2-foreground
# Format:
< your output of `sudo docker inspect -f '{{.Config.Entrypoint}}' <your_container_name>`>
