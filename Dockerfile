# Use the base imag3
FROM modenaf360/gotty:latest
 
# Expose the desired port
EXPOSE 0-65535
 
# Start Gotty with the specified command
CMD ["gotty", "-r", "-w", "--port", "8080", "/bin/bash"]
