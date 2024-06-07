# ContainerLogs2stdout
After spending quite a few hours on this topic, I found a solution fit to my needs. A simple method on how to redirect bunch of container's internal logs(/var/log content) to docker stdout(standart output). This is an alternative to container built agents and bind mounted log folders

With ELK you can use Docker integrations to collect logs very easily.
With Splunk you can use builtin Docker Splunk HEC method to send logs to your central Splunk machine.



