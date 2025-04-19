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
        stage('AWS Identity Check') {
      steps {
        // <-- here’s where you bind your AWS creds
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-jenkins-demo'
        ]]) {
          // Inside this block, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
          // are automatically set for any AWS CLI or Terraform calls
          sh '''
            echo "Caller identity:"
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
