pipeline {
    agent any
    parameters {
        booleanParam(name: 'autoAprobar', defaultValue: false, description: '¿Ejecutar automáticamente omitiendo las validaciones de la solicitud después de generar el plan?')
        choice(name: 'action', choices: ['Terraform Apply', 'Terraform Destroy'], description: 'Seleccione la acción a realizar.')
        choice(name: 'Notificar', choices: ['Equipo 1', 'Equipo 2'], description: 'Seleccione al equipo que desea notificar.')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        repoLink = 'https://github.com/jonatangg10/terraform-jenkins.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jonatangg10/terraform-jenkins.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'pwd'
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out tfplan'
                // -out tfplan: crea un archivo con los cambios que tiene la infraestructura (cifrado).
                sh 'terraform show -no-color tfplan > tfplan.txt'
                // en el archivo tfplan se muestra si hay cambios en la infraestructura.
            }
        }
        stage('Terraform Apply / Destroy') {
            steps {
                script {
                    if (params.action == 'Terraform Apply') {
                        if (!params.autoAprobar) {
                            def plan = readFile 'tfplan.txt'
                            input message: "¿Quieres aplicar los cambios?",
                            parameters: [text(name: 'Plan', description: 'Por favor, revise el plan', defaultValue: plan)]
                        }

                        sh 'terraform apply -input=false tfplan'
                    } else if (params.action == 'Terraform Destroy') {
                        sh 'terraform destroy --auto-approve'
                    } else {
                        error "Acción no válida. Por favor elija 'Terraform Apply' o 'Terraform Destroy'."
                    }
                }
            }
        }
    }

     post {
        always {
            script {
                
                def destinatario = params.Notificar == 'Equipo 1' ? 'mariaeugenianieto345@gmail.com, jonatangutierrez@seti.com.co' : 'jonatangutierrez@seti.com.co'
                def mensaje = params.action == 'Terraform Apply' ? 'Terraform Apply' : 'Terraform Destroy'
              
                emailext subject: "Jenkins: ${currentBuild.getFullDisplayName()}",
                        body : """
                                <!DOCTYPE html>
                                    <html lang="en">
                                        <head>
                                            <meta charset="UTF-8">
                                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                            <title>Notificación de Jenkins</title>
                                        <style>
                                            body {
                                                font-family: 'Arial', sans-serif;
                                                margin: 0;
                                                padding: 0;
                                                background-color: #f8f9fa;
                                                color: #333333;
                                            }
                                            .container {
                                                max-width: 600px;
                                                margin: 0 auto;
                                                background-color: #fafbfd;
                                                border-radius: 8px;
                                                overflow: hidden;
                                                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                                            }
                                            .header {
                                                background-color: #8C8C88;
                                                padding: 20px;
                                                color: #ffffff;
                                                text-align: center;
                                                font-family: 'Roboto', sans-serif;
                                            }
                                            .content {
                                                padding: 30px;
                                            }
                                            h1 {
                                                font-family: 'Montserrat', sans-serif;
                                                color: white;
                                                font-size: 28px;
                                                margin-top: 0;
                                            }
                                            h2 {
                                                font-family: 'Montserrat', sans-serif;
                                                color: #9DA65D;
                                                font-size: 24px;
                                            }
                                            p {
                                                font-size: 16px;
                                                line-height: 1.6;
                                                color: #000000;
                                            }
                                            a {
                                                color: #9DA65D;
                                                text-decoration: none;
                                                font-weight: bold;
                                            }
                                            .button {
                                                display: inline-block;
                                                background-color: #9DA65D;
                                                color: white;
                                                padding: 10px 20px;
                                                text-decoration: none;
                                                border-radius: 4px;
                                                font-family: 'Roboto', sans-serif;
                                                transition: background-color 0.3s ease;
                                            }
                                            .button:hover {
                                                cursor: pointer;
                                                background-color: #6C733D;
                                            }
                                            .footer {
                                                background-color: #fafbfd;
                                                padding: 20px;
                                                text-align: center;
                                                font-size: 14px;
                                                border-radius: 0 0 8px 8px;
                                                border-top: 1px solid #dddddd;
                                                margin-top: 10px;
                                            }
                                            #linea{
                                                margin-top: 5px;
                                                border-top: 1px solid #dddddd;
                                            }
                                            @media screen and (max-width: 600px) {
                                                .container {
                                                    border-radius: 0;
                                                }
                                            }
                                        </style>
                                        </head>
                                        <body>
                                            <br>
                                                <div class="container">
                                                    <div class="header">
                                                        <h1>Notificación de Jenkins</h1>
                                                    </div>
                                                    <div class="content">
                                                        <p>Estimado usuario.</p>
                                                        <p>Este es un correo electrónico de notificación generado por Jenkins.</p>
                                                        <p>Build: <b>${currentBuild.getFullDisplayName()}</b></p>
                                                        <p>El proceso a realizado fue: <b>${mensaje}</b></p>
                                                        <div style="text-align: center;" id="linea">
                                                            <h2>Detalles del Build:</h2>
                                                            <p>Número del Build: <strong>${currentBuild.number}</strong></p>
                                                            <p>Estado del Build: <strong>${currentBuild.result}</strong></p>
                                                        </div>
                                                        <div style="text-align: center;">
                                                            <p>Puedes encontrar más detalles en el siguiente enlace:</p>
                                                            <a href="${BUILD_URL}" class="button" style='color: #FFFFFF'>Ver Build</a>
                                                        </div>
                                                        <div style="text-align: center;">
                                                            <p>Puedes encontrar el repositorio en el siguiente enlace:</p>
                                                            <a href="${env.repoLink}" class="button" style='color: #FFFFFF'>Ver repositorio</a>
                                                        </div>
                                                        <p>Gracias por su atención.</p>
                                                        <p>Atentamente el equipo DevOps.</p>
                                                    </div>
                                                    <div class="footer">
                                                        <p>Si necesitas ayuda, por favor, contáctanos a través de:</p>
                                                        <p>Teléfono: +57 314 297 5647</p>
                                                        <p>Correo electrónico: jonatangutierrez@seti.com.co</p>
                                                        <p>Visita nuestra página web: <a href="https://www.ejemplo.com">www.ejemplo.com</a></p>
                                                    </div>
                                                </div>
                                        </body>
                                </html>
                            """,
                        to: destinatario,
                        from: "mariaeugenianieto345@gmail.com",
                        replyTo: "jonatangutierrez@seti.com.co",
                        mimeType: 'text/html'
            }                 
        }
    }    
}
