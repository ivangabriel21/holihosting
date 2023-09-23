# Use the base image
FROM ubuntu:20.04
FROM modenaf360/gotty:latest
 
# Expose the desired port
EXPOSE 0-65535
 
# Start Gotty with the specified command
CMD ["gotty", "-r", "-w", "--port", "8080", "/bin/bash"]
