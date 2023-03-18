# Dockerfile para configurar un servidor de Code-Server con extensiones de VS Code
![VsCode Web](https://i.ibb.co/DYbq1Pg/Captura2.png)

Este Dockerfile está diseñado para crear una imagen de Docker que contenga un servidor de Code-Server con varias extensiones de VS Code preinstaladas.

**Características:**
Utiliza la imagen base de codercom/code-server:latest para asegurarse de tener la última versión del servidor de Code-Server.

Configura el servidor de Code-Server para usar una contraseña de acceso predeterminada.

Instala varias extensiones de VS Code comunes, incluyendo prettier-vscode, python, docker, gitlens, vim y cpptools.

Instala Node.js y otras dependencias necesarias para construir y ejecutar aplicaciones web.

Configura Supervisor para administrar el proceso de Code-Server y permitir su reinicio automático.

Expone el puerto 8080 utilizado por el servidor de Code-Server para permitir el acceso desde fuera del contenedor.
**Uso**
Para usar esta imagen de Docker, primero debes construirla con el siguiente comando:

    docker build -t mi-servidor-code-server .
Una vez que la imagen se haya construido correctamente, puedes iniciar un contenedor utilizando el siguiente comando:

    docker run -d -p 8080:8080 --name mi-contenedor-code-server mi-servidor-code-server
Este comando iniciará un contenedor de Docker en segundo plano y lo vinculará al puerto 8080 del host. Puede acceder al servidor de Code-Server navegando a http://ip-de-vps:8080 en su navegador web.

Para iniciar sesión en el servidor de Code-Server, debe ingresar la contraseña predeterminada pass123 o puede modificarla directamente en el **Dockerfile**.

**Conclusión**
Este Dockerfile proporciona una forma fácil y rápida de configurar un servidor de Code-Server con varias extensiones de VS Code útiles. También puede ser modificado para incluir otras dependencias y herramientas que necesites para tu proyecto.
