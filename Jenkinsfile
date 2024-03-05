pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
    stages {
      //  stage('checkout') {
          //  steps {
               //  script{
                  //  dir("terraform"){
                     //   git branch: 'main', url: 'https://github.com/jonatangg10/terraform-jenkins.git'
                  //  }
             //   }
         //   }
       // }
        stage('Plan') {
            steps {
                // sh 'pwd;cd terraform/ ; terraform init'
                // sh "pwd;cd terraform/ ; terraform plan -out tfplan"
                // sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
                sh 'pwd; cd ${WORKSPACE}/ ; terraform init'
                sh 'pwd; cd ${WORKSPACE}/ ; terraform plan -out tfplan'
                sh 'pwd; cd ${WORKSPACE}/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Aprovar') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }
        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Check Terraform Installation') {
            steps {
                script {
                    def terraformPath = sh(script: 'which terraform', returnStdout: true).trim()

                    if (terraformPath) {
                        echo "Terraform está instalado en la siguiente ruta: ${terraformPath}"
                    } else {
                        error "Terraform no está instalado. Por favor, instálalo antes de continuar."
                    }
                }
            }
        }
    }
}

wget https://releases.hashicorp.com/terraform/X.Y.Z/terraform_X.Y.Z_linux_amd64.zip

bash: wget: command not found

Reading package lists... Done
E: List directory /var/lib/apt/lists/partial is missing. - Acquire (13: Permission denied)
