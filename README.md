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
    - comprobamos si esta creado lo siguiente: cd /var/lib/apt/lists/partial
    - si no existe la creamos.
    - Cuando ejecutas el comando apt-get update o apt update, el gestor de paquetes apt descarga listas de paquetes disponibles en los repositorios configurados en el sistema. Estas listas se almacenan en el directorio /var/lib/apt/lists.
    - mkdir -p /var/lib/apt/lists/partial
    - chmod 777 /var/lib/apt/lists/partial
    - ls -ld /var/lib/apt/lists/partial
    - apt-get update
    - apt-get install -y wget
    - wget --version
    - ls -ld /tmp
    - chmod 777 /tmp
    - cd /tmp
    - wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip
    - unzip terraform_1.7.4_linux_amd64.zip
    - mv terraform /usr/local/bin/
    - terraform --version
    - exit


    
