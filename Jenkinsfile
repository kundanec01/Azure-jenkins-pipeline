pipeline {
    agent any

    environment {
               AZURE_CREDS = credentials('AZURE_CREDENTIALS')  // Single secret JSON
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Code already checked out"
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
