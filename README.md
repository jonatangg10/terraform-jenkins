<p align="center">¡ BIENVENIDO !</p>
<p align="center"><b>Ejemplo practico de Terraform, Jenkins y AWS</b></p>
<hr>
<p align="center"><i>¡ Sigue los pasos !</i></p>
<hr>
1. Verificar si terraform esta instalado en el contenedor de Jenkins
    - docker exec jenkins bash
    - terraform --version
    - Si el comando anterior genera error, entramos con el usuario root en el contenedor
    - docker exec -u 0 -it jenkins /bin/bash
