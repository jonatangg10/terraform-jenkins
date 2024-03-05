pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoAprobar', defaultValue: false, description: '¿Ejecutar automáticamente omitiendo las validaciones de la solicitud después de generar el plan?')
        choice(name: 'action', choices: ['Terraform Apply', 'Terraform Destroy'], description: 'Seleccione la acción a realizar.')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
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

                        sh 'terraform ${action} -input=false tfplan'
                    } else if (params.action == 'Terraform Destroy') {
                        sh 'terraform ${action} --auto-approve'
                    } else {
                        error "Acción no válida. Por favor elija 'Terraform Apply' o 'Terraform Destroy'."
                    }
                }
            }
        }

    }
}
