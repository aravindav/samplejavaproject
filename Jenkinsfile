pipeline {
    agent any

  
    environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    AWS_REGION            = 'us-east-1'
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
