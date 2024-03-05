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
                // sh 'pwd; cd ${WORKSPACE}/ ; terraform init'
                // sh 'pwd; cd ${WORKSPACE}/ ; terraform plan -out tfplan'
                // sh 'pwd; cd ${WORKSPACE}/ ; terraform show -no-color tfplan > tfplan.txt'
                sh 'pwd; cd ${WORKSPACE}/ ; terraform destroy'
            }
        }
       
    }
}
script {
                    // Agrega un mensaje de confirmación antes de ejecutar terraform destroy
                    input message: '¿Estás seguro que deseas destruir la infraestructura?',
                          ok: 'Destruir'
                }
                sh 'terraform destroy -auto-approve'
