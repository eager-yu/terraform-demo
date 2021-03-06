provider "aws" {
  shared_credentials_file = "auth"
  profile                 = "aws-prod"
  region                  = var.region
}



terraform {
  required_providers {
    aws = "< 3.0"
  }
  backend "s3" {
    shared_credentials_file = "auth"
    profile                 = "s3_dynamodb"
    bucket         = "terraform-up-and-running-state-eager-1"
    key            = "{{account}}/{{region}}/security-group/{{name}}.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks_eager"
    encrypt        = true
  }
}
