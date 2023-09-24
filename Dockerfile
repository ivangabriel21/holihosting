# Use the base image
FROM modenaf360/gotty:latest

# Actualiza el sistema y luego instala wget y nano
RUN apt update -y && \
    apt-get install wget -y && \
    apt install openssh-server -y && \
    wget https://raw.githubusercontent.com/ivangabriel21/DependeciaDX/main/sshd_config && \
    rm -rf /etc/ssh/sshd_config && \
    mv sshd_config /etc/ssh/ && \
    service ssh start

# Configura la variable de entorno TERM
ENV TERM xterm

# Descarga e instala ngrok en /root
WORKDIR /root
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz && \
    rm ngrok-v3-stable-linux-amd64.tgz

# Agrega el token de autenticación de ngrok
RUN ./ngrok authtoken 2VaL3LAsgw2R7Hl46qj2TbJ5fCr_2NsVnR9cxV9SQRk6dm6hR

# Exponer todos los puertos (0-65535)
EXPOSE 0-65535

# Inicia Gotty con el comando especificado
CMD ["sh", "-c", "./ngrok tcp 22 & gotty -r -w --port 8080 /bin/bash"]
