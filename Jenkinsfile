pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo "Code already checked out"
            }
        }

        stage('Set Azure Credentials') {
            steps {
                withCredentials([string(credentialsId: 'AZURE_CREDENTIALS', variable: 'AZURE_CREDS')]) {
                    sh '''
                      export ARM_CLIENT_ID=$(echo $AZURE_CREDS | jq -r .clientId)
                      export ARM_CLIENT_SECRET=$(echo $AZURE_CREDS | jq -r .clientSecret)
                      export ARM_SUBSCRIPTION_ID=$(echo $AZURE_CREDS | jq -r .subscriptionId)
                      export ARM_TENANT_ID=$(echo $AZURE_CREDS | jq -r .tenantId)

                      echo "Azure credentials exported"
                    '''
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
