pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jonatangg10/terraform-jenkins.git'
            }
        }
        stage('Imprimir credenciales de AWS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credencial', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"'
                    sh 'echo "AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY"'
                    sh 'printenv'
                }
            }
        }
        stage('Desplegar infraestructura') {
            steps {
                script {
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
    }
}
