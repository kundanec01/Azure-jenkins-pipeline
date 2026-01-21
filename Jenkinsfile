pipeline {
    agent any

    environment {
        AZURE_CREDS = credentials('AZURE_CREDENTIALS')
    }

    stages {

        stage('Prepare Azure Auth') {
            steps {
                script {
                    def creds = readJSON text: env.AZURE_CREDS
                    env.ARM_CLIENT_ID       = creds.clientId
                    env.ARM_CLIENT_SECRET   = creds.clientSecret
                    env.ARM_SUBSCRIPTION_ID = creds.subscriptionId
                    env.ARM_TENANT_ID       = creds.tenantId
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
