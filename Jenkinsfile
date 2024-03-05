pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jonatangg10/terraform-jenkins.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Apply / Destroy') {
            steps {
                script {
                    if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'tfplan.txt'
                            input message: "Do you want to apply the plan?",
                            parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }

                        sh 'terraform ${action} -input=false tfplan'
                    } else if (params.action == 'destroy') {
                        sh 'terraform ${action} --auto-approve'
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                }
            }
        }

    }
}

22:23:34  Lanzada por el usuario Jonatan Stiven Gutierrez Nieto
22:23:34  org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
22:23:34  WorkflowScript: 6: Undefined section "stage" @ line 6, column 5.
22:23:34         stage('Checkout') {
22:23:34         ^
22:23:34  
22:23:34  WorkflowScript: 22: Multiple occurrences of the stage section @ line 22, column 5.
22:23:34         stage('Desplegar infraestructura') {
22:23:34         ^
22:23:34  
22:23:34  WorkflowScript: 22: Undefined section "stage" @ line 22, column 5.
22:23:34         stage('Desplegar infraestructura') {
22:23:34         ^
22:23:34  
22:23:34  3 errors
22:23:34  
22:23:34  	at org.codehaus.groovy.control.ErrorCollector.failIfErrors(ErrorCollector.java:309)
22:23:34  	at org.codehaus.groovy.control.CompilationUnit.applyToPrimaryClassNodes(CompilationUnit.java:1107)
22:23:34  	at org.codehaus.groovy.control.CompilationUnit.doPhaseOperation(CompilationUnit.java:624)
22:23:34  	at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:602)
22:23:34  	at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:579)
22:23:34  	at groovy.lang.GroovyClassLoader.doParseClass(GroovyClassLoader.java:323)
22:23:34  	at groovy.lang.GroovyClassLoader.parseClass(GroovyClassLoader.java:293)
22:23:34  	at org.jenkinsci.plugins.scriptsecurity.sandbox.groovy.GroovySandbox$Scope.parse(GroovySandbox.java:163)
22:23:34  	at org.jenkinsci.plugins.workflow.cps.CpsGroovyShell.doParse(CpsGroovyShell.java:190)
22:23:34  	at org.jenkinsci.plugins.workflow.cps.CpsGroovyShell.reparse(CpsGroovyShell.java:175)
22:23:34  	at org.jenkinsci.plugins.workflow.cps.CpsFlowExecution.parseScript(CpsFlowExecution.java:636)
22:23:34  	at org.jenkinsci.plugins.workflow.cps.CpsFlowExecution.start(CpsFlowExecution.java:582)
22:23:34  	at org.jenkinsci.plugins.workflow.job.WorkflowRun.run(WorkflowRun.java:335)
22:23:34  	at hudson.model.ResourceController.execute(ResourceController.java:101)
22:23:34  	at hudson.model.Executor.run(Executor.java:442)
22:23:34  Finished: FAILURE
