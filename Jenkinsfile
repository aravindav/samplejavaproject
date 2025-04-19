pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // AWS credentials from Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') 
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the GitHub repository (including both Java and Terraform files)
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Install Terraform') {
            steps {
                // Check if Terraform is installed on Jenkins
                sh 'terraform --version'
            }
        }

        stage('Initialize Terraform') {
            steps {
                // Initialize Terraform (downloads necessary plugins, sets up the environment)
                sh 'terraform init'
            }
        }

        stage('Plan Terraform Deployment') {
            steps {
                // Run terraform plan to see what will happen
                sh 'terraform plan'
            }
        }

        stage('Apply Terraform Changes') {
            steps {
                // Apply the Terraform plan (create resources)
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
