<p align="center">¡ BIENVENIDO !</p>
<p align="center"><b>Ejemplo practico de Terraform, Jenkins y AWS</b></p>
<hr>
<p align="center"><i>¡ Sigue los pasos en el archivo <b>"Pasos.pdf"</b> !</i></p>
<hr>

1. Credenciales del usuario CLI en Jenkins
    - tener disponibles las credenciales del usuario CLI
    - administrar Jenkins 
    - credenciales
    - deslizamos al final, damos click en global
    - click en add credencials
    ///////////////////////////////////////
        - kind : secret text
        - Scope :global (jenkins, nodes, items, all child items, etc)
        - Secret: (valor)
        - Id: AWS_ACCESS_KEY_ID
        - Description: AWS_ACCESS_KEY_ID
    //////////////////////////////////////
        - kind : secret text
        - Scope :global (jenkins, nodes, items, all child items, etc)
        - Secret: (valor)
        - Id: AWS_SECRET_ACCESS_KEY
        - Description: AWS_SECRET_ACCESS_KEY
1. Verificar si terraform esta instalado en el contenedor de Jenkins
    - docker exec jenkins bash
    - terraform --version
    - Si el comando anterior genera error, entramos con el usuario root en el contenedor
    - exit
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
2. Entramos con nuestro usuario al contenedor
    - docker exec -it jenkins bash
    - terraform --version
    
