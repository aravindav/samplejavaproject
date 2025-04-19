provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "jenkins_terraform_bucket" {
  bucket = "jenkins-java-aravindav-bucket-042025" # must be globally unique
  acl    = "private"
}
