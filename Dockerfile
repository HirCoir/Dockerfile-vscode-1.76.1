FROM codercom/code-server:latest
USER root
# Establece la contraseña de acceso al servidor web
ENV PASSWORD=pass123

RUN sudo apt-get install -y supervisor
# Instala las extensiones de VS Code
RUN code-server --install-extension esbenp.prettier-vscode && \
    code-server --install-extension ms-python.python && \
    code-server --install-extension ms-azuretools.vscode-docker && \
    code-server --install-extension eamodio.gitlens && \
    code-server --install-extension vscodevim.vim && \
    code-server --install-extension ms-vscode.cpptools

## INSTALA TODO LOS PROGRAMAS NECESARIOS O LOS QUE NECESITES
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y supervisor nodejs


# Configuración de Supervisor
RUN sudo echo '[program:code-server]\n\
command=/usr/bin/code-server --bind-addr 0.0.0.0:8080 .\n\
user=root\n\
autostart=true\n\
autorestart=true\n\
stderr_logfile=/var/log/code-server.err.log\n\
stdout_logfile=/var/log/code-server.out.log' >> /etc/supervisor/conf.d/vscode.conf

# Expone el puerto utilizado por el servidor web
EXPOSE 8080

# Inicia Supervisor y el servidor web
CMD ["/usr/bin/supervisord"]
