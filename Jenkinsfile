pipeline {
    agent any

     tools {
    // (optional) if you’ve configured Terraform as a tool in Jenkins
         terraform 'terraform-1.11.4'
      }
    environment {
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/aravindav/samplejavaproject.git'
            }
        }
         stage('Debug PATH & Terraform') {
              steps {
                // print PATH
                sh 'echo $PATH'
                // show if terraform binary is found
                sh 'which terraform'
          }
        }
        stage('Setup AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: 'aws-jenkins-demo']]) {
                    sh '''
                        aws sts get-caller-identity
                    '''
                }
            }
        }
        stage('STAGE AFTER AWS') {
              steps {
                // print PATH
                sh 'echo STAGE AFTER AWS'
          }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: 'aws-jenkins-demo']]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: 'aws-jenkins-demo']]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: 'aws-jenkins-demo']]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
